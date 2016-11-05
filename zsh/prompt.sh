# shell/prompt-zsh.sh

#------------------------------------------------------------------------------
# PROMPT FUNCTIONS
#------------------------------------------------------------------------------

function git_color {
  if [[ $git_status =~ "working tree clean" ]]; then
    if [[ $git_status =~ "Your branch is ahead of" ]]; then
      echo -ne $(color bold-green)
    else
      echo -ne $(color green)
    fi
  elif [[ $git_status =~ "Unmerged" ]]; then
    echo -ne $(color bold-violet)
  else
    echo -ne $(color bold-red)
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local is_on_branch='^On branch ([^[:space:]]+)'
  local is_on_commit='HEAD detached at ([^[:space:]]+)'
  local is_rebasing="rebasing branch '([^[:space:]]+)' on '([^[:space:]]+)'"

  if [[ $git_status =~ $is_on_branch ]]; then
    local branch=${BASH_REMATCH[1]:-$match[1]} # bash/zsh portable
    if [[ $git_status =~ "Unmerged paths" ]]; then
      git_color && echo -n "merging into $branch "
    else
      git_color && echo -n "$branch "
    fi
  elif [[ $git_status =~ $is_on_commit ]]; then
    local commit=${BASH_REMATCH[1]:-$match[1]}
    git_color && echo -n "$commit "
  elif [[ $git_status =~ $is_rebasing ]]; then
    local branch=${BASH_REMATCH[1]:-$match[1]}
    local commit=${BASH_REMATCH[2]:-$match[2]}
    git_color && echo -n "rebasing $branch on $commit "
  fi
}

#------------------------------------------------------------------------------
# COMMAND COMPLETION
#------------------------------------------------------------------------------
if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
else
  fpath=($HOME/.zsh/zsh-completions/src $fpath)
fi

if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

source $SHELL_CONFIG/git-flow-completion.zsh

# AWS Completion
if [ -f "/usr/local/share/zsh/site-functions/_aws" ]; then
  source "/usr/local/share/zsh/site-functions/_aws"
fi

#------------------------------------------------------------------------------
# COLORS
#------------------------------------------------------------------------------
autoload colors && colors

function color {
  if   [[ $1 == 'red'    ]]; then echo -n %{$fg_no_bold[red]%}
  elif [[ $1 == 'yellow' ]]; then echo -n %{$fg_no_bold[yellow]%}
  elif [[ $1 == 'green'  ]]; then echo -n %{$fg_no_bold[green]%}
  elif [[ $1 == 'violet' ]]; then echo -n %{$fg_no_bold[magenta]%}
  elif [[ $1 == 'blue'   ]]; then echo -n %{$fg_no_bold[blue]%}
  elif [[ $1 == 'white'  ]]; then echo -n %{$fg_no_bold[white]%}
  elif [[ $1 == 'bold-red'    ]]; then echo -n %{$fg_bold[red]%}
  elif [[ $1 == 'bold-yellow' ]]; then echo -n %{$fg_bold[yellow]%}
  elif [[ $1 == 'bold-green'  ]]; then echo -n %{$fg_bold[green]%}
  elif [[ $1 == 'bold-violet' ]]; then echo -n %{$fg_bold[magenta]%}
  elif [[ $1 == 'bold-blue'   ]]; then echo -n %{$fg_bold[blue]%}
  elif [[ $1 == 'bold-white'  ]]; then echo -n %{$fg_bold[white]%}
  elif [[ $1 == 'reset'  ]]; then echo -n %{$reset_color%}
  fi
}

#------------------------------------------------------------------------------
# PROMPT WITH SHORT PWD, COLORIZED GIT INFO
#------------------------------------------------------------------------------
if [ "$(type -w color)" == "color: function" ]; then
  if [[ "$USER" == 'root' ]]; then
    namecolor='bold-red'
  else
    namecolor='bold-yellow'
  fi
  PS1=$'$(color "$namecolor")%n@%m$(color reset) $(color blue)%1~ ' # basename of pwd after a newline
  PS1+='$(git_branch)'      # current branch or commit name, with color
  PS1+='$(color reset)%# '  # reset color, add %
else
  PS1=$'%n@%m %1~ $(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f 3) %# ' # basename of pwd after a newline
fi

export PS1

#------------------------------------------------------------------------------
# DIRECTORY STACK  (see http://j.mp/1lOiWio)
#------------------------------------------------------------------------------
DIRSTACKSIZE=5

#------------------------------------------------------------------------------
# SMART HISTORY NAVIGATION
#------------------------------------------------------------------------------
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward
bindkey "\eOA" history-search-backward
bindkey "\eOB" history-search-forward

#------------------------------------------------------------------------------
# ENSURE DELETE KEY DELETES
#------------------------------------------------------------------------------
bindkey "^[[3"   prefix-2     # backwards
bindkey "^[[3~"  delete-char  # forwards
