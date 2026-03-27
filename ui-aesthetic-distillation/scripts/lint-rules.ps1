param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Has-Property {
    param(
        [object]$Object,
        [string]$Name
    )
    return $null -ne $Object.PSObject.Properties[$Name]
}

$requiredFields = @("category", "scene", "positive_prompt", "negative_taboo", "checklist")
$ambiguousTerms = @("高级感", "好看", "精致", "现代", "简洁", "漂亮")
$measurementRegex = '\d+(\.\d+)?\s?(px|ms|rem|%)|\d+:\d+|WCAG|clamp\(|Grid|breakpoint|对比度|行高|opacity\s*[:=]\s*\d+(\.\d+)?|aria-[a-z-]+|role\s*=\s*["'']?[a-z-]+|keycode\s*\d+|z-index\s*\d+|tab\s*index\s*-?\d+'

$items = Get-Content -Raw -Path $InputPath | ConvertFrom-Json
if ($items -isnot [System.Array]) {
    $items = @($items)
}

$issues = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]

for ($i = 0; $i -lt $items.Count; $i++) {
    $item = $items[$i]
    $id = if ((Has-Property -Object $item -Name "id") -and $item.id) { $item.id } else { $i + 1 }

    foreach ($f in $requiredFields) {
        if (-not (Has-Property -Object $item -Name $f)) {
            $issues.Add("id=$id missing field: $f")
            continue
        }

        if ($null -eq $item.$f -or ([string]::IsNullOrWhiteSpace("$($item.$f)") -and $f -ne "checklist")) {
            $issues.Add("id=$id missing field: $f")
        }
    }

    $checkCount = if ((Has-Property -Object $item -Name "checklist") -and $item.checklist) { @($item.checklist).Count } else { 0 }
    if ($checkCount -lt 5 -or $checkCount -gt 8) {
        $warnings.Add("id=$id checklist count is $checkCount (recommended 5-8)")
    }

    $positivePrompt = if (Has-Property -Object $item -Name "positive_prompt") { "$($item.positive_prompt)" } else { "" }
    if ($positivePrompt -notmatch $measurementRegex) {
        $warnings.Add("id=$id positive_prompt may be non-measurable")
    }

    foreach ($term in $ambiguousTerms) {
        if ($positivePrompt -match $term) {
            $warnings.Add("id=$id contains ambiguous term: $term")
            break
        }
    }
}

Write-Output "Items: $($items.Count)"
Write-Output "Critical issues: $($issues.Count)"
Write-Output "Warnings: $($warnings.Count)"

if ($issues.Count -gt 0) {
    Write-Output "\nCritical:"
    $issues | ForEach-Object { Write-Output "- $_" }
}

if ($warnings.Count -gt 0) {
    Write-Output "\nWarnings:"
    $warnings | ForEach-Object { Write-Output "- $_" }
}

if ($issues.Count -gt 0) {
    exit 1
}
