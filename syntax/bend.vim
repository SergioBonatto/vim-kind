" Vim syntax file
" Language: kind

" Usage Instructions
" Put this file in .vim/syntax/kind.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.kind set filetype=kind

if exists("b:current_syntax")
  finish
endif


" Function
syntax match kindFunction '\<\a\w*\(\.\w\+\)*\s*\ze('


" Language keywords
syntax keyword kindKeywords open case with for in as switch type if then elif else do while when then pass rewrite match object let default

"Number literals
syntax match kindNumber "\<[0-9]\+\>\|\<[0-9_]\+\>\|\<0[xX][0-9a-fA-F_]\+\>\|\<0[oO][0-7_]\+\>\|\<0[bB][10_]\+\>"

" Operator
" syntax match kindOperator "[\-!|&+<>%/*=~^:_]"
syntax match kindOperator "\s\([-!|&+<>%/*=~^:_]\)\s"


" Strings literals
syntax region kindString start=/\v"/ skip=/\v\\./ end=/\v"/

" Strings
syntax region kindString start='"' end='"'
syntax region kindString start='\'' end='\''

" Specials
syntax keyword kindSpecial lambda #Nil #Cons One #Zero #Succ pred #True #False new empty tie pos neg tail head fst snd lft rgt left right val True False

" Type
syntax match kindTypeNames "\<[A-Z][a-zA-Z0-9_']*\>"

" Comments
syntax region kindCommentLine start="//" end="$"

" TODO
syntax keyword kindTodo contained TODO FIXME XXX TBD NOTE

syntax match kindUnusedFuncDef '\v<_[a-z0-9_]+'
            \ contained
            \ nextgroup=kindTypeDefParams

syntax keyword kindUserIdent def return in import use Refl
syntax match kindUserStorage "(\s*\a\w*\s*\(,\s*\a\w*\s*\)*)"

syntax match kindUserStorage ' \zs[a-zA-Z0-9_]\+\ze\s*='
syntax match kindUserStorage ' \zs[a-zA-Z0-9_]\+\ze\s*:'


syntax region kindAttribute
            \ matchgroup=kindDelimiter
            \ start='\v#!?\['
            \ skip='\v\(.*\)'
            \ end='\]'

syntax region kindAttributeParenWrapped
            \ start='('
            \ end=')'
            \ containedin=kindAttribute
            \ contains=TOP
            \ keepend
syntax region kindAttributeParenWrapped
            \ start='{'
            \ end='}'
            \ containedin=kindNumberj
            \ contains=TOP
            \ keepend

" Define a new syntax group for kind symbols
syntax match kindSymbol /{!!}/

syntax keyword kindModule module where instance public Refl

syntax keyword kindRefl let

" Nova regra para destacar elementos seguidos por '#' e terminando com '{'
syntax match kindConstructor '\v#\s*\w+([^:{]|\n)*(\ze[:{\n])'

syntax match kindRefl '\v#Refl\s*\{\}'


" Link the new syntax group to the same highlight group as numeric operators
syntax match kindSpecialSymbols /λ\|Σ\|≡\|->\|*\|∀/


syntax match kindVar '/\zs[a-z]\+'
syntax match kindVar 'λ[a-zA-Z]\+'


nnoremap \t i→<ESC>
nnoremap \l iλ<ESC>
nnoremap \f i∀<ESC>
nnoremap \e i≡<ESC>
nnoremap \s iΣ<ESC>

inoremap \t →
inoremap \l λ
inoremap \f ∀
inoremap \e ≡
inoremap \s Σ

"
" Set highlights
highlight default link kindAttribute      Keyword
highlight default link kindCommentLine    Comment
highlight default link kindConstructor    Constant
highlight default link kindDelimiter      Delimiter
highlight default link kindEspecial       Identifier
highlight default link kindFn             Keyword
highlight default link kindFuncDef        Function
highlight default link kindFunction       Function
highlight default link kindKeywords       Statement
highlight default link kindRefl           Identifier
highlight default link kindModule         Identifier
highlight default link kindNumber         Removed
highlight default link kindOperator       Operator
highlight default link kindSpecial        MoreMsg
highlight default link kindSpecialSymbols Macro
highlight default link kindString         String
highlight default link kindSymbol         Question
highlight default link kindTodo           Todo
highlight default link kindTypeNames      MoreMsg
highlight default link kindUnusedFuncDef  kindFuncDef
highlight default link kindUserIdent      Identifier
highlight default link kindUserStorage    Constant
highlight default link kindVar            Macro


" " Links de highlight organizados
" highlight default link kindAttribute      Attribute        " Antes estava como Keyword
" highlight default link kindCommentLine    Comment
" highlight default link kindConstructor    Constructor      " Antes estava como Constant
" highlight default link kindDelimiter      Delimiter
" highlight default link kindEspecial       Identifier          " Antes estava como Identifier
" highlight default link kindFn             Function         " Antes estava como Keyword
" highlight default link kindFuncDef        Function
" highlight default link kindFunction       Function
" highlight default link kindKeywords       Keyword          " Antes estava como Statement
" highlight default link kindRefl           Special          " Antes estava como Identifier
" highlight default link kindModule         Module           " Antes estava como Identifier
" highlight default link kindNumber         Number           " Antes estava como Removed
" highlight default link kindOperator       Operator
" highlight default link kindSpecial        Special          " Antes estava como MoreMsg
" highlight default link kindSpecialSymbols Macro          " Antes estava como Macro
" highlight default link kindString         String
" highlight default link kindSymbol         Symbol           " Antes estava como Question
" highlight default link kindTodo           Todo
" highlight default link kindTypeNames      Type             " Antes estava como MoreMsg
" highlight default link kindUnusedFuncDef  kindFuncDef
" highlight default link kindUserIdent      Identifier
" highlight default link kindUserStorage    Storage          " Antes estava como Constant
" highlight default link kindVar            Variable         " Antes estava como Macro
