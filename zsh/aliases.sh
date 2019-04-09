# shell/aliases.sh
# NB: Disable alias by running with backslash, e.g.: \grep
#------------------------------------------------------------------------------
# ALIASES: HOME & FUN
#------------------------------------------------------------------------------
alias apis="ssh apis"
alias sdf="ssh sdf"
alias ma="ssh ma"
command -v /Applications/VMware\ Fusion.app/Contents/Library/vmrun 2>&1 && \
  alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

alias ls='ls --color=auto'
alias sl='ls'

#------------------------------------------------------------------------------
# ALIASES: GIT
#------------------------------------------------------------------------------

alias gb='git branch'
alias gh='git hist'
alias ghf='git hist --format=medium --stat'
alias gco='git checkout'
alias gpo="git push origin HEAD"

#------------------------------------------------------------------------------
# ALIASES: WORK
#------------------------------------------------------------------------------
alias pc="cd ~/procore/"

#------------------------------------------------------------------------------
# ALIASES: GENERAL
#------------------------------------------------------------------------------
alias rgrep='grep -r'
alias vvim='vim --cmd "let minimal=1"'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -iv'
alias cdiff="colordiff -yw --suppress-common-lines"

#------------------------------------------------------------------------------
# ALIASES: RUBY, RAILS
#------------------------------------------------------------------------------
# bundler
alias brake='bundle exec rake'
alias be='bundle exec'
alias brails='bundle exec rails'
