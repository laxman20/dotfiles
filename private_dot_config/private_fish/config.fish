if status is-interactive
# Commands to run in interactive sessions can go here
  abbr vim nvim
  abbr gst git status
  abbr gdiff git diff

  fish_add_path /opt/nvim-linux-x86_64/bin

  set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/ripgreprc
end
