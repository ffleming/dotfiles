# shell/prompt-zsh.sh

#------------------------------------------------------------------------------
# Source .zshrc.local
#------------------------------------------------------------------------------
alias reload!="source ~/.zshrc"

#------------------------------------------------------------------------------
# COMMAND COMPLETION
#------------------------------------------------------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $SHELL_CONFIG/git-flow-completion.zsh

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
  elif [[ $1 == 'reset'  ]]; then echo -n %{$reset_color%}
  fi
}

#------------------------------------------------------------------------------
# PROMPT WITH SHORT PWD, COLORIZED GIT INFO
#------------------------------------------------------------------------------
setopt prompt_subst       # enables command substitution

PS1=$'$(color blue)%c ' # basename of pwd after a newline
PS1+='$(git_branch)'      # current branch or commit name, with color
PS1+='$(color reset)%# '  # reset color, add %
export PS1

#------------------------------------------------------------------------------
# DIRECTORY STACK  (see http://j.mp/1lOiWio)
#------------------------------------------------------------------------------
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
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

#------------------------------------------------------------------------------
# UNDO (DISABLE ZSH AND THOUGHTBOT SETTINGS)
#------------------------------------------------------------------------------
disable r       # disable zsh's r
unalias mcd g 2>/dev/null
