param(
    [Parameter(Mandatory = $true)]
    [string[]]$InputPaths,
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "references/rules-merged.json"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Read-ItemsFromPath {
    param([string]$Path)

    $raw = Get-Content -Raw -Path $Path
    $trim = $raw.Trim()

    if ($trim.StartsWith("[")) {
        return @($trim | ConvertFrom-Json)
    }

    $items = @()
    foreach ($line in ($raw -split "`r?`n")) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        $items += ($line | ConvertFrom-Json)
    }
    return $items
}

$all = @()
foreach ($path in $InputPaths) {
    $all += Read-ItemsFromPath -Path $path
}

$seen = @{}
$result = @()
$nextId = 1

foreach ($item in $all) {
    $category = "$($item.category)".Trim()
    $scene = "$($item.scene)".Trim()
    $prompt = "$($item.positive_prompt)".Trim()

    $key = ($category + "|" + $scene + "|" + $prompt).ToLowerInvariant()
    if ($seen.ContainsKey($key)) { continue }

    $seen[$key] = $true
    $obj = [pscustomobject]@{
        id = $nextId
        category = $category
        scene = $scene
        positive_prompt = "$($item.positive_prompt)".Trim()
        negative_taboo = "$($item.negative_taboo)".Trim()
        checklist = @($item.checklist)
        source = if ($item.source) { "$($item.source)".Trim() } else { "unknown" }
    }

    $result += $obj
    $nextId++
}

$dir = Split-Path -Parent $OutputPath
if (-not [string]::IsNullOrWhiteSpace($dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

$result | ConvertTo-Json -Depth 8 | Set-Content -Path $OutputPath -Encoding UTF8
Write-Output "Merged $($all.Count) items -> Deduped $($result.Count) items -> $OutputPath"
