#!/usr/bin/env bash
set stowcmd="stow"
hash $stowcmd 2>/dev/null || { 
  echo >&2 "I require $stowcmd, but it's not installed.";
  echo >&2 "Please install it because 1) I need it and 2) it's awesome.";
  echo >&2 "Aborting.";
  exit 1;
}

set dothome=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
stow -t ~ $dothome\vim

