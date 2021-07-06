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
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-projectionist')
	call minpac#add('neovim/nvim-lsp')
	call minpac#add('hauleth/asyncdo.vim')
	call minpac#add('kassio/neoterm')
	" call minpac#add('nvim-treesitter/nvim-treesitter')
	call minpac#add('Shougo/neosnippet.vim')
	call minpac#add('mfussenegger/nvim-jdtls')
	call minpac#add('justinmk/vim-dirvish')
	call minpac#add('tommcdo/vim-lion')
	call minpac#add('tommcdo/vim-fubitive')
	call minpac#add('sainnhe/sonokai')

	call minpac#add('hrsh7th/nvim-compe')

	call minpac#add('kristijanhusak/orgmode.nvim')

	call minpac#add('nvim-lua/popup.nvim')
	call minpac#add('nvim-lua/plenary.nvim')
	call minpac#add('nvim-telescope/telescope.nvim')

endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

set number
set hidden
set tabstop=4 shiftwidth=4
set incsearch
set inccommand=nosplit
set ignorecase smartcase
set tagcase=smart
set tags+=jstags
set grepprg=ag\ --vimgrep
set splitright splitbelow
set cursorline
inoremap jk <Esc>
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
inoremap <C-f> <C-x><C-f>


nnoremap gV ggVG


tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

" nnoremap <Space>f :FZF<CR>
" let g:fzf_layout = { 'down': '40%' }

nnoremap <Space>f <cmd>Telescope find_files<cr>
nnoremap <Space>g <cmd>Telescope live_grep<cr>

tnoremap jk <C-\><C-n>
nnoremap <Space>tt :T !!<CR>
nnoremap <Space>tl :Tclear<CR>
let g:neoterm_autoscroll = 1

nnoremap <silent> <Space>g :<C-u>silent grep <C-r>=expand('<cword>')<CR><CR>

command! FiletypeSettings if &filetype != ""
			\|  execute 'vsplit ~/.config/nvim/after/ftplugin/' . &filetype . '.vim'
			\| endif

command! Snippets edit ~/.config/nvim/lua/snippets-config/init.lua


augroup commands
	autocmd!
	" autocmd BufEnter * lua require'completion'.on_attach()
	au BufRead,BufNewFile jstags		setlocal filetype=tags
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
	autocmd BufEnter term://* startinsert
augroup END

augroup my_dirvish_events
      autocmd!
      autocmd FileType dirvish nnoremap <buffer> + :edit %
	  au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
  augroup END

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Avoid showing message extra message when using completion
" set shortmess+=c

" let g:completion_auto_change_source = 1
" let g:completion_enable_snippet = 'Neosnippet'
let g:diagnostic_insert_delay = 1

packloadall!
lua require'lsp'
" lua require'treesitter-config'

set completeopt=menu,menuone,noselect

lua <<EOF
require'compe'.setup {
  enabled = true;
  debug = false;
  min_length = 1;
  allow_prefix_unmatch = false;

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
	orgmode = true;
  };
}

require('orgmode').setup({
  org_agenda_files = {'~/org-mode/**/*'}
})

EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

command! Ghistory Glog -- %

let g:neosnippet#disable_runtime_snippets = { '_' : 1}
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

set conceallevel=0 concealcursor=niv

imap <expr> <Tab>
			\ neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

smap <expr> <Tab>
			\ neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

let g:fubitive_domain_pattern = 'ultigit.ultimatesoftware.com'

if has('termguicolors')
	set termguicolors
endif

let g:sonokai_style = 'shusia'

colorscheme sonokai

