" Vim syntax file
" Language:     Fa
" Maintainer:   Ari Archer <ari.web.xyz@gmail.com>
" Last Change:  2022 Jun 24

" Usage Instructions
" Put this file in ~/.vim/syntax/fa.vim and
" then put fa.ftp.vim to ~/.vim/ftdetect/fa.ftp.vim

scriptencoding utf-8

if exists("b:current_syntax")
    finish
endif


" TODOs
syntax keyword faTodo TODO XXX FIXME NOTE


" Language keywords
syntax keyword faKeyword sys drop swap copy nop


" Escapes
syntax match faEscape +\\[ntbrf'"\\]+ contained
syntax match faEscape "\\{\d*}" contained


" Numbers
syntax match faNumber "\<\d*\>"


" Comments
syntax region faCommentLine start="--" end="$" contains=faTodo
syntax region faCommentLine start="--<" end=">--" contains=faTodo


" Strings
syntax region faString start=/\v"/ skip=/\v\\./ end=/\v"/ contains=faEscape


" Mutability
syntax keyword faMutability ro rw


" Macros
syntax keyword faMacro macro end undefine
syntax match faMacro "%\S*"


" Includes
syntax keyword faInclude include
syntax region faString start=/\v'/ skip=/\v\\./ end=/\v'/


" Operators
syntax keyword faOperator add sub mul bor band xor


" Deprecated keywords
syntax keyword faDeprecated buffer


" Set highlights
highlight default link faTodo Todo
highlight default link faKeyword Keyword
highlight default link faCommentLine Comment
highlight default link faString String
highlight default link faEscape Special
highlight default link faNumber Number
highlight default link faMutability Define
highlight default link faMacro Define
highlight default link faInclude Function
highlight default link faOperator Operator
highlight default link faDeprecated Error


" Set syntax
let b:current_syntax = "fa"

