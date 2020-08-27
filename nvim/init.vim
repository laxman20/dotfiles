
function! PackInit() abort
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Additional plugins here.
	call minpac#add('romainl/Apprentice')
	call minpac#add('christoomey/vim-tmux-navigator')
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('editorconfig/editorconfig-vim')
endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()


set number
colorscheme apprentice

inoremap jk <Esc>
nnoremap <Space>f :Files<CR>
