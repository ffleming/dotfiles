# shell/env.sh
#------------------------------------------------------------------------------
# PATH
#------------------------------------------------------------------------------
PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:"
PATH+="/opt/X11/bin:/usr/texbin:"
PATH+="/usr/bin:/bin:/usr/sbin:/sbin:"
PATH+="/usr/local/texlive/2013/bin/x86_64-darwin:"
PATH+="/usr/local/heroku/bin:"
PATH+="/usr/local/opt/coreutils/libexec/gnubin:"
export PATH
[[ -d "/usr/pkg/bin" ]] && export PATH="$PATH:/usr/pkg/bin"

#------------------------------------------------------------------------------
# JAVA PATH and OPTS
#------------------------------------------------------------------------------
[[ -f "/usr/bin/java" ]] && export JAVA_OPTS="-Xmx2048m"
[[ -f "/usr/libexec/java_home" ]] && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

#------------------------------------------------------------------------------
# More PATH vars
#------------------------------------------------------------------------------
MANPATH="/usr/local/man:$MANPATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

export INFOPATH="/usr/local/texlive/2013/texmf-dist/doc/info"
export NODE_PATH="/usr/local/lib/node_modules"

#------------------------------------------------------------------------------
# SYNTAX HIGHLIGHTING
#------------------------------------------------------------------------------
export CLICOLOR=1  # BSD
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="di=00;34:ex=00;31:ln=00;32:or=00;35:mi=90;30"  # GNU

#------------------------------------------------------------------------------
# COMPILATION FLAGS
#------------------------------------------------------------------------------
export ARCHFLAGS="-arch x86_64"   # for compiling gems
export RUBY_CFLAGS="-march=native -O3"
export CC=/usr/bin/gcc  # if can't find C compiler

#------------------------------------------------------------------------------
# MISC ENV VARIABLES
#------------------------------------------------------------------------------
export HISTCONTROL=ignoreboth   # Ignore spaces and duplicates
export HISTIGNORE="??:&:pwd:ls -l:ls -la:cd \-:cd /:h::...:llall:ll.:"

export EDITOR="vim"
export PAGER="less"
export LESS="-R"
export QUOTING_STYLE=literal

#------------------------------------------------------------------------------
# RBENV
#------------------------------------------------------------------------------

if [ "$(type -w rbenv)" =~ "rbenv: (function|command)" ]; then
  eval "$(rbenv init -)"
fi

#------------------------------------------------------------------------------
# ERLANG
#------------------------------------------------------------------------------

export ERL_AFLAGS="-kernel shell_history enabled"
