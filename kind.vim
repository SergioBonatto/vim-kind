" Vim syntax file
" Language: Kind

" Usage Instructions
" Put this file in .vim/syntax/kind.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.kind set filetype=kind

if exists("b:current_syntax")
  finish
endif


" Function
syntax region kindFunction matchgroup=Function start="\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *(" matchgroup=Function end=")" transparent
syntax region kindFunction matchgroup=Function start="\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *<" matchgroup=Function end=">" transparent
syntax region kindFunction matchgroup=Function start="\(\(\a\|[.][._\a]\)[._\w]*\)\+\ *(" matchgroup=Function end="!" transparent

" Hole and reflection
syntax keyword kindString refl
syntax region kindString start="?" end="$"

" Language keywords
syntax keyword kindKeywords λ e let open case with for in as switch type if then else def while when pass rewrite

"Number literals
syntax match kindNumber "\<[0-9]\+\>\|\<[0-9_]\+\>\|\<0[xX][0-9a-fA-F_]\+\>\|\<0[oO][0-7_]\+\>\|\<0[bB][10_]\+\>"

" Operator
syntax match kindOperator "[-!|&+<>=%/*~^:]"

" Strings literals
syntax region kindString start=/\v"/ skip=/\v\\./ end=/\v"/

" Strings
syntax region kindString start='"' end='"'
syntax region kindString start='\'' end='\''

" Specials
syntax keyword kindSpecial nil cons one zero succ pred true false new empty tie e i o pos neg tail head

" Type
syntax match kindTypeNames "\<[A-Z][a-zA-Z0-9_']*\>"

" Comments
syntax region kindCommentLine start="//" end="$"

" TODO
syntax keyword kindTodo contained TODO FIXME XXX TBD NOTE
" augroup vimrc_todo
"     au!
"     au Syntax * syn match kindTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
"           \ containedin=.*Comment,vimCommentTitle,kindCommentLine
" augroup END

" Set highlights
highlight default link kindTypeNames Type
highlight default link kindNumber Number
highlight default link kindFunction Function
highlight default link kindSpecial Boolean
highlight default link kindOperator Operator
highlight default link kindString String

highlight default link kindKeywords Keyword
highlight default link kindCommentLine Comment
highlight default link kindTodo Todo
