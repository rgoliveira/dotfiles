# reload bashrc
alias bsrc='source ~/.bashrc'

# prompt on remove file
alias rm='rm -i'

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gls='git log --pretty=format:"%C(green)%h|%ad%C(red)%d %C(reset)%s %C(yellow)[%cn]" --decorate --date=relative'
alias gll='git log --pretty=format:"%C(green)%h|%ad %C(red)%d %C(reset)%s %C(yellow)[%cn]" --decorate --numstat --date=relative'
alias gllast='gll -1'
alias gdlast='git diff -1'

# others
alias y='yes'

