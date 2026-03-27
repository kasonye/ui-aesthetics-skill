param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "references/round-contrast-rules.json",
    [Parameter(Mandatory = $false)]
    [string]$Source = "gemini_round_contrast"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

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
        $items += ($line | ConvertFrom-Json)
    }
    return $items
}

function Infer-Category {
    param([string]$Scene, [string]$GoodPrompt)

    $s = ($Scene + " " + $GoodPrompt)

    if ($s -match "移动|mobile|响应式|触控|设置") { return "响应式 (Responsiveness)" }
    if ($s -match "对比度|focus|键盘|无障碍|WCAG") { return "可访问性 (Accessibility)" }
    if ($s -match "按钮|输入框|表单|弹窗|图标") { return "组件一致性 (Consistency)" }
    if ($s -match "动画|动效|hover|过渡|ease|spring") { return "动效 (Animation)" }
    if ($s -match "色|渐变|深色|主色|品牌色") { return "配色 (Color)" }
    if ($s -match "标题|正文|字号|行高|字距|字体") { return "字体 (Typography)" }
    if ($s -match "层级|阴影|Z 轴|Z轴") { return "层级 (Hierarchy)" }
    if ($s -match "留白|间距|padding|margin|vh") { return "留白 (Whitespace)" }
    return "布局 (Layout)"
}

$inputItems = Read-Items -Path $InputPath
$out = @()
$id = 1

foreach ($item in $inputItems) {
    $scene = "$($item.scene)".Trim()
    $bad = "$($item.bad_prompt)".Trim()
    $good = "$($item.good_prompt)".Trim()
    $delta = "$($item.delta)".Trim()

    $category = Infer-Category -Scene $scene -GoodPrompt $good

    $checks = @()
    foreach ($c in $item.checklist) {
        $cc = "$c".Trim()
        if (-not [string]::IsNullOrWhiteSpace($cc)) { $checks += $cc }
    }

    $out += [pscustomobject]@{
        id = $id
        category = $category
        scene = $scene
        positive_prompt = $good
        negative_taboo = "避免：$bad"
        checklist = $checks
        source = $Source
        bad_prompt = $bad
        delta = $delta
    }

    $id++
}

$dir = Split-Path -Parent $OutputPath
if (-not [string]::IsNullOrWhiteSpace($dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

$out | ConvertTo-Json -Depth 8 | Set-Content -Path $OutputPath -Encoding UTF8
Write-Output "Converted $($out.Count) contrast items -> $OutputPath"
