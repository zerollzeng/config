
# set command line style
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[95m\]\u @ \[\e[96m\]\H \[\e[93m\]\w \[\e[91m\]\$(parse_git_branch)\n\[\e[92m\]$ "

# tab completion ignore case
bind 'set completion-ignore-case on'
