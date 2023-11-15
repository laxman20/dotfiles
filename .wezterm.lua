local w = require('wezterm')
local config = {}

if w.config_builder then
	config = w.config_builder()
end

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.color_scheme = 'OneDark (base16)'
-- config.color_scheme = 'tokyonight_moon'
config.color_scheme = 'Sonokai (Gogh)'


local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
	Left = 'h',
	Down = 'j',
	Up = 'k',
	Right = 'l',
	-- reverse lookup
	h = 'Left',
	j = 'Down',
	k = 'Up',
	l = 'Right',
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == 'resize' and 'META' or 'CTRL',
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
						SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
					}, pane)
			else
				if resize_or_move == 'resize' then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

w.on('update-right-status', function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.keys = {
	-- move between split panes
	split_nav('move', 'h'),
	split_nav('move', 'j'),
	split_nav('move', 'k'),
	split_nav('move', 'l'),
	-- resize panes
	split_nav('resize', 'h'),
	split_nav('resize', 'j'),
	split_nav('resize', 'k'),
	split_nav('resize', 'l'),
	-- splits
	{ key = '|', mods = 'SUPER', action = w.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
	{ key = '_', mods = 'SUPER', action = w.action.SplitVertical { domain = 'CurrentPaneDomain' }},
	{ key = '|', mods = 'SHIFT|SUPER', action = w.action.SplitHorizontal { domain = 'CurrentPaneDomain' }},
	{ key = '_', mods = 'SHIFT|SUPER', action = w.action.SplitVertical { domain = 'CurrentPaneDomain' }},
	-- remove Al+Enter binding
	{ key = 'Enter', mods = 'ALT', action = w.action.DisableDefaultAssignment },
	-- Prompt for a name to use for a new workspace and switch to it.
	{
		key = 'I',
		mods = 'SHIFT|SUPER',
		action = w.action.PromptInputLine {
			description = w.format {
				{ Attribute = { Intensity = 'Bold' } },
				{ Foreground = { AnsiColor = 'Fuchsia' } },
				{ Text = 'Enter name for new workspace' },
			},
			action = w.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						w.action.SwitchToWorkspace {
							name = line,
						},
						pane
					)
				end
			end),
		},
	},
	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	{
		key = '9',
		mods = 'ALT',
		action = w.action.ShowLauncherArgs {
			flags = 'WORKSPACES',
		},
	},
}

return config
