" Vim syntax file
" Language:     IDP
" Maintainer:   Johan Wittocx (johan.wittocx@cs.kuleuven.be)
" Editor:       Stef De Pooter (stef.depooter@cs.kuleuven.be)
" Last Change:  2010 May 11

syntax case match
syntax sync fromstart

" Comments
syntax match	idpTodo		/\<TODO\>/	contained
syntax match	idpNote		/\<NOTE\>/	contained

highlight link idpTodo Todo
highlight link idpNote Todo

syntax match	idpComment	/\/\/.*/	contains=idpTodo,idpNote
syntax region	idpComment	start="\/\*"	end="\*\/" contains=idpTodo,idpNote
syntax match	idpASPComment	/%.*/	contains=idpTodo,idpNote

highlight link idpComment		Comment
highlight link idpASPComment	Comment


" Constants
syntax match	idpConst	"\<$\w\w*\>"

highlight link idpConst Constant

" Numbers and characters
syntax match	idpNumber		"\<\d*\>"
syntax match	idpNumber		"\<\d*\.\d*\>"
syntax match	idpNumber		"'\w'"

highlight link idpNumber Number

" Strings
syntax region	idpString		start=/"/ skip=/\\"/ end=/"/
syntax region	idpStdIncl		start=/</ end=/>/

highlight link idpString String
highlight link idpStdIncl String

syntax cluster idpCommon contains=idpString,idpNumber,idpComment,idpConst

" Keywords
syntax match	idpThKeyword	"#"				contained
syntax match	idpThKeyword	"\<LFD\>"		contained
syntax match	idpThKeyword	"\<GFD\>"		contained
syntax match	idpThKeyword	"\<card\>"		contained
syntax match	idpThKeyword	"\<sum\>"		contained
syntax match	idpThKeyword	"\<prod\>"		contained
syntax match	idpThKeyword	"\<max\>"		contained
syntax match	idpThKeyword	"\<min\>"		contained

syntax match	idpVocKeyword	"\<type\>"		contained
syntax match	idpVocKeyword	"\<isa\>"		contained
syntax match	idpVocKeyword	"\<contains\>"	contained
syntax match	idpVocKeyword	"\<partial\>"	contained

syntax match	idpStrKeyword	"\<procedure\>"	contained
syntax match	idpStrKeyword	"\<generate\>"	contained

syntax match	idpExtern		"\<extern\>"	contained

syntax match	idpKeyword		"\<using\>"	
syntax match	idpKeyword		"\<vocabulary\>"
syntax match	idpKeyword		"\<namespace\>"

syntax match	idpOptKeyword	"\<options\>"	contained

syntax match	idpCTCF			/<u>/			contained
syntax match	idpCTCF			/<ct>/			contained
syntax match	idpCTCF			/<cf>/			contained

highlight link idpCTCF Identifier

highlight link idpKeyword		Keyword
highlight link idpThKeyword		Keyword
highlight link idpVocKeyword	Keyword
highlight link idpStrKeyword	Keyword
highlight link idpExtern		Keyword
highlight link idpOptKeyword	Keyword

" Options
syntax match	idpOption	"\<nrmodels\>"	contained

highlight link	idpOption Special

" Builtins
syntax match	idpType		"\<nat\>"		contained
syntax match	idpType		"\<int\>"		contained
syntax match	idpType		"\<float\>"		contained
syntax match	idpType		"\<char\>"		contained
syntax match	idpType		"\<string\>"	contained

syntax match	idpBuiltin	"\<MAX\>"		contained
syntax match	idpBuiltin	"\<MIN\>"		contained
syntax match	idpBuiltin	"\<SUCC\>"		contained
syntax match	idpBuiltin	"\<abs\>"		contained

highlight link idpType Type
highlight link idpBuiltin Type

syntax match	idpTrueFalse	"\<true\>"		contained
syntax match	idpTrueFalse	"\<false\>"		contained

highlight link idpTrueFalse	Constant

" Blocks

syntax match	idpNamespace	"namespace"
syntax match	idpPreProc		"#include"

syntax region	idpCast	matchgroup=idpC start=/\[/ end=/\]/ contained contains=idpType

syntax match	idpVocHeader	/vocabulary/	nextgroup=idpVocReg skipwhite
syntax region	idpVocReg	matchgroup=idpVocR start=/\w\w*\s*\n*{/ end=/}/	contained contains=idpVocKeyword,idpExtern,idpParen,idpType,idpKeyword,@idpCommon,idpPreProc

syntax match	idpStructHeader		"structure"	nextgroup=idpStructReg skipwhite
syntax region	idpStructReg	matchgroup=idpStructR start=/\w\w*\s*\n*:\s*\w\w*\s*\n*{/ end=/}/	contained contains=idpParen,idpKeyword,idpTrueFalse,idpCTCF,idpCast,@idpCommon,idpPreProc,idpStrKeyword

syntax match	idpStructHeader		"asp_structure"	nextgroup=idpASPReg skipwhite
syntax match	idpStructHeader		"asp_belief"	nextgroup=idpASPReg skipwhite
syntax region	idpASPReg	matchgroup=idpASPR start=/\w\w*\s*\n*:\s*\w\w*\s*\n*{/ end=/}/	contained contains=idpKeyword,idpCast,@idpCommon,idpPreProc,idpASPComment

syntax match	idpTheoryHeader		"theory"	nextgroup=idpTheoReg skipwhite
"syntax match	idpTheoryHeader		"formula"	nextgroup=idpTheoReg skipwhite
syntax match	idpTheoryHeader		"query"		nextgroup=idpTheoReg skipwhite
syntax match	idpTheoryHeader		"term"		nextgroup=idpTheoReg skipwhite
syntax region	idpTheoReg	matchgroup=idpTheoR start=/\w\w*\s*\n*:\s*\w\w*\s*\n*{/ end=/}/	contained contains=idpParen,idpKeyword,idpTrueFalse,idpBuiltin,idpThKeyword,idpType,@idpCommon,idpPreProc

syntax match	idpOptionsHeader	"options"	nextgroup=idpOptReg skipwhite
syntax region	idpOptReg	matchgroup=idpOptR start=/\w\w*\s*\n*{/ end=/}/	contained contains=@idpCommon,idpPreProc,idpExtern,idpOptKeyword,idpOption

syntax region	idpParen		start=/{/ end=/}/ contained transparent

syntax match	idpInferenceHeader	"procedure" nextgroup=idpInferReg skipwhite
syntax region	idpInferReg matchgroup=idpInferR start=/\<[a-zA-Z0-9_, \t:()]*\s*\n*{/ end=/}/	contained contains=@Lua,idpComment,idpKeyword,idpPreProc
syntax include @Lua $VIMRUNTIME/syntax/lua.vim

highlight link idpVocHeader			PreProc
highlight link idpStructHeader		PreProc
highlight link idpTheoryHeader		PreProc
highlight link idpNamespace			PreProc
highlight link idpInferenceHeader	PreProc
highlight link idpPreProc			PreProc
highlight link idpOptionsHeader		PreProc

" Don't color these
syntax match	idpQuant		"?\s*\d*"
syntax match	idpQuant		"?\s*<\d*"
syntax match	idpQuant		"?\s*>\d*"
syntax match	idpQuant		"?\s*>=\d*"
syntax match	idpQuant		"?\s*=<\d*"
