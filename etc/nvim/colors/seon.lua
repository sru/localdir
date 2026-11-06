if vim.g.colors_name then
  vim.cmd("highlight clear")
end

vim.g.colors_name = "seon2"

local colors = {
  black = 0,
  red = 1,
  green = 2,
  yellow = 3,
  blue = 4,
  magenta = 5,
  cyan = 6,
  white = 7,
  bright_black = 8,
  bright_red = 9,
  bright_green = 10,
  bright_yellow = 11,
  bright_blue = 12,
  bright_magenta = 13,
  bright_cyan = 14,
  bright_white = 15,
}

local gui_colors = {
  [0] = "#000000",
  [1] = "#ce2029",
  [2] = "#007d32",
  [3] = "#ab9100",
  [4] = "#1c39bb",
  [5] = "#663399",
  [6] = "#ff7900",
  [7] = "#555555",
  [8] = "#ababab",
  [9] = "#efb5b8",
  [10] = "#abd4bb",
  [11] = "#ffd800",
  [12] = "#b4bee9",
  [13] = "#cdbcdd",
  [14] = "#ffd3ab",
  [15] = "#ffffff",
}

local groups = {
  Normal = { fg = colors.black, bg = colors.bright_white },
  NormalNC = { link = "Normal" },

  Cursor = { fg = colors.bright_white, bg = colors.black },
  CursorIM = { link = "Cursor" },
  TermCursor = { link = "Cursor" },
  TermCursorNC = { link = "Cursor" },
  CursorColumn = { bg = colors.bright_black },
  CursorLine = { link = "CursorColumn" },
  CursorLineNr = { fg = colors.yellow },
  CursorLineFold = { link = "CursorLineNr" },
  CursorLineSign = { link = "CursorLineNr" },

  NonText = { fg = colors.bright_black },
  EndOfBuffer = { link = "NonText" },
  Folded = { link = "NonText" },
  FoldColumn = { link = "NonText" },
  LineNr = { link = "NonText" },
  LineNrAbove = { link = "NonText" },
  LineNrBelow = { link = "NonText" },

  SignColumn = { fg = colors.black, bg = colors.bright_black },
  ColorColumn = { bg = colors.bright_black },

  Search = { bg = colors.bright_yellow },
  CurSearch = { link = "Search" },
  IncSearch = { link = "Search" },
  Substitute = { link = "Search" },

  OkMsg = { fg = colors.green },
  WarningMsg = { fg = colors.yellow },
  ErrorMsg = { fg = colors.red },
  StderrMsg = { link = "Normal" },
  StdoutMsg = { link = "Normal" },
  MsgArea = { link = "MsgArea" },
  ModeMsg = { link = "Normal" },
  MsgSeparator = { link = "NonText" },
  MoreMsg = { link = "MsgArea" },

  WinSeparator = { link = "NonText" },

  NormalFloat = { link = "Normal" },
  FloatBorder = { fg = colors.bright_black, bg = colors.bright_white },
  FloatShadow = { bg = colors.white },
  FloatShadowThrough = { bg = colors.bright_black },
  FloatTitle = { bold = true },
  FloatFooter = { fg = colors.white },

  Pmenu = { link = "Normal" },
  PmenuSel = { bg = colors.bright_black },
  PmenuKind = { fg = colors.white },
  PmenuKindSel = { fg = colors.white, bg = colors.bright_black },
  PmenuExtra = { link = "PmenuKind" },
  PmenuExtraSel = { link = "PmenuKindSel" },
  PmenuSbar = { bg = colors.bright_black },
  PmenuThumb = { bg = colors.white },
  PmenuMatch = { fg = colors.yellow },
  PmenuMatchSel = {},
  PmenuBorder = { link = "FloatBorder" },
  PmenuShadow = { link = "FloatShadow" },
  PmenuShadowThrough = { link = "FloatShadowThrough" },

  ComplMatchIns = { fg = colors.yellow },
  PreInsert = { link = "NonText" },
  ComplHint = { link = "NonText" },
  ComplHintMore = { link = "NonText" },

  Question = { link = "Normal" },

  QuickFixLine = { bold = true },

  SnippetTabstop = { fg = colors.black, bg = colors.bright_black },
  SnippetTabstopActive = { fg = colors.black, bg = colors.bright_yellow },

  Conceal = { fg = colors.white },
  Directory = { link = "Normal" },
  SpecialKey = { bg = colors.bright_red },

  MatchParen = { bold = true },

  SpellBad = { undercurl = true, sp = colors.red },
  SpellCap = { undercurl = true, sp = colors.red },
  SpellLocal = { undercurl = true, sp = colors.yellow },
  SpellRare = { undercurl = true, sp = colors.yellow },

  StatusLine = { fg = colors.bright_black, bg = colors.bright_white },
  StatusLineNC = { fg = colors.bright_white, bg = colors.bright_white },
  StatusLineTerm = { link = "StatusLine" },
  StatusLineTermNC = { link = "StatusLineNC" },

  TabLine = { fg = colors.black, bg = colors.bright_black },
  TabLineFill = { link = "TabLine" },
  TabLineSel = { fg = colors.black, bg = colors.bright_black, bold = true },

  Title = { bold = true },

  Visual = { bg = colors.bright_black },
  VisualNOS = { link = "Visual" },

  Whitespace = { fg = colors.bright_black },

  WildMenu = { fg = colors.yellow },

  WinBar = { fg = colors.black, bg = colors.bright_white, bold = true },
  WinBarNC = { fg = colors.black, bg = colors.bright_white },

  Comment = { italic = true },

  Constant = { link = "Normal" },
  String = { link = "Constant" },

  Statement = { link = "Normal" },
  PreProc = { link = "Normal" },
  Type = { link = "Normal" },
  Special = { link = "Normal" },
  Function = { link = "Normal" },
  Identifier = { link = "Normal" },
  Delimiter = { link = "Normal" },
  Operator = { link = "Normal" },

  Todo = { fg = colors.yellow },

  Error = { fg = colors.red },

  Added = { fg = colors.green },
  Changed = { fg = colors.blue },
  Removed = { fg = colors.red },
  DiffAdd = { link = "Added" },
  DiffChange = { link = "Changed" },
  DiffDelete = { link = "Removed" },
  DiffText = { fg = colors.blue, bg = colors.bright_blue },
  DiffTextAdd = { fg = colors.green, bg = colors.bright_blue },

  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.black },
  DiagnosticHint = { fg = colors.white },
  DiagnosticOk = { fg = colors.green },
  DiagnosticUnderlineError = { underline = true, sp = colors.red },
  DiagnosticUnderlineWarn = { underline = true, sp = colors.yellow },
  DiagnosticUnderlineInfo = { underline = true, sp = colors.black },
  DiagnosticUnderlineHint = { underline = true, sp = colors.white },
  DiagnosticUnderlineOk = { underline = true, sp = colors.green },

  helpHyperTextJump = { fg = colors.magenta },
  helpOption = { fg = colors.blue },
}

for group, attrs in pairs(groups) do
  local fg = attrs.fg
  attrs.ctermfg = fg
  attrs.fg = gui_colors[fg]

  local bg = attrs.bg
  attrs.ctermbg = bg
  attrs.bg = gui_colors[bg]

  attrs.sp = gui_colors[attrs.sp]

  vim.api.nvim_set_hl(0, group, attrs)
end
