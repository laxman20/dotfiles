setlocal path=.,,src/*/java
setlocal include=^\s*import
let &l:define='^public\ \(abstract\ \)\?\(class\|interface\)'

nnoremap <buffer> <Space>m :!ctags -R --languages=Java src<CR>

function! s:GotoSection(backwards)
	if a:backwards == 1
		let dir = '?'
	else
		let dir = '/'
	endif

	let pattern = '\v^\s*(public |protected |private ).* \{$'
	execute "silent normal! " . dir . pattern . dir . "eW" . "\<CR>"
endfunction

noremap <script> <buffer> <silent> ]] :<C-u>call <SID>GotoSection(0)<CR>
noremap <script> <buffer> <silent> [[ :<C-u>call <SID>GotoSection(1)<CR>
