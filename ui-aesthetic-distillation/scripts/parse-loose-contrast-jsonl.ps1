param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "references/contrast-loose-fixed.jsonl",
    [Parameter(Mandatory = $false)]
    [string]$SourceOverride = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Extract-Between {
    param(
        [string]$Text,
        [string]$StartMarker,
        [string]$EndMarker
    )

    $start = $Text.IndexOf($StartMarker, [System.StringComparison]::Ordinal)
    if ($start -lt 0) { return "" }
    $valueStart = $start + $StartMarker.Length
    $end = $Text.IndexOf($EndMarker, $valueStart, [System.StringComparison]::Ordinal)
    if ($end -lt 0) { return "" }
    return $Text.Substring($valueStart, $end - $valueStart)
}

function Extract-BetweenAny {
    param(
        [string]$Text,
        [string]$StartMarker,
        [string[]]$EndMarkers
    )

    $start = $Text.IndexOf($StartMarker, [System.StringComparison]::Ordinal)
    if ($start -lt 0) { return "" }
    $valueStart = $start + $StartMarker.Length

    $bestEnd = -1
    foreach ($m in $EndMarkers) {
        $idx = $Text.IndexOf($m, $valueStart, [System.StringComparison]::Ordinal)
        if ($idx -ge 0 -and ($bestEnd -lt 0 -or $idx -lt $bestEnd)) {
            $bestEnd = $idx
        }
    }
    if ($bestEnd -lt 0) { return "" }
    return $Text.Substring($valueStart, $bestEnd - $valueStart)
}

function Clean-Value {
    param([string]$Value)
    if ($null -eq $Value) { return "" }
    $v = $Value.Trim()
    if ($v.StartsWith('"')) { $v = $v.Substring(1) }
    if ($v.EndsWith('"')) { $v = $v.Substring(0, $v.Length - 1) }
    return $v.Trim()
}

function Parse-Checklist {
    param([string]$Raw)

    $clean = $Raw.Trim()
    if ([string]::IsNullOrWhiteSpace($clean)) { return @() }

    # Recover items from malformed quoted arrays like:
    # "item1?, "item2", "item3", "item4?, "item5?, "item6"
    # Split on comma + opening quote rather than fully quoted boundaries.
    $parts = $clean -split ',\s*"'
    if ($parts.Count -le 1) {
        # Fallback for well-formed arrays.
        $parts = $clean -split '",\s*"'
    }

    $items = @()
    foreach ($p in $parts) {
        $x = $p.Trim().Trim('"').Replace('\"', '"')
        if (-not [string]::IsNullOrWhiteSpace($x)) {
            $items += $x
        }
    }
    return $items
}

$lines = Get-Content -Path $InputPath
$outLines = New-Object System.Collections.Generic.List[string]
$parsed = 0
$skipped = 0

foreach ($line in $lines) {
    if ([string]::IsNullOrWhiteSpace($line)) { continue }

    $scene = Extract-BetweenAny -Text $line -StartMarker '"scene": "' -EndMarkers @('", "bad_prompt":', ', "bad_prompt":')
    if ([string]::IsNullOrWhiteSpace($scene)) {
        $scene = Extract-BetweenAny -Text $line -StartMarker '"scene":"' -EndMarkers @('","bad_prompt":', ',"bad_prompt":')
    }

    $bad = Extract-BetweenAny -Text $line -StartMarker '"bad_prompt": "' -EndMarkers @('", "good_prompt":', ', "good_prompt":')
    if ([string]::IsNullOrWhiteSpace($bad)) {
        $bad = Extract-BetweenAny -Text $line -StartMarker '"bad\_prompt": "' -EndMarkers @('", "good\_prompt":', ', "good\_prompt":')
    }

    $good = Extract-BetweenAny -Text $line -StartMarker '"good_prompt": "' -EndMarkers @('", "delta":', ', "delta":')
    if ([string]::IsNullOrWhiteSpace($good)) {
        $good = Extract-BetweenAny -Text $line -StartMarker '"good\_prompt": "' -EndMarkers @('", "delta":', ', "delta":')
    }

    $delta = Extract-BetweenAny -Text $line -StartMarker '"delta": "' -EndMarkers @('", "checklist": [', ', "checklist": [')
    $checkRaw = Extract-Between -Text $line -StartMarker '"checklist": [' -EndMarker '], "source":'
    if ([string]::IsNullOrWhiteSpace($checkRaw)) {
        $checkRaw = Extract-Between -Text $line -StartMarker '"checklist": [' -EndMarker '],"source":'
    }
    $source = Extract-Between -Text $line -StartMarker '"source": "' -EndMarker '"}'

    if ([string]::IsNullOrWhiteSpace($scene) -or [string]::IsNullOrWhiteSpace($good)) {
        $skipped++
        continue
    }

    $sourceFinal = if ([string]::IsNullOrWhiteSpace($SourceOverride)) { Clean-Value $source } else { $SourceOverride }
    if ([string]::IsNullOrWhiteSpace($sourceFinal)) { $sourceFinal = "unknown" }

    $obj = [pscustomobject]@{
        scene = Clean-Value $scene
        bad_prompt = Clean-Value $bad
        good_prompt = Clean-Value $good
        delta = Clean-Value $delta
        checklist = Parse-Checklist $checkRaw
        source = $sourceFinal
    }

    $outLines.Add(($obj | ConvertTo-Json -Depth 6 -Compress))
    $parsed++
}

$dir = Split-Path -Parent $OutputPath
if (-not [string]::IsNullOrWhiteSpace($dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

$outLines -join "`n" | Set-Content -Path $OutputPath -Encoding UTF8
Write-Output "Parsed: $parsed"
Write-Output "Skipped: $skipped"
Write-Output "Output: $OutputPath"
