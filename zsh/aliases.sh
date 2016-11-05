# shell/aliases.sh
# NB: Disable alias by running with backslash, e.g.: \grep
#------------------------------------------------------------------------------
# ALIASES: HOME & FUN
#------------------------------------------------------------------------------
alias apis="ssh apis"
alias sdf="ssh sdf"
alias ma="ssh ma"
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
command -v nvim >/dev/null 2>&1 && alias vim='nvim' # use nvim where available
alias sl='ls'  # turn off the steam locomotive on typo

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
alias pc="cd $HOME/Procore/procore"

#------------------------------------------------------------------------------
# ALIASES: GENERAL
#------------------------------------------------------------------------------
alias rgrep='grep -r'
alias vvim='vim --cmd "let minimal=1"'

# alias rm='rm -i'              # confirm deletion
alias mv='mv -i'              # confirm move if overwriing existing file
alias cp='cp -i'              # confirm copy if overwriting existing file
alias ln='ln -iv'             # display error if link exists; link verbosely

#------------------------------------------------------------------------------
# ALIASES: MAC STUFF, MISC
#------------------------------------------------------------------------------
alias eject_cd="drutil eject" # eject cd
alias hide="setfile -a V"     # hide a file
alias unhide="setfile -a v"   # unhide a file
alias cdiff="colordiff -yw --suppress-common-lines"
                              # colorize, side-by-side, ignore whitespace, etc

function hidden_files {
  if [[ $1 != "hide" && $1 != "show" ]]; then
    echo "Usage: hidden_files [show|hide]"; return 1;
  fi
  if [[ $1 == "hide" ]]; then
    local view=false;
  elif [[ $1 == "show" ]]; then
    local view=true;
  fi
  defaults write com.apple.finder AppleShowAllFiles $view;
  killall Finder;
}

#------------------------------------------------------------------------------
# ALIASES: RUBY, RAILS
#------------------------------------------------------------------------------
# bundler
alias brake='bundle exec rake'
alias be='bundle exec'
alias brails='bundle exec rails'
alias spec='CODECLIMATE_REPO_TOKEN=$(cat .code_climate.secret 2>/dev/null) bundle exec rspec'

function brspec {
  CODECLIMATE_REPO_TOKEN=$(cat .code_climate.secret 2> /dev/null) bundle exec rspec
}

