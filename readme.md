There's two ways to use this:

### 1. Non-versioned (*the boring way*)

You'll download all the files and place them on the correct location, and forget about it. For example, you'll place the `dotvim/vimrc` file as `~/.vimrc` in your file system, and the `dotvim/bundle` directory inside your `~/.vim/`.
This is the "normal" way of doing it, as of old-school.

### 2. Versioned, powered by Git (*aka the awesome way*)
You'll clone the repo:

    git clone https://bitbucket.com/rgoliveira/dotvim.git

And then you'll create two [symlinks](http://en.wikipedia.org/wiki/Symbolic_link):
```
# suppose you cloned into /repos/dotvim
ln -s /repos/dotvim/.vimrc ~/.vimrc
ln -s /repos/dotvim/.vim ~/.vim
```
*Ps: some plugins may require additional packages*

And... ta-da! You're all set.

Whenever you need to modify something inside your `~/.vim` (or the `~/.vimrc`), just push the changes to the repo. Just remember to pull everywhere else you have this setup.

Happy editing!