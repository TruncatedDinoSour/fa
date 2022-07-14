" Vim syntax file
" Language:     Fa
" Maintainer:   Ari Archer <ari.web.xyz@gmail.com>
" Last Change:  2022 Jun 30

" Usage Instructions
" Put this file in ~/.vim/syntax/fa.vim and
" then put fa.ftp.vim to ~/.vim/ftdetect/fa.ftp.vim

scriptencoding utf-8

if exists("b:current_syntax")
    finish
endif


" TODOs
syntax keyword faTodo    TODO XXX FIXME NOTE


" Language keywords
syntax keyword faKeyword sys drop swap copy nop as deref point label goto set


" Escapes
syntax match faEscape +\\[0ntbrf'"\\]+ contained
syntax match faEscape "\\{\d*}"        contained


" Numbers
syntax match faNumber "\<\d*\>"


" Comments
syntax region faCommentLine start="--" end="$"    contains=faTodo
syntax region faCommentLine start="--<" end=">--" contains=faTodo


" Strings
syntax region faString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=faEscape


" Mutability
syntax keyword faMutability ro rw


" Macros/definitions
syntax keyword faMacro undefine unname shift reset
syntax match   faMacro "%\S*"


" Includes
syntax keyword faInclude include        nextgroup=faString skipwhite
syntax region  faString start=/\W'/ skip=/\v\\./ end=/\v'/ contained


" Operators
syntax keyword faOperator add sub mul bor ban xor shr shl grt lst bot eql


" Deprecated keywords
syntax keyword faDeprecated buffer


" Names
syntax match faName "@\S*"


" Statements
syntax keyword faStatement fun ret if else macro


" Functions
syntax match faFuncCall "#\S*"


" Compile time delimeters
syntax keyword faDelimeter end
syntax match   faDelimeter "\(\.\.\.\)"


" Set highlights
highlight default link faTodo        Todo
highlight default link faKeyword     Keyword
highlight default link faCommentLine Comment
highlight default link faString      String
highlight default link faEscape      Special
highlight default link faNumber      Number
highlight default link faMutability  Define
highlight default link faMacro       Define
highlight default link faInclude     Include
highlight default link faOperator    Operator
highlight default link faDeprecated  Error
highlight default link faName        Type
highlight default link faStatement   Statement
highlight default link faFuncCall    Statement
highlight default link faDelimeter   Statement


" Set syntax
let b:current_syntax = "fa"

