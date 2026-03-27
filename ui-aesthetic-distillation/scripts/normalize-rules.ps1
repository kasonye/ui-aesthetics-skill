param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "references/rules-normalized.json"
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

function Read-RuleItems {
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

function Clean-Text {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text)) { return "" }

    $clean = $Text
    $clean = [regex]::Replace($clean, "<details[\\s\\S]*?</details>", " ", "IgnoreCase")
    $clean = [regex]::Replace($clean, "<[^>]+>", " ")
    $clean = [regex]::Replace($clean, "\\s+", " ")
    return $clean.Trim()
}

function Normalize-CategoryName {
    param([string]$Category)

    $c = (Clean-Text $Category).ToLowerInvariant()

    if ($c -match "trust|安全|信任|auth|authentication|瀹夊叏|淇′换") { return "组件一致性 (Consistency)" }
    if ($c -match "saas|finance|e-commerce|ecommerce|content|education|vertical") { return "场景化 (Vertical)" }
    if ($c -match "navigation|action|form|component|data entry|design system|display") { return "组件一致性 (Consistency)" }
    if ($c -match "feedback|toast|progress|notification") { return "动效 (Animation)" }
    if ($c -match "data display|table layout|dashboard layout") { return "布局 (Layout)" }
    if ($c -match "layout|布局|grid|dashboard") { return "布局 (Layout)" }
    if ($c -match "whitespace|留白|spacing|space") { return "留白 (Whitespace)" }
    if ($c -match "hierarchy|层级|elevation|z轴|z axis") { return "层级 (Hierarchy)" }
    if ($c -match "typography\s*&\s*data|typography|字体|type|text") { return "字体 (Typography)" }
    if ($c -match "color|colour|配色|gradient|palette|semantic status") { return "配色 (Color)" }
    if ($c -match "animation|motion|动效|transition|micro-interaction") { return "动效 (Animation)" }
    if ($c -match "consistency|组件一致性|component|button|input|modal|icon") { return "组件一致性 (Consistency)" }
    if ($c -match "accessibility|a11y|可访问") { return "可访问性 (Accessibility)" }
    if ($c -match "responsive|responsiveness|响应式|breakpoint|mobile") { return "响应式 (Responsiveness)" }

    return Clean-Text $Category
}

$categoryFallbackChecks = @{
    "布局 (Layout)" = @(
        "是否定义了网格或容器宽度",
        "是否定义了区块比例或对齐方式",
        "是否避免无结构堆叠",
        "不同模块间距是否一致",
        "小屏布局是否明确重排"
    )
    "留白 (Whitespace)" = @(
        "间距是否基于8px系统",
        "宏观与微观留白是否区分",
        "组件内外间距是否有层级",
        "视觉节奏是否均匀",
        "文本和边界是否避免贴边"
    )
    "层级 (Hierarchy)" = @(
        "主次信息是否一眼可辨",
        "强调元素数量是否克制",
        "颜色和字号是否有梯度",
        "层级样式是否全局一致",
        "视觉焦点是否唯一"
    )
    "字体 (Typography)" = @(
        "标题与正文字号是否分层",
        "行高是否在可读范围",
        "字重使用是否克制",
        "数据数字是否便于比对",
        "跨语言字体是否协调"
    )
    "配色 (Color)" = @(
        "是否有完整色阶",
        "主色覆盖率是否受控",
        "状态色是否语义清晰",
        "对比度是否符合可读性",
        "深浅主题是否有独立规则"
    )
    "动效 (Animation)" = @(
        "时长是否在合理范围",
        "缓动曲线是否自然",
        "动画方向是否统一",
        "反馈是否即时可感知",
        "是否避免过度动画"
    )
    "组件一致性 (Consistency)" = @(
        "同类组件规格是否统一",
        "交互状态是否完整",
        "样式变体数量是否受控",
        "图标和控件风格是否一致",
        "布局与文案间距是否一致"
    )
    "可访问性 (Accessibility)" = @(
        "文本对比度是否达标",
        "是否保留focus-visible",
        "键盘导航是否可达",
        "触控热区是否足够大",
        "是否避免仅依赖颜色表达"
    )
    "响应式 (Responsiveness)" = @(
        "是否采用mobile-first",
        "断点体系是否明确",
        "小屏是否消除横向滚动",
        "字体是否流式缩放",
        "图片比例是否保持正常"
    )
}

$items = Read-RuleItems -Path $InputPath
$normalized = @()

for ($i = 0; $i -lt $items.Count; $i++) {
    $item = $items[$i]
    $category = if (Has-Property -Object $item -Name "category") { Normalize-CategoryName "$($item.category)" } else { "" }
    $checklist = @()

    if ((Has-Property -Object $item -Name "checklist") -and $null -ne $item.checklist) {
        foreach ($c in $item.checklist) {
            $cleanCheck = Clean-Text "$c"
            if (-not [string]::IsNullOrWhiteSpace($cleanCheck)) {
                $checklist += $cleanCheck
            }
        }
    }

    $checklist = @($checklist | Select-Object -Unique)

    if ($checklist.Count -lt 5 -and $categoryFallbackChecks.ContainsKey($category)) {
        foreach ($f in $categoryFallbackChecks[$category]) {
            if ($checklist.Count -ge 5) { break }
            if ($checklist -notcontains $f) {
                $checklist += $f
            }
        }
    }

    if ($checklist.Count -gt 8) {
        $checklist = @($checklist | Select-Object -First 8)
    }

    $normalized += [pscustomobject]@{
        id = if ((Has-Property -Object $item -Name "id") -and $item.id) { [int]$item.id } else { $i + 1 }
        category = $category
        scene = if (Has-Property -Object $item -Name "scene") { Clean-Text "$($item.scene)" } else { "" }
        positive_prompt = if (Has-Property -Object $item -Name "positive_prompt") { Clean-Text "$($item.positive_prompt)" } else { "" }
        negative_taboo = if (Has-Property -Object $item -Name "negative_taboo") { Clean-Text "$($item.negative_taboo)" } else { "" }
        checklist = $checklist
        source = if ((Has-Property -Object $item -Name "source") -and $item.source) { Clean-Text "$($item.source)" } else { "unknown" }
    }
}

$dir = Split-Path -Parent $OutputPath
if (-not [string]::IsNullOrWhiteSpace($dir)) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

$normalized | ConvertTo-Json -Depth 6 | Set-Content -Path $OutputPath -Encoding UTF8
Write-Output "Normalized $($normalized.Count) items -> $OutputPath"
