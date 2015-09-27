# shell/aliases.sh
# NB: Disable alias by running with backslash, e.g.: \grep
#------------------------------------------------------------------------------
# ALIASES: HOME & FUN (and shell variables, too)
#------------------------------------------------------------------------------
alias apis="ssh apis"
alias sdf="ssh sdf"

#------------------------------------------------------------------------------
# ALIASES: WORK (and shell variables, too)
#------------------------------------------------------------------------------
export LFFS=~/Oversee/Farespotter

alias load-lffs-images="rsync -r $LDAPUSERNAME@www01.lffs.prod:/home/travel/apps/FarespotterNet/shared/images/ $LFFS/public/images/r/"
#------------------------------------------------------------------------------
# ALIASES: GENERIC SHORTCUTS
#------------------------------------------------------------------------------
alias rgrep='grep -r'
alias "rvm-reload"='rvm use $(cat .ruby-version)'

#------------------------------------------------------------------------------
# ALIASES: FILE MANAGEMENT
#------------------------------------------------------------------------------
alias ..="\cd ..;ls"          # go to parent dir and list contents
alias ...="\cd ../..;ls"      # go to grandparent dir and list contents
alias _="\cd -;ls"            # go to previous wd and list contents
alias mkdir='mkdir -p'        # create subdirectories as necessary
alias desk="\cd ~/Desktop"    # go to desktop
alias h="history"             # show history

#------------------------------------------------------------------------------
# ALIASES: SAFEGUARDS
#------------------------------------------------------------------------------
alias rm='rm -i'              # confirm deletion
alias mv='mv -i'              # confirm move if overwriing existing file
alias cp='cp -i'              # confirm copy if overwriting existing file
alias ln='ln -iv'             # display error if link exists; link verbosely

function delete {
  echo "rm -rf $@"
  echo -n "rm: Permanently delete the selected files/directories? "
  echo -n "This cannot be undone. "
  read dir

  if [[ $dir =~ ^[yY](es)?$ ]]; then
    echo "Deleting: $@"
    rm -rf "$@"
  else
    echo "Canceling with no changes made."
  fi
}

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
alias br='bundle exec rails'
alias brails='br'
alias spec='CODECLIMATE_REPO_TOKEN=$(cat .code_climate.secret 2>/dev/null) bundle exec rspec'

function brspec {
  CODECLIMATE_REPO_TOKEN=$(cat .code_climate.secret 2> /dev/null) bundle exec rspec
}

# rails
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias reset='bundle exec rake db:reset'
alias populate='bundle exec rake db:populate'
alias rss='bundle exec rake db:reset db:seed && rails server'
