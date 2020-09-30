function! PackInit() abort
	packadd minpac

	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Additional plugins here.
	call minpac#add('romainl/Apprentice')
	call minpac#add('romainl/vim-cool')
	call minpac#add('christoomey/vim-tmux-navigator')
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('editorconfig/editorconfig-vim')
	call minpac#add('nvim-lua/completion-nvim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-projectionist')
	call minpac#add('neovim/nvim-lsp')
	call minpac#add('nvim-lua/diagnostic-nvim')
	call minpac#add('hauleth/asyncdo.vim')
	call minpac#add('kassio/neoterm')
	call minpac#add('norcalli/snippets.nvim')

endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

set number
set hidden
set tabstop=4 shiftwidth=4
set incsearch
set ignorecase smartcase
set tagcase=smart
set tags+=jstags
set grepprg=ag\ --vimgrep
set splitright splitbelow
set cursorline
colorscheme apprentice

inoremap jk <Esc>
nnoremap <Space>f :FZF<CR>
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
inoremap <C-f> <C-x><C-f>

tnoremap jk <C-\><C-n>
nnoremap <Space>tt :T !!<CR>
nnoremap <Space>tl :Tclear<CR>
let g:neoterm_autoscroll = 1

command! FiletypeSettings if &filetype != ""
			\|  execute 'vsplit ~/.config/nvim/after/ftplugin/' . &filetype . '.vim'
			\| endif

command! Snippets edit ~/.config/nvim/lua/snippets-config/init.lua


augroup commands
	autocmd!
	autocmd BufEnter * lua require'completion'.on_attach()
	au BufRead,BufNewFile jstags		setlocal filetype=tags
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'snippets.nvim'
let g:diagnostic_insert_delay = 1

packloadall!
lua require'lsp'
lua require'snippets-config'

command! Ghistory Glog -- %

