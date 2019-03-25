# shell/prompt-zsh.sh

#------------------------------------------------------------------------------
# COMMAND COMPLETION
#------------------------------------------------------------------------------
if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
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

function git_current_branch {
  git symbolic-ref HEAD 2>/dev/null | sed "s/refs\/heads\///"
}

if [ "$(type -w color)" == "color: function" ]; then
  if [[ "$USER" == 'root' ]]; then
    namecolor='bold-red'
  else
    namecolor='bold-yellow'
  fi
  PS1=$'$(color "$namecolor")%n@%m$(color reset) $(color blue)%1~ ' # basename of pwd after a newline
  PS1+='$(color yellow)$(git_current_branch)$(color reset) %# '  # reset color, add %
else
  PS1=$'%n@%M %1~ $(git_current_branch) %# ' # basename of pwd after a newline
fi

export PS1

function zle-line-init zle-keymap-select {
  VIM_NORMAL_PROMPT="$(color yellow)n$(color reset)"
  VIM_INSERT_PROMPT="$(color yellow)i$(color reset)"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_current_branch) $EPS1"
  RPS1="${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(main|viins)/$VIM_INSERT_PROMPT}"
  zle reset-prompt
}

export KEYTIMEOUT=1
export RPS1

zle -N zle-line-init
zle -N zle-keymap-select

#------------------------------------------------------------------------------
# DIRECTORY STACK  (see http://j.mp/1lOiWio)
#------------------------------------------------------------------------------
DIRSTACKSIZE=5
