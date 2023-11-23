local b64 = require('b64');

function set_user_var(is_vim)
	io.write(string.format("\027]1337;SetUserVar=IS_VIM=%s\a", b64.enc(is_vim)))
end

local nav = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

function move(dir)
	local win = vim.api.nvim_get_current_win()
	local pane = vim.env.WEZTERM_PANE
	vim.cmd.wincmd(dir)
	if pane and vim.api.nvim_get_current_win() == win then
		vim.loop.spawn('wezterm', {
			args = {'cli', 'activate-pane-direction', nav[dir]}
		})
	end
end

vim.keymap.set('n', '<C-l>', function() move('l') end)
vim.keymap.set('n', '<C-h>', function() move('h') end)
vim.keymap.set('n', '<C-j>', function() move('j') end)
vim.keymap.set('n', '<C-k>', function() move('k') end)

set_user_var("true")

vim.api.nvim_create_augroup('WeztermVar', { clear = true })
vim.api.nvim_create_autocmd('ExitPre', {
  group = 'WeztermVar',
  callback = function()
    set_user_var("false")
  end
})

