" Vim syntax file
" Filename:     vcl.vim
" Language:     Varnish configuation Language, http://www.varnish-cache.org/
" Maintainer:   Elan Ruusamäe <glen@delfi.ee>
" Version Info: $Revision$
" Last Change:  $Date$ UTC

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match vclComment	'#.*'

" Code Blocks
"       sub NAME {
"       backend NAME {
"       director NAME FLAGS {
"       acl NAME {
"syn region vclCodeBlock start="\s*\<sub\|backend\|director\|acl\>" end="{"he=e-1 contains=vclCodeBlockName,vclFunctionName
"syn match  vclCodeBlockName "\<sub\|backend\|director\|acl\>" contained
"syn match  vclFunctionName "\h[[:alnum:]_:]*" contained
"syn match  vclFunctionName "\h\w*[^:]" contained
"
syn keyword vclOperator       set call return synthetic deliver include

" C strings
syn region vclString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=vclSpecial
syn match  vclSpecial display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match  vclSpecialError   "L\='\\[^'\"?\\abfnrtv]'"
syn match  vclSpecialCharacter "L\='\\['\"?\\abfnrtv]'"
syn match  vclSpecialCharacter display "L\='\\\o\{1,3}'"
syn match  vclSpecialCharacter display "'\\x\x\{1,2}'"
syn match  vclSpecialCharacter display "L'\\x\x\+'"


" Highlight the C block
syn include @vclC syntax/c.vim
unlet b:current_syntax

" Mark block tags itself as comment
syn region vclCBlock matchgroup=vclComment start=/C{/ end=/}C/ contains=@vclC keepend

" Synthetic
syn region vclSynthetic start=/{"/hs=s+2 end=/"}/he=e-2

hi link vclCodeBlock	Function
hi link vclComment 		Comment
hi link vclStatement	Statement
hi link vclFunctionName	Identifier
hi link vclCodeBlockName	Statement
hi link vclSpecial          SpecialChar
hi link vclString           String
hi link vclSynthetic	vclString
hi link vclSpecialCharacter   vclSpecialSpecial
hi link vclOperator           Operator

