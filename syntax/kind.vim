" Vim syntax file
" Language: Kind

if exists("b:current_syntax")
  finish
endif

" Type Definitions (start with capital letter)
syntax match kindTypeName '\v<[A-Z][a-zA-Z0-9_]*>'

" Constructors (start with #)
syntax match kindConstructor '\v#[A-Z][a-zA-Z0-9_]*>'

" Natural Number Constructors
syntax match kindNaturalNumber '\v#\d+'

" Import and Alias
syntax keyword kindImportKeyword use as
syntax match kindImportAlias '\v\zs[a-z_][a-zA-Z0-9_]*\ze\s*$'
syntax match kindImportPath '\v[A-Z][a-zA-Z0-9_]*/[a-z_][a-zA-Z0-9_]*'

" Function Definitions (with space-separated params)
syntax match kindFunctionDefinition '\v<[a-z_][a-zA-Z0-9_]*>\s+[a-z_][a-zA-Z0-9_]*'
syntax match kindFunctionCall '\v<[a-z_][a-zA-Z0-9_]*>\ze\('

" Data Type Definition Region
syntax region kindDataTypeDefinition 
    \ matchgroup=kindKeywords 
    \ start='data' 
    \ end='}'
    \ contains=kindTypeName,kindConstructor

" Keywords
syntax keyword kindKeywords open case with for in switch type if then elif else 
                            \ do while when pass rewrite match object let default 
                            \ module public instance where return import

" Operators
syntax match kindOperator '\v[-+*/%=<>!&|^~]+'

" Strings and Character Literals
syntax region kindString start='"' end='"' contains=kindStringEscape
syntax match kindStringEscape '\\.' contained

" Special Symbols
syntax match kindSpecialSymbol '\v[λΣ≡→∀]'

" Comments
syntax match kindCommentLine '//.*$'

" Attributes
syntax region kindAttribute start='#\[' end='\]'

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


" Highlight Links
highlight default link kindTypeName Type
highlight default link kindConstructor Constant
highlight default link kindNaturalNumber Number
highlight default link kindFunctionDefinition Function
highlight default link kindFunctionCall Function
highlight default link kindDataTypeDefinition Structure
highlight default link kindKeywords Keyword
highlight default link kindImportKeyword Keyword
highlight default link kindImportAlias Function
highlight default link kindImportPath String
highlight default link kindOperator Operator
highlight default link kindString String
highlight default link kindStringEscape Special
highlight default link kindSpecialSymbol Special
highlight default link kindCommentLine Comment
highlight default link kindAttribute PreProc

let b:current_syntax = 'kind'
