##############################################################
############### added by zerollzeng/config ###################
##############################################################

# Timing functions
timer_start() {
    timer=${timer:-$SECONDS}
}

timer_stop() {
    if [[ -n "$timer" ]]; then
        timer_show=$((SECONDS - timer))
        unset timer
    else
        timer_show=0
    fi
}

# Git branch parser with color coding based on repository state
parse_git_branch() {
    local branch
    branch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    
    if [[ -n "$branch" ]]; then
        if git diff --quiet 2>/dev/null; then
            echo -e "\e[92m($branch)\e[0m"  # Green if clean
        else
            echo -e "\e[91m($branch*)\e[0m" # Red if dirty
        fi
    fi
}

# Set up traps and prompt
trap 'timer_start' DEBUG
PROMPT_COMMAND="timer_stop"

# Updated PS1 with inline execution time
export PS1="\[\e[95m\]\u @ \[\e[96m\]\H \[\e[00m\]\D{%Y/%m/%d-%H:%M:%S} \[\e[93m\]\w \[\e[91m\]\$(parse_git_branch) \[\e[92m\](\${timer_show}s)\n\$ \[\e[00m\]"

# Tab completion ignore case
bind 'set completion-ignore-case on'

alias beep='for i in {1..3}; do echo -en "\007"; sleep 0.3; done'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it


cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}

alias cd=cd_func

if [[ $BASH_VERSION > "2.05a" ]]; then
  # ctrl+w shows the menu
  bind -x "\"\C-w\":cd_func -- ;"
fi

##############################################################
######################### end ################################
##############################################################
