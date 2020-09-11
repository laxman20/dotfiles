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
	call minpac#add('nvim-lua/completion-nvim')
	call minpac#add('hrsh7th/vim-vsnip')
	call minpac#add('hrsh7th/vim-vsnip-integ')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('neovim/nvim-lsp')
	call minpac#add('nvim-lua/diagnostic-nvim')

endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()


set number
set hidden
set tabstop=4 shiftwidth=4
set incsearch
set ignorecase smartcase
set grepprg=ag\ --vimgrep
colorscheme apprentice

inoremap jk <Esc>
nnoremap <Space>f :Files<CR>

autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'vim-vsnip'
let g:diagnostic_insert_delay = 1

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

packloadall!
lua require'lsp'

