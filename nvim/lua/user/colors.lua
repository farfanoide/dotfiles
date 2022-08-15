-- https://github.com/CKolkey/.config/

local M = {}

M.colors = {
  none = "NONE",

  black = "#181a1b",
  bg0 = "#22252A",
  bg1 = "#282C34",
  bg2 = "#363a4e",
  bg3 = "#393e53",
  bg4 = "#3f445b",
  grey_dim = "#5c6071",
  grey = "#7e8294",
  grey_light = "#959da9",
  fg = "#c5cdd9",
  white = "#fcfcfc",

  line_red = "#583538",
  line_orange = "#453e35",
  line_blue = "#383f50",
  line_purple = "#483953",

  red = "#E06C75",
  bg_red = "#b5585f",
  lt_red = "#eed8da",
  orange = "#FFCB6B",
  bg_orange = "#d4a959",
  lt_orange = "#f5ebd9",
  yellow = "#FFE082",
  bg_yellow = "#d4bb6c",
  lt_yellow = "#f5efdd",
  green = "#C3E88D",
  bg_green = "#9fbd73",
  lt_green = "#f3f6ed",
  cyan = "#6ce0cf",
  bg_cyan = "#58b5a8",
  lt_cyan = "#d8eeeb",
  blue = "#82AAFF",
  bg_blue = "#6c8ed4",
  lt_blue = "#dde5f5",
  purple = "#C792EA",
  bg_purple = "#a377bf",
  lt_purple = "#eadff0",

  active = "#98c379",
  inactive = "#90AB7B",
}

M.icons = {
  error = " ",
  warning = " ",
  info = " ",
  hint = " ",
  debug = " ",
  trace = " ",
  added = " ",
  removed = " ",
  modified = " ",
}

M.highlights = {
  -- WinSeparator = { bg = M.colors.bg0, fg = M.colors.inactive },
  -- VisualYank = { bg = M.colors.line_purple },
  --
  -- FloatBorder = { bg = M.colors.bg1, fg = M.colors.purple },
  --
  -- TSNumber = { fg = M.colors.red, bg = M.colors.none },
  -- TSFloat = { fg = M.colors.yellow, bg = M.colors.none },
  -- TSLabel = { fg = M.colors.red, bg = M.colors.none, fmt = "italic,bold" },
  -- TSVariable = { fg = M.colors.white, bg = M.colors.none },
  -- TSVariableBuiltin = { fg = M.colors.yellow, bg = M.colors.none, fmt = "italic" },
  -- TSVariableGlobal = { fg = M.colors.cyan, bg = M.colors.none, fmt = "bold" },
  -- TSFunctionBuiltin = { fg = M.colors.purple, bg = M.colors.none },
  -- TSType = { fg = M.colors.yellow, bg = M.colors.none, fmt = "italic" },
  -- TSField = { fg = M.colors.blue, bg = M.colors.none, fmt = "bold" },
  -- TSSymbol = { fg = M.colors.red, bg = M.colors.none, fmt = "bold" },
  -- TSPunctBracket = { fg = M.colors.white, bg = M.colors.none },
  -- TSPunctDelimiter = { fg = M.colors.white, bg = M.colors.none },
  -- TSPunctSpecial = { fg = M.colors.purple, bg = M.colors.none },
  -- TSOperator = { fg = M.colors.purple, bg = M.colors.none },
  -- TSUnderline = { fg = M.colors.none, bg = M.colors.none, fmt = "bold" },
  -- TSStringRegex = { fg = M.colors.orange, bg = M.colors.none },
  -- TSBoolean = { fg = M.colors.orange, bg = M.colors.none, fmt = "italic" },
  -- TSTag = { fg = M.colors.red, bg = M.colors.none, fmt = "bold" },
  -- TSText = { fg = M.colors.white, bg = M.colors.none },
  -- TSTagAttribute = { fg = M.colors.yellow, bg = M.colors.none, fmt = "italic" },
  -- TSURI = { fg = M.colors.blue, bg = M.colors.none, fmt = "underline" },
  -- -- TSError                  = { fmt = "undercurl", sp = M.colors.red },
  --
  -- Type = { fg = M.colors.red, bg = M.colors.none, fmt = "italic" },
  -- Structure = { fg = M.colors.red, bg = M.colors.none, fmt = "italic" },
  -- StorageClass = { fg = M.colors.red, bg = M.colors.none, fmt = "italic" },
  -- Identifier = { fg = M.colors.orange, bg = M.colors.none, fmt = "italic" },
  -- Constant = { fg = M.colors.orange, bg = M.colors.none, fmt = "italic" },
  -- CursorLineNr = { fg = M.colors.yellow, bg = M.colors.none, fmt = "none" },
  -- CursorLine = { fg = M.colors.none, bg = M.colors.bg2, fmt = "none" },
  -- CurrentWord = { fg = M.colors.none, bg = M.colors.none, fmt = "none" },
  -- ErrorMsg = { fg = M.colors.red, bg = M.colors.none, fmt = "bold" },
  -- Comment = { fg = M.colors.grey_dim, bg = M.colors.none, fmt = "italic" },
  -- SpecialComment = { fg = M.colors.grey_dim, bg = M.colors.none, fmt = "italic" },
  -- Todo = { fg = M.colors.purple, bg = M.colors.none, fmt = "italic" },
  -- IncSearch = { fg = M.colors.bg1, bg = M.colors.green },
  --
  -- ScrollView = { fg = M.colors.none, bg = M.colors.fg },
  -- CleverFDefaultLabel = { fg = M.colors.red, bg = M.colors.none, fmt = "bold" },
  -- BiscuitColor = { fg = M.colors.grey_dim, bg = M.colors.none, fmt = "italic" },
  --
  -- IndentBlanklineEven = { fg = M.colors.grey_dim, bg = M.colors.none, fmt = "nocombine" },
  -- IndentBlanklineOdd = { fg = M.colors.grey_dim, bg = M.colors.none, fmt = "nocombine" },
  -- IndentBlanklineContext = { fg = M.colors.orange, bg = M.colors.none, fmt = "nocombine" },
  --
  -- DiffAdd = { fg = M.colors.green, bg = M.colors.none, fmt = "none" },
  -- DiffChange = { fg = M.colors.blue, bg = M.colors.none, fmt = "none" },
  -- DiffDelete = { fg = M.colors.red, bg = M.colors.none, fmt = "none" },
  --
  -- ErrorText = { fg = M.colors.red, bg = M.colors.none, fmt = "bold", sp = M.colors.red },
  -- WarningText = { fg = M.colors.yellow, bg = M.colors.none, fmt = "bold", sp = M.colors.yellow },
  -- InfoText = { fg = M.colors.blue, bg = M.colors.none, fmt = "bold", sp = M.colors.blue },
  -- HintText = { fg = M.colors.green, bg = M.colors.none, fmt = "bold", sp = M.colors.green },
  --
  -- MatchParen = { fg = M.colors.orange, bg = M.colors.none, fmt = "bold" },
  -- MatchParenCur = { fg = M.colors.orange, bg = M.colors.none, fmt = "bold" },
  -- MatchWord = { fg = M.colors.orange, bg = M.colors.none, fmt = "italic" },
  -- MatchWordCur = { fg = M.colors.orange, bg = M.colors.none, fmt = "italic" },
  --
  -- ActiveWindow = { fg = M.colors.none, bg = M.colors.none },
  -- InactiveWindow = { fg = M.colors.none, bg = M.colors.bg0 },
  --
  -- DiagnosticError = { fg = M.colors.red, bg = M.colors.none, fmt = "bold" },
  -- DiagnosticWarn = { fg = M.colors.orange, bg = M.colors.none, fmt = "bold" },
  -- DiagnosticInfo = { fg = M.colors.blue, bg = M.colors.none, fmt = "bold" },
  -- DiagnosticHint = { fg = M.colors.green, bg = M.colors.none, fmt = "bold" },
  -- DiagnosticUnderlineError = { fmt = "underline" },
  -- DiagnosticUnderlineWarn = { fmt = "underline" },
  -- DiagnosticUnderlineInfo = { fmt = "underline" },
  -- DiagnosticUnderlineHint = { fmt = "underline" },

  PmenuSel = { bg = M.colors.bg1, fg = M.colors.none },
  Pmenu = { fg = M.colors.fg, bg = M.colors.bg0 },

  CmpItemAbbrDeprecated = { fg = M.colors.grey, bg = M.colors.none, fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = M.colors.blue, bg = M.colors.none, fmt = "bold" },
  CmpItemAbbrMatchFuzzy = { fg = M.colors.blue, bg = M.colors.none, fmt = "bold" },
  CmpItemMenu = { fg = M.colors.purple, bg = M.colors.none, fmt = "italic" },

  CmpItemKindField = { fg = M.colors.lt_red, bg = M.colors.bg_red },
  CmpItemKindProperty = { fg = M.colors.lt_red, bg = M.colors.bg_red },
  CmpItemKindEvent = { fg = M.colors.lt_red, bg = M.colors.bg_red },

  CmpItemKindText = { fg = M.colors.lt_green, bg = M.colors.bg_green },
  CmpItemKindEnum = { fg = M.colors.lt_green, bg = M.colors.bg_green },
  CmpItemKindKeyword = { fg = M.colors.lt_green, bg = M.colors.bg_green },

  CmpItemKindConstant = { fg = M.colors.lt_yellow, bg = M.colors.bg_yellow },
  CmpItemKindConstructor = { fg = M.colors.lt_yellow, bg = M.colors.bg_yellow },
  CmpItemKindReference = { fg = M.colors.lt_yellow, bg = M.colors.bg_yellow },

  CmpItemKindFunction = { fg = M.colors.lt_purple, bg = M.colors.bg_purple },
  CmpItemKindStruct = { fg = M.colors.lt_purple, bg = M.colors.bg_purple },
  CmpItemKindClass = { fg = M.colors.lt_purple, bg = M.colors.bg_purple },
  CmpItemKindModule = { fg = M.colors.lt_purple, bg = M.colors.bg_purple },
  CmpItemKindOperator = { fg = M.colors.lt_purple, bg = M.colors.bg_purple },

  CmpItemKindVariable = { fg = M.colors.fg, bg = M.colors.grey },
  CmpItemKindFile = { fg = M.colors.fg, bg = M.colors.grey },

  CmpItemKindUnit = { fg = M.colors.lt_orange, bg = M.colors.bg_orange },
  CmpItemKindSnippet = { fg = M.colors.lt_orange, bg = M.colors.bg_orange },
  CmpItemKindFolder = { fg = M.colors.lt_orange, bg = M.colors.bg_orange },

  CmpItemKindMethod = { fg = M.colors.lt_blue, bg = M.colors.bg_blue },
  CmpItemKindValue = { fg = M.colors.lt_blue, bg = M.colors.bg_blue },
  CmpItemKindEnumMember = { fg = M.colors.lt_blue, bg = M.colors.bg_blue },

  CmpItemKindInterface = { fg = M.colors.lt_cyan, bg = M.colors.bg_cyan },
  CmpItemKindColor = { fg = M.colors.lt_cyan, bg = M.colors.bg_cyan },
  CmpItemKindTypeParameter = { fg = M.colors.lt_cyan, bg = M.colors.bg_cyan },

  -- TelescopeSelection = { bg = M.colors.bg4, fg = M.colors.active },
  -- TelescopePromptNormal = { bg = M.colors.bg4 },
  -- TelescopeSlectionCaret = { fg = M.colors.active },
  -- TelescopeMultiSelection = { fg = M.colors.active },
  -- TelescopeNormal = { fg = M.colors.fg, bg = M.colors.bg1 },
  -- TelescopeResultsBorder = { bg = M.colors.bg1 },
  -- TelescopePreviewBorder = { fg = M.colors.bg0, bg = M.colors.bg1 },
  -- TelescopePromptBorder = { bg = M.colors.bg4 },
  -- TelescopePromptTitle = { fg = M.colors.active, bg = M.colors.bg4 },
  -- TelescopeResultsTitle = { fg = M.colors.bg1, bg = M.colors.bg1 },
  -- TelescopePreviewTitle = { fg = M.colors.bg1, bg = M.colors.bg1 },
  -- TelescopeMatching = { fg = M.colors.orange },
  --
  -- NotifyERRORBorder = { fg = M.colors.bg_red },
  -- NotifyERRORIcon = { fg = M.colors.red },
  -- NotifyERRORTitle = { fg = M.colors.red },
  -- NotifyWARNBorder = { fg = M.colors.bg_orange },
  -- NotifyWARNIcon = { fg = M.colors.orange },
  -- NotifyWARNTitle = { fg = M.colors.orange },
  -- NotifyINFOBorder = { fg = M.colors.bg_blue },
  -- NotifyINFOIcon = { fg = M.colors.blue },
  -- NotifyINFOTitle = { fg = M.colors.blue },
  -- NotifyDEBUGBorder = { fg = M.colors.bg_purple },
  -- NotifyDEBUGIcon = { fg = M.colors.purple },
  -- NotifyDEBUGTitle = { fg = M.colors.purple },
  -- NotifyTRACEBorder = { fg = M.colors.bg_green },
  -- NotifyTRACEIcon = { fg = M.colors.green },
  -- NotifyTRACETitle = { fg = M.colors.green },
  --
  -- LspSignatureActiveParameter = { bg = M.colors.active, fg = M.colors.black },
  --
  -- MiniJump = { fg = M.colors.orange, fmt = "bold" },
  -- MiniCursorword = { bg = M.colors.bg2 },
  -- MiniCursorwordCurrent = { bg = M.colors.none },
  --
  -- LeapBackdrop = { fg = M.colors.grey_light },
  -- LeapMatch = { fg = M.colors.orange, fmt = "bold" },
  -- LeapLabelPrimary = { fg = M.colors.red, fmt = "italic" },
  -- LeapLabelSecondary = { fg = M.colors.red, fmt = "italic" },
  --
  -- NeoTreeCursorLine = { bg = M.colors.line_red },
  -- NeoTreeDimText = { fg = M.colors.grey },
  -- NeoTreeDirectoryIcon = { fg = M.colors.orange },
  -- NeoTreeDirectoryName = { fg = M.colors.blue },
  -- NeoTreeDotfile = { fg = M.colors.grey_light },
  -- NeoTreeFileName = { fg = M.colors.white },
  -- NeoTreeHarpoonIcon = { fg = M.colors.grey_dim, fmt = "italic" },
  -- NeoTreeFileNameOpened = { fg = M.colors.yellow, fmt = "italic" },
  -- NeoTreeModified = { fmt = "italic" },
  --
  -- NeoTreeFilterTerm = { fg = M.colors.white, fmt = "italic" },
  -- NeoTreeSymbolicLinkTarget = { fg = M.colors.cyan },
  --
  -- NeoTreeGitAdded = { fg = M.colors.green },
  -- NeoTreeGitConflict = { fg = M.colors.red, fmt = "bold" },
  -- NeoTreeGitDeleted = { fg = M.colors.red },
  -- NeoTreeGitIgnored = { fg = M.colors.grey_light },
  -- NeoTreeGitModified = { fg = M.colors.purple },
  -- NeoTreeGitRenamed = { fg = M.colors.green, fmt = "italic" },
  -- NeoTreeGitUntracked = { fg = M.colors.grey_light },
  --
  -- NeoTreeHiddenByName = { fg = M.colors.grey_dim },
  --
  -- NeoTreeIndentMarker = { fg = M.colors.bg_orange },
  -- NeoTreeNormal = { bg = M.colors.bg1 },
  -- NeoTreeNormalNC = { bg = M.colors.bg1 },
  --
  -- NeoTreeFloatBorder = { bg = M.colors.bg1, fg = M.colors.inactive },
  -- NeoTreeFloatTitle = { bg = M.colors.bg1, fg = M.colors.grey_dim },
  --
  -- NeoTreeRootName = { bg = M.colors.none, fg = M.colors.purple },
  -- NeoTreeTitleBar = { bg = M.colors.none, fg = M.colors.purple },
  --
  -- NeotestPassed = { fg = M.colors.green },
  -- NeotestRunning = { fg = M.colors.orange },
  -- NeotestFailed = { fg = M.colors.red },
  -- NeotestSkipped = { fg = M.colors.yellow },
  -- NeotestTest = { fg = M.colors.white },
  -- NeotestNamespace = { fg = M.colors.orange, fmt = "bold" },
  -- NeotestFocused = { fg = M.colors.purple },
  -- NeotestFile = { fg = M.colors.fg, fmt = "italic" },
  -- NeotestDir = { fg = M.colors.blue },
  -- NeotestBorder = { fg = M.colors.yellow },
  -- NeotestIndent = { fg = M.colors.yellow },
  -- NeotestExpandMarker = { fg = M.colors.yellow },
  -- NeotestAdapterName = { fg = M.colors.red, fmt = "italic" },
}

for hgroup, highlight in pairs(M.highlights) do
  local cmd_str = 'execute "hi '..hgroup..' guibg='..highlight['bg']..' guifg='..highlight['fg']..'"'
  -- print(cmd_str)
  -- vim.cmd(cmd_str)
end

