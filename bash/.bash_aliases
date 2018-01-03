# reload bashrc
alias bsrc='source ~/.bashrc'

# prompt on remove file
alias rm='rm -i'

# ls aliases
alias ll='ls -halF'
alias la='ls -hA'
alias l='ls -CF'

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gg='git gui&'
alias gl='git log --date=relative'
alias gls='git log --pretty=format:"%C(green)%h|%ad%C(red)%d %C(reset)%s %C(yellow)[%cn]" --decorate --date=relative'
alias gll='git log --pretty=format:"%C(green)%h|%ad %C(red)%d %C(reset)%s %C(yellow)[%cn]" --decorate --numstat --date=relative'
alias gllast='gll -1'
alias gdlast='git diff HEAD^'
alias gitprune='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gitwip='git add . && git push -m "WIP" && git push -u origin `git rev-parse --abbrev-ref HEAD`'

# others
alias y='yes'
alias tree='tree -I "node_modules"'
alias f='fg'
alias j='jobs'
