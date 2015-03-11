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
rm -rf ~/.vim ~/.vimrc ~/.gvimrc
stow -t ~ -d $dothome vim
rm -rf ~/.bashrc
stow -t ~ -d $dothome bash

