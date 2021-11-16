##############################################################
############### added by zerollzeng/config ###################
##############################################################

# set command line style
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[95m\]\u @ \[\e[96m\]\H \[\e[00m\]\D{%Y/%m/%d-%H:%M:%S} \[\e[93m\]\w \[\e[91m\]\$(parse_git_branch)\n\[\e[92m\]$ \[\e[00m\]"

# tab completion ignore case
# bind 'set completion-ignore-case on'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

##############################################################
######################### end ################################
##############################################################
