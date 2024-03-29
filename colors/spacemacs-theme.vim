" Name:         Spacemacs theme
" Description:  Light and dark theme inspired by spacemacs-theme
" License:      Mit License

" https://github.com/bluz71/vim-moonfly-colors/blob/master/colors/moonfly.vim for filetype hilighting definitions
" GUI color definitions
" ---|-----------------------|--------------
" ## | ORIGINAL THEME SWATCH | ACTUAL COLOUR
" ---|-----------------------|--------------
" 00 | bg1                   | dark grey
" 01 | bg2                   | darker grey
" 02 | act2                  | dark purple
" 03 | n/a                   | medium cool grey
" 04 | base                  | light grey
" 05 | base                  | light grey
" 06 | cblk-ln               | purple grey
" 07 | cblk-ln-bg            | dark purple grey
" 08 | var                   | azure
" 09 | const                 | medium purple
" 0A | comment               | teal
" 0B | str                   | cool green
" 0C | type                  | coral
" 0D | func                  | pink
" 0E | keyword               | blue
" 0F | act2                  | dark purple
" ---|-----------------------|--------------
let s:gui00 = "292b2e"
let s:gui01 = "212026"
let s:gui02 = "5d4d7a"
let s:gui03 = "68727c"
let s:gui04 = "b2b2b2"
let s:gui05 = "b2b2b2"
let s:gui06 = "827591"
let s:gui07 = "373040"
let s:gui08 = "7590db"
let s:gui09 = "a45bad"
let s:gui0A = "2aa1ae"
let s:gui0B = "2d9574"
let s:gui0C = "ce537a"
let s:gui0D = "bc6ec5"
let s:gui0E = "4f97d7"
let s:gui0F = "5d4d7a"

" Additional gui colours
let s:yellow = "b1951d"
let s:green  = "67b11d"
let s:white  = "a3a3a3"

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "10"
  let s:cterm02 = "11"
  let s:cterm04 = "12"
  let s:cterm06 = "13"
  let s:cterm09 = "09"
  let s:cterm0F = "14"
endif

" Theme setup
hi clear
syntax reset
let g:colors_name = "spacemacs-theme"

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . s:gui(a:guifg)
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . s:gui(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=#" . a:guisp
  endif
endfun

" Return GUI color for light/dark variants
fun s:gui(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:gui00
    return s:gui07
  elseif a:color == s:gui01
    return s:gui06
  elseif a:color == s:gui02
    return s:gui05
  elseif a:color == s:gui03
    return s:gui04
  elseif a:color == s:gui04
    return s:gui03
  elseif a:color == s:gui05
    return s:gui02
  elseif a:color == s:gui06
    return s:gui01
  elseif a:color == s:gui07
    return s:gui00
  endif

  return a:color
endfun

" Return terminal color for light/dark variants
fun s:cterm(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:cterm00
    return s:cterm07
  elseif a:color == s:cterm01
    return s:cterm06
  elseif a:color == s:cterm02
    return s:cterm05
  elseif a:color == s:cterm03
    return s:cterm04
  elseif a:color == s:cterm04
    return s:cterm03
  elseif a:color == s:cterm05
    return s:cterm02
  elseif a:color == s:cterm06
    return s:cterm01
  elseif a:color == s:cterm07
    return s:cterm00
  endif

  return a:color
endfun

" Vim editor colors
call <sid>hi("Bold",          "", "", "", "", "bold", "")
call <sid>hi("Debug",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Directory",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Error",         s:yellow, s:gui01, s:cterm00, s:cterm08, "", "")
call <sid>hi("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "", "")
call <sid>hi("Exception",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("FoldColumn",    s:gui0C, s:gui01, s:cterm0C, s:cterm01, "", "")
call <sid>hi("Folded",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("IncSearch",     s:white, s:gui09, s:cterm01, s:cterm09, "none", "")
call <sid>hi("Italic",        "", "", "", "", "none", "")
call <sid>hi("Macro",         s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("MatchParen",    s:gui00, s:gui03, s:cterm00, s:cterm03,  "", "")
call <sid>hi("ModeMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("MoreMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Question",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Search",        s:gui01, s:green, s:cterm03, s:cterm0A,  "", "")
call <sid>hi("SpecialKey",    s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("TooLong",       s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Underlined",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Visual",        "", s:gui02, "", s:cterm02, "", "")
call <sid>hi("VisualNOS",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("WarningMsg",    s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("WildMenu",      s:white, s:gui0D, s:cterm08, "", "", "")
call <sid>hi("Title",         s:gui0D, "", s:cterm0D, "", "none", "")
call <sid>hi("Conceal",       s:gui0D, s:gui00, s:cterm0D, s:cterm00, "", "")
call <sid>hi("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call <sid>hi("NonText",       s:gui03, "", s:cterm03, "", "", "")
call <sid>hi("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("LineNr",        s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("SignColumn",    s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none", "")
call <sid>hi("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call <sid>hi("ColorColumn",   "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorColumn",  "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLine",    "", s:gui01, "", s:cterm01, "none", "")
call <sid>hi("CursorLineNr",  s:gui03, s:gui01, s:cterm03, s:cterm01, "", "")
call <sid>hi("PMenu",         s:gui04, s:gui01, s:cterm04, s:cterm01, "none", "")
call <sid>hi("PMenuSel",      s:gui01, s:gui04, s:cterm01, s:cterm04, "", "")
call <sid>hi("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call <sid>hi("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Character",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("Comment",      s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Conditional",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Constant",     s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Define",       s:gui0E, "", s:cterm0E, "", "none", "")
call <sid>hi("Delimiter",    s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Float",        s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Function",     s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Identifier",   s:gui08, "", s:cterm08, "", "none", "")
call <sid>hi("Include",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Keyword",      s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Label",        s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Number",       s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("Operator",     s:gui05, "", s:cterm05, "", "none", "")
call <sid>hi("PreProc",      s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Repeat",       s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Special",      s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("SpecialChar",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("Statement",    s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("StorageClass", s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("String",       s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("Structure",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("Tag",          s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call <sid>hi("Type",         s:gui0A, "", s:cterm0A, "", "none", "")
call <sid>hi("Typedef",      s:gui0A, "", s:cterm0A, "", "", "")

" C highlighting
call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "", "")

" C# highlighting
call <sid>hi("csClass",                 s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("csAttribute",             s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("csModifier",              s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("csType",                  s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("csNewDecleration",        s:gui08, "", s:cterm08, "", "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd",      s:gui0B, s:gui01,  s:cterm0B, s:cterm01, "", "")
call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:cterm03, s:cterm01, "", "")
call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:cterm08, s:cterm01, "", "")
call <sid>hi("DiffText",     s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "", "")
call <sid>hi("DiffAdded",    s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")
call <sid>hi("DiffNewFile",  s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call <sid>hi("DiffLine",     s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "", "")
call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call <sid>hi("gitCommitOverflow",  s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("gitCommitSummary",   s:gui0B, "", s:cterm0B, "", "", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call <sid>hi("GitGutterChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "", "")
call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")
call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call <sid>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "", "")

" JavaScript highlighting
call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "", "")

" Mail highlighting
call <sid>hi("mailQuoted1",  s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("mailQuoted2",  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("mailQuoted3",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("mailQuoted4",  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("mailQuoted5",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("mailQuoted6",  s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("mailURL",      s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("mailEmail",    s:gui0D, "", s:cterm0D, "", "", "")

" Markdown highlighting
call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "", "")

" Python highlighting
call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "", "")
call <sid>hi("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "", "")
call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "", "")
call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "", "")
call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "", "")

" Rust highlighting
call <sid>hi("rustArrowCharacter",              s:white, "", s:cterm0E, "", "",     "") "Checked
call <sid>hi("rustAssert",                      s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustAttribute",                   s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustBinNumber",                   s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustBoolean",                     s:gui0E, "", s:cterm0E, "", "bold", "") "Checked
call <sid>hi("rustBoxPlacement",                s:gui0F, "", s:cterm0D, "", "",     "")
call <sid>hi("rustBoxPlacementBalance",         s:gui0F, "", s:cterm0D, "", "",     "")
call <sid>hi("rustCharacter",                   s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCharacterInvalid",            s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCharacterInvalidUnicode",     s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentBlock",                s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentBlockDoc",             s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentBlockDocError",        s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentBlockNest",            s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentBlockDocNest",         s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentBlockDocNestError",    s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentLine",                 s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentLineDoc",              s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustCommentLineDocError",         s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustConditional",                 s:gui0E, "", s:cterm0E, "", "bold", "") "Checked
call <sid>hi("rustConstant",                    s:gui09, "", s:cterm09, "", "",     "")
call <sid>hi("rustDefault",                     s:gui09, "", s:cterm09, "", "",     "")
call <sid>hi("rustDerive",                      s:gui0E, "", s:cterm0E, "", "",     "")
call <sid>hi("rustDeriving",                    s:gui0C, "", s:cterm0C, "", "bold", "")
call <sid>hi("rustDeriveTrait",                 s:gui0E, "", s:cterm0E, "", "",     "")
call <sid>hi("rustDecNumber",                   s:gui0E, "", s:cterm0E, "", "",     "")
call <sid>hi("rustHexNumber",                   s:gui0E, "", s:cterm0E, "", "",     "")
call <sid>hi("rustEnum",                        s:gui0E, "", s:cterm0E, "", "",     "")
call <sid>hi("rustEnumVariant",                 s:gui0E, "", s:cterm0E, "", "",     "")
call <sid>hi("rustEscape",                      s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustEscapeError",                 s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustEscapeUnicode",               s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustExternCrate",                 s:gui0E, "", s:cterm0E, "", "bold", "") "Checked
call <sid>hi("rustExternCrateString",           s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustFloat",                       s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustFoldBraces",                  s:gui0D, "", s:cterm0D, "", "bold", "")
call <sid>hi("rustFuncCall",                    s:white, "", s:cterm0D, "", "bold", "")
call <sid>hi("rustFuncName",                    s:gui0D, "", s:cterm0D, "", "bold", "") "Checked
call <sid>hi("rustFunction",                    s:gui0D, "", s:cterm0D, "", "bold", "")
call <sid>hi("rustIdentifier",                  s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustIdentifierPrime",             s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustInvalidBareKeyword",          s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustKeyword",                     s:gui0E, "", s:cterm0E, "", "bold", "") "Checked
call <sid>hi("rustLabel",                       s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustLifetime",                    s:gui0A, "", s:cterm0A, "", "",     "")
call <sid>hi("rustMacro",                       s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustMacroRepeat",                 s:gui08, "", s:cterm08, "", "",     "")
call <sid>hi("rustMacroRepeatCount",            s:gui08, "", s:cterm08, "", "",     "")
call <sid>hi("rustMacroRepeatDelimiters",       s:gui08, "", s:cterm08, "", "",     "")
call <sid>hi("rustMacroVariable",               s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustModPath",                     s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustModPathSep",                  s:white, "", s:cterm0C, "", "bold", "")
call <sid>hi("rustObsoleteExternMod",           s:gui0C, "", s:cterm0D, "", "",     "")
call <sid>hi("rustObsoleteStorage",             s:gui0C, "", s:cterm0D, "", "",     "")
call <sid>hi("rustOctNumber",                   s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustOperator",                    s:white, "", s:cterm0D, "", "",     "")
call <sid>hi("rustPubScope",                    s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustPubScopeCrate",               s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustPubScopeDelim",               s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustQuestionMark",                s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustRepeat",                      s:gui0E, "", s:cterm0E, "", "bold", "")
call <sid>hi("rustReservedKeyword",             s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustSelf",                        s:gui0D, "", s:cterm0D, "", "",     "") "Checked
call <sid>hi("rustShebang",                     s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustSigil",                       s:white, "", s:cterm0E, "", "bold", "") "Checked
call <sid>hi("rustString",                      s:gui0B, "", s:cterm0B, "", "",     "")
call <sid>hi("rustStringContinuation",          s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustStorage",                     s:gui0E, "", s:cterm0E, "", "bold", "") "Checked
call <sid>hi("rustStructure",                   s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustSuper",                       s:gui0D, "", s:cterm0D, "", "",     "")
call <sid>hi("rustTodo",                        s:gui0C, "", s:cterm0C, "", "bold", "")
call <sid>hi("rustTrait",                       s:gui0C, "", s:cterm0C, "", "bold", "") "Checked
call <sid>hi("rustType",                        s:gui0C, "", s:cterm0C, "", "bold", "") "Checked
call <sid>hi("rustTypedef",                     s:gui0C, "", s:cterm0C, "", "bold", "")
call <sid>hi("rustUnion",                       s:gui0C, "", s:cterm0C, "", "bold", "")
call <sid>hi("rustUnionContextual",             s:gui0C, "", s:cterm0C, "", "bold", "")

" SASS highlighting
call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "", "")
call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "", "")
call <sid>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "", "")
call <sid>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "", "")

" Signify highlighting
call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "", "")
call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")

" Spelling highlighting
call <sid>hi("SpellBad",     "", s:gui00, "", s:cterm00, "undercurl", s:gui08)
call <sid>hi("SpellLocal",   "", s:gui00, "", s:cterm00, "undercurl", s:gui0C)
call <sid>hi("SpellCap",     "", s:gui00, "", s:cterm00, "undercurl", s:gui0D)
call <sid>hi("SpellRare",    "", s:gui00, "", s:cterm00, "undercurl", s:gui0E)

" Rainbow Parentheses
if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs = [['blue', '#6981c5'], ['magenta', '#a15ea7'],
        \ ['red', '#d26487'], ['173', '#ca754b']]
endif

let g:rainbow_guifgs = [ '#ca754b', '#d26487', '#a15ea7', '#6981c5' ]
let g:rainbow_ctermfgs = [ '173', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

" Remove functions
delf <sid>hi
delf <sid>gui
delf <sid>cterm

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F

