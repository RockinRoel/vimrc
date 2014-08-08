" Vim syntax file
" Language:    IDP (Inductive Definition Programming)
" Maintainer:  Johan Wittocx (johan.wittocx@cs.kuleuven.be)
" Last Change: 2008 aug 26 

" Colors
"hi Comment      ctermfg=Blue
"hi Define       ctermfg=Red
"hi Type         ctermfg=Brown
"hi Constant     ctermfg=Green
"hi Number       ctermfg=Magenta
"hi Delimiter    ctermfg=DarkRed
"hi Tag          ctermfg=DarkGrey

" Syncing method: Always parse from the start of the file
syntax sync fromstart

" Comments
syntax match    idpComment  "\/\/.*"
syntax region   idpComment  start="\/\*"    end="\*\/"

" Tags
syntax region   idpTag      start="@\w*\["  end="\]"

" Command line constants
syntax match    idpCmdConst "\<$\l\w*\>"

" Variables
syntax match    idpVariable "\<\l\w*\>"

" Integers
syntax match    idpInteger  "\<\d*\>"

" Matching { }
syntax region   idpDefin matchgroup=idpDefDelim start=/{/ end=/}/ contains=ALLBUT

" Vancouver style headers
syntax match    idpInHeader     "Given\s*:"
syntax match    idpOutHeader    "Find\s*:"
syntax match    idpTheHeader    "Satisfying\s*:"
syntax match    idpStrHeader    "Data\s*:"
syntax match    idpVocHeader    "Declare\s*:"
syntax match    idpMinHeader    "Minimize\s*:"
syntax match    idpMaxHeader    "Maximize\s*:"
syntax match    idpSubHeader    "Subsetminimize\s*:"
syntax match    idpSubHeader    "Subsetmaximize\s*:"
syntax match    idpParHeader    "Partial\s*:"
syntax match    idpUpdHeader    "Model\s*:"
syntax match    idpUpdHeader    "Swap\s*:"
syntax match    idpUpdHeader    "Free\s*:"
syntax match    idpUpdHeader    "Danger\s*:"

" Theoretical headers
syntax match    idpInHeader     "%%\s*inputvoc"
syntax match    idpOutHeader    "%%\s*outputvoc"
syntax match    idpTheHeader    "%%\s*theory"
syntax match    idpStrHeader    "%%\s*structure"
syntax match    idpVocHeader    "%%\s*vocabulary"
syntax match    idpMinHeader    "%%\s*minimize"
syntax match    idpMaxHeader    "%%\s*maximize"
syntax match    idpSubHeader    "%%\s*subsetminimize"
syntax match    idpSubHeader    "%%\s*subsetmaximize"
syntax match    idpParHeader    "%%\s*partial"
syntax match    idpUpdHeader    "%%\s*model"
syntax match    idpUpdHeader    "%%\s*free"
syntax match    idpUpdHeader    "%%\s*swap"
syntax match    idpUpdHeader    "%%\s*danger"

" Keywords
syntax match    idpType         "\<type\>"
syntax match    idpIsa          "\<isa\>"
syntax match    idpDeclare      "\<declare\>"
syntax match    idpPartial      "\<partial\>"
syntax match    idpDomain       "\<domain\>"
syntax match    idpInt          "\<int\>"
syntax match    idpMax          "\<MAX\>"
syntax match    idpMin          "\<MIN\>"
syntax match    idpSucc         "\<SUCC\>"
syntax match    idpAbs          "\<abs\>"
syntax match    idpCard         "\<card\>"
syntax match    idpCard         "#"
syntax match    idpSum          "\<sum\>"
syntax match    idpProd         "\<prod\>"
syntax match    idpMaxAgg       "\<max\>"
syntax match    idpMinAgg       "\<min\>"
syntax match    idpFD           "\<LFD\>"
syntax match    idpFD           "\<GFD\>"

" Don't color these
syntax match    idpExOne        "?\s*\d*"
syntax match    idpExAOne       "?\s*<\d*"

" Colors
highlight link  idpInHeader     Define    
highlight link  idpOutHeader    Define    
highlight link  idpTheHeader    Define    
highlight link  idpStrHeader    Define    
highlight link  idpVocHeader    Define    
highlight link  idpMinHeader    Define    
highlight link  idpMaxHeader    Define    
highlight link  idpParHeader    Define    
highlight link  idpSubHeader    Define
highlight link  idpUpdHeader    Define

highlight link  idpType         Type
highlight link  idpDeclare      Type
highlight link  idpInt          Type
highlight link  idpPartial      Type
highlight link  idpDomain       Type

highlight link  idpIsa          Constant

highlight link  idpMax          Constant    
highlight link  idpMin          Constant
highlight link  idpSucc         Constant
highlight link  idpAbs          Constant
highlight link  idpCard         Constant
highlight link  idpSum          Constant
highlight link  idpProd         Constant
highlight link  idpMinAgg       Constant
highlight link  idpMaxAgg       Constant
highlight link  idpFD           Constant
highlight link  idpFD           Constant

highlight link  idpComment      Comment
highlight link  idpTag          Tag

highlight link  idpCmdConst     Define

highlight link  idpVariable     ModeMsg
highlight link  idpInteger      Number
highlight link  idpDefDelim     ModeMsg
