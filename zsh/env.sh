# shell/env.sh
#------------------------------------------------------------------------------
# PATH
#------------------------------------------------------------------------------
PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:"
PATH+="/opt/X11/bin:/usr/texbin:"
PATH+="/usr/local/texlive/2013/bin/x86_64-darwin:"
PATH+="/usr/local/lib/node_modules" #/usr/local/lib/node:/usr/local/share/npm/bin
PATH+="/usr/local/heroku/bin:"
PATH+="/usr/local/opt/coreutils/libexec/gnubin:"
PATH+="/usr/bin:/bin:/usr/sbin:/sbin:"
export PATH
[[ -d "/usr/pkg/bin" ]] && export PATH="$PATH:/usr/pkg/bin"

#------------------------------------------------------------------------------
# JAVA PATH and OPTS
#------------------------------------------------------------------------------
[[ -f "/usr/bin/java" ]] && export JAVA_OPTS="-Xmx2048m"
[[ -f "/usr/libexec/java_home" ]] && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

#------------------------------------------------------------------------------
# CD PATH
#------------------------------------------------------------------------------
# CDPATH=".:$HOME/Desktop:$HOME/Developer:$HOME"
# export CDPATH

#------------------------------------------------------------------------------
# More PATH vars
#------------------------------------------------------------------------------
# MANPATH="$(manpath)"
MANPATH="/usr/local/man:$MANPATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH

export INFOPATH="/usr/local/texlive/2013/texmf-dist/doc/info"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/usr/local/lib/python"
export NODE_PATH="/usr/local/lib/node_modules"

#------------------------------------------------------------------------------
# SYNTAX HIGHLIGHTING
#------------------------------------------------------------------------------
export CLICOLOR=1  # BSD
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="di=00;34:ex=00;31:ln=00;32:or=00;35:mi=90;30"  # GNU
export TERM=xterm-256color  # Set colors to match iTerm2 Terminal Colors
alias grep='GREP_COLOR="33;40" LANG=C grep --color=auto'

#------------------------------------------------------------------------------
# COMPILATION FLAGS
#------------------------------------------------------------------------------
export ARCHFLAGS="-arch x86_64"   # for compiling gems
# ---- For Ruby compilation with rbenv ----
# RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` "
# RUBY_CONFIGURE_OPTS+="--enable-shared"
# export RUBY_CONFIGURE_OPTS
export RUBY_CFLAGS="-march=native -O3"
export CC=/usr/bin/gcc  # if can't find C compiler

#------------------------------------------------------------------------------
# MISC ENV VARIABLES
#------------------------------------------------------------------------------
export HISTCONTROL=ignoreboth   # Ignore spaces and duplicates
export HISTIGNORE="??:&:pwd:ls -l:ls -la:cd \-:cd /:h::...:llall:ll.:"
export EDITOR="vim"
export PAGER="less"

#------------------------------------------------------------------------------
# EC2 CLI TOOLS
#------------------------------------------------------------------------------
# export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.13.0/libexec"
# export JAVA_HOME="$(/usr/libexec/java_home)"
# export EC2_URL='https://ec2.us-west-2.amazonaws.com'

#------------------------------------------------------------------------------
# API KEYS
#------------------------------------------------------------------------------
export HOMEBREW_GITHUB_API_TOKEN
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY

#------------------------------------------------------------------------------
# NVM
#------------------------------------------------------------------------------
[[ -d "$HOME/.nvm" ]] && NVM_DIR=~/.nvm
[[ -f "/usr/local/bin/brew" ]] && source "$(brew --prefix nvm)/nvm.sh"
#------------------------------------------------------------------------------
# RVM
#------------------------------------------------------------------------------
export PATH="$PATH:$HOME/.rvm/bin"
