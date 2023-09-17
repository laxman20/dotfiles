local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins", {})

vim.wo.number = true
vim.o.hidden = true
vim.o.incsearch = true
vim.o.inccommand = 'nosplit'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tagcase = 'smart'
vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'

vim.g.diagnostic_insert_delay = 1

if vim.fn.has('termguicolors') then
	vim.opt.termguicolors = true
end

vim.api.nvim_create_user_command("Ghistory", "Gllog -- %", {})

require("lsp")

vim.cmd [[

inoremap jk <Esc>
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
inoremap <C-f> <C-x><C-f>


nnoremap gV ggVG


tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

nnoremap <Space>f <cmd>lua require('fzf-lua').files()<CR>
nnoremap <Space>g <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <Space>G <cmd>lua require('fzf-lua').live_grep()<CR>

tnoremap jk <C-\><C-n>
augroup commands
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
	autocmd BufEnter term://* startinsert

	au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END

]]
