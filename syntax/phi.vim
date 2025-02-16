" Vim syntax file
" Language: Phi

if exists("b:current_syntax")
  finish
endif

" Variable names (qualquer identificador que comece com minúscula)
syntax match phiVarName '\v<[a-z][a-zA-Z0-9_]*>' containedin=ALLBUT,phiKeyword,phiCommentLine,phiCommentBlock

" Lambda expressions
syntax match phiLambda 'λ'
syntax match phiDot '\.'

" Let definitions (highlighted as keywords)
syntax keyword phiKeyword let

" Special characters
syntax match phiSpecialChar '[()=]'


" Identifiers para funções definidas (personalizadas)
" syntax keyword phiIdentifier neg cons nil

" Comment handling (distintos e corretos)
syntax match phiCommentLine '--.*$'
syntax region phiCommentBlock start='{-' end='-}'

" Strings e sequências de escape
syntax region phiString start='"' end='"' contains=phiStringEscape
syntax match phiStringEscape '\\.' contained

" Lambda shortcut (preservado)
nnoremap \l iλ<ESC>
inoremap \l λ

" Highlight Links
highlight default link phiVarName Number
highlight default link phiLambda sassProperty
highlight default link phiDot Operator
highlight default link phiKeyword Macro
highlight default link phiSpecialChar Delimiter
highlight default link phiIdentifier Function
highlight default link phiCommentLine Comment
highlight default link phiCommentBlock Comment
highlight default link phiString String
highlight default link phiStringEscape Special

let b:current_syntax = 'phi'
"
"
"
" " Vim syntax file
" " Language: Phi
"
" if exists("b:current_syntax")
"   finish
" endif
"
" " Variable names (start with lowercase, excluding reserved keywords)
" syntax match phiVarName '\v<[a-z][a-zA-Z0-9_]*>' containedin=ALLBUT,phiKeyword,phiCommentLine,phiCommentBlock
"
" " Lambda expressions
" syntax match phiLambda 'λ'
" syntax match phiDot '\.'
"
" " Let definitions (highlighted as keywords)
" syntax keyword phiKeyword let
"
" " Special characters
" syntax match phiSpecialChar '[()=]'
"
" " Boolean literals
" syntax keyword phiBoolean true false
"
" " Identifiers for common functional terms (custom highlight)
" syntax keyword phiIdentifier neg cons nil
"
" " Comment handling (now properly separated)
" syntax match phiCommentLine '--.*$'
" syntax region phiCommentBlock start='{-' end='-}'
"
" " Strings and escape sequences
" syntax region phiString start='"' end='"' contains=phiStringEscape
" syntax match phiStringEscape '\\.' contained
"
" " Lambda shortcut (preserved as requested)
" nnoremap \l iλ<ESC>
" inoremap \l λ
"
" " Highlight Links
" highlight default link phiVarName Identifier
" highlight default link phiLambda Special
" highlight default link phiDot Operator
" highlight default link phiKeyword Keyword
" highlight default link phiSpecialChar Delimiter
" highlight default link phiBoolean Constant
" highlight default link phiIdentifier Function
" highlight default link phiCommentLine Comment
" highlight default link phiCommentBlock Comment
" highlight default link phiString String
" highlight default link phiStringEscape Special
"
" let b:current_syntax = 'phi'
"
