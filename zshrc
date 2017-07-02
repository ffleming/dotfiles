setopt prompt_subst

# load custom completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit -u

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=16384
SAVEHIST=16384

# awesome cd movements from zshkit
setopt autopushd pushdminus pushdsilent pushdtohome
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word

SHELL_CONFIG="$HOME/.zsh"

[[ -f $SHELL_CONFIG/env.sh ]]        && source $SHELL_CONFIG/env.sh
[[ -f $SHELL_CONFIG/aliases.sh ]]    && source $SHELL_CONFIG/aliases.sh
[[ -f $SHELL_CONFIG/functions.sh ]]  && source $SHELL_CONFIG/functions.sh
[[ -f $SHELL_CONFIG/git.sh ]]        && source $SHELL_CONFIG/git.sh
[[ -f $SHELL_CONFIG/prompt.sh ]]     && source $SHELL_CONFIG/prompt.sh
[[ -f $HOME/.zshrc.local ]]          && source $HOME/.zshrc.local
[[ -f ~/.fzf.zsh ]]                  && source ~/.fzf.zsh

