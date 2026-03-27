param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [Parameter(Mandatory = $false)]
    [string]$RulesOut = "references/mixed-rules.jsonl",
    [Parameter(Mandatory = $false)]
    [string]$ContrastOut = "references/mixed-contrast.jsonl",
    [Parameter(Mandatory = $false)]
    [string]$TemplatesOut = "references/mixed-templates.jsonl"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$script:SkippedCount = 0

function Read-Items {
    param([string]$Path)

    $raw = Get-Content -Raw -Path $Path
    $trim = $raw.Trim()

    if ($trim.StartsWith("[")) {
        return @($trim | ConvertFrom-Json)
    }

    $items = @()
    foreach ($line in ($raw -split "`r?`n")) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        try {
            $items += ($line | ConvertFrom-Json)
            continue
        } catch {
            # Tolerate copied JSONL with unescaped HTML/ARIA attribute quotes.
            $fixed = $line
            $fixed = [regex]::Replace($fixed, '([A-Za-z-]+)="([^"]*)"', '$1=''$2''')
            # Tolerate free-form quoted phrases inside already-quoted JSON string values.
            $fixed = [regex]::Replace($fixed, '(?<=\s)"([^"]+)"(?=\s)', { param($m) "'" + $m.Groups[1].Value + "'" })
            $fixed = $fixed -replace '""', "''"
            try {
                $items += ($fixed | ConvertFrom-Json)
            } catch {
                $script:SkippedCount++
                continue
            }
        }
    }
    return $items
}

function Has-Prop {
    param([object]$Obj, [string]$Name)
    return $null -ne $Obj.PSObject.Properties[$Name]
}

function Ensure-Dir {
    param([string]$Path)
    $dir = Split-Path -Parent $Path
    if (-not [string]::IsNullOrWhiteSpace($dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
}

$items = Read-Items -Path $InputPath
$rules = New-Object System.Collections.Generic.List[string]
$contrast = New-Object System.Collections.Generic.List[string]
$templates = New-Object System.Collections.Generic.List[string]

foreach ($item in $items) {
    $isTemplate = (Has-Prop $item "template_name") -or (Has-Prop $item "prompt_template")
    $isContrast = (Has-Prop $item "bad_prompt") -or (Has-Prop $item "good_prompt")
    $isRule = (Has-Prop $item "positive_prompt") -and (Has-Prop $item "negative_taboo") -and (Has-Prop $item "scene")

    if ($isTemplate) {
        $templates.Add(($item | ConvertTo-Json -Depth 8 -Compress))
        continue
    }

    if ($isContrast) {
        $contrast.Add(($item | ConvertTo-Json -Depth 8 -Compress))
        continue
    }

    if ($isRule) {
        $rules.Add(($item | ConvertTo-Json -Depth 8 -Compress))
        continue
    }
}

Ensure-Dir $RulesOut
Ensure-Dir $ContrastOut
Ensure-Dir $TemplatesOut

$rules -join "`n" | Set-Content -Path $RulesOut -Encoding UTF8
$contrast -join "`n" | Set-Content -Path $ContrastOut -Encoding UTF8
$templates -join "`n" | Set-Content -Path $TemplatesOut -Encoding UTF8

Write-Output "Input items: $($items.Count)"
Write-Output "Skipped malformed lines: $script:SkippedCount"
Write-Output "Rules: $($rules.Count) -> $RulesOut"
Write-Output "Contrast: $($contrast.Count) -> $ContrastOut"
Write-Output "Templates: $($templates.Count) -> $TemplatesOut"
