local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
end
vim.opt.rtp:prepend(lazypath)

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

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
vim.o.swapfile = false

vim.g.diagnostic_insert_delay = 1

if vim.fn.has('termguicolors') then
	vim.opt.termguicolors = true
end

vim.api.nvim_create_user_command("Ghistory", "Gllog -- %", {})

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
-- vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true })

local mygroup = vim.api.nvim_create_augroup("commands", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	group = mygroup,
	callback = function()
		vim.highlight.on_yank { higroup="IncSearch", timeout=200 }
	end
})

require("lsp")
