# shell/env.sh
#------------------------------------------------------------------------------
# PATH
#------------------------------------------------------------------------------
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

#------------------------------------------------------------------------------
# SYNTAX HIGHLIGHTING
#------------------------------------------------------------------------------
export CLICOLOR=1  # BSD
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="di=00;34:ex=00;31:ln=00;32:or=00;35:mi=90;30"  # GNU

#------------------------------------------------------------------------------
# MISC ENV VARIABLES
#------------------------------------------------------------------------------
export HISTCONTROL=ignoreboth   # Ignore spaces and duplicates
export HISTIGNORE="??:&:pwd:ls -l:ls -la:cd \-:cd /:h::...:llall:ll.:"

export EDITOR="vim"
export PAGER="less"
export LESS="-R"
export QUOTING_STYLE=literal

