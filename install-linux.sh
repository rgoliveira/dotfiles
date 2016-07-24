#!/usr/bin/env bash

hash stow 2>/dev/null || { 
  echo >&2 "I require stow, but it's not installed.";
  echo >&2 "Please install it because";
  echo >&2 "    1) I need it; and";
  echo >&2 "    2) it's awesome.";
  echo >&2 "Aborting.";
  exit 1;
}

dothome=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# setup vim
rm -rf ~/.vim ~/.vimrc ~/.gvimrc
stow -t ~ -d $dothome vim
# setup neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME}/.config
rm -rf $XDG_CONFIG_HOME/.nvim/init.vim $XDG_CONFIG_HOME/.nvim
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
# setup bash
rm -rf ~/.bashrc ~/.bash_aliases
stow -t ~ -d $dothome bash

