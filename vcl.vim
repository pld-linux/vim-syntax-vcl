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
syn region vclCodeBlock start="\s*\<sub\|backend\|director\|acl\>" end="{"he=e-1 contains=vclCodeBlockName,vclFunctionName
syn match  vclCodeBlockName "\<sub\|backend\|director\|acl\>" contained
"syn match  vclFunctionName "\h[[:alnum:]_:]*" contained

" Highlight the C block
syn include @vclC syntax/c.vim
unlet b:current_syntax
" Mark block tags itself as comment
syn region vclCBlock matchgroup=vclComment start=/C{/ end=/}C/ contains=@vclC keepend

hi link vclCodeBlock	Function
hi link vclComment 		Comment
hi link vclStatement	Statement
hi link vclFunctionName	Identifier
hi link vclCodeBlockName	Statement
