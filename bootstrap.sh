#!/bin/sh

# setup directories
mkdir ~/.config
mkdir ~/.cache
mkdir ~/.local
mkdir ~/.bin
mkdir ~/.local/share

# install homebrew
mkdir ~/.local/bin/homebrew
git clone https://github.com/Homebrew/brew.git ~/.local/bin/homebrew

mkdir ~/.config/zsh

cat <<EOF > ~/.config/zsh/config.zsh
export HOMEBREW_HOME=$HOME/.local/bin/homebrew
export HOMEBREW_NO_ANALYTICS=1
export PATH=$HOMEBREW_HOME/brew/bin:$PATH.
export PATH=~/.local/bin:$PATH
EOF
