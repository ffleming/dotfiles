# shell/aliases.sh
# NB: Disable alias by running with backslash, e.g.: \grep

alias apis="ssh ffleming\@forrestfleming.com@forrestfleming.com"
alias sdf="ssh fsf@sverige.freeshell.org"
#------------------------------------------------------------------------------
# ALIASES: WORK (and shell variables, too)
#------------------------------------------------------------------------------
export LFFS=~/Oversee/Farespotter
export LDAPUSERNAME=ffleming
alias prod="ssh $LDAPUSERNAME@www01.lffs.prod"
alias db01.prod="ssh $LDAPUSERNAME@db01.flp.lax1.oversee.net"
alias www01.prod="ssh $LDAPUSERNAME@www01.lffs.prod"
alias www02.prod="ssh $LDAPUSERNAME@www02.lffs.prod"
alias www03.prod="ssh $LDAPUSERNAME@www03.lffs.prod"
alias stg="ssh $LDAPUSERNAME@www01.lffs.stg"
alias db01.stg="ssh $LDAPUSERNAME@db01.lffs.stg"
alias www01.stg="ssh $LDAPUSERNAME@www01.lffs.stg"
alias www02.stg="ssh $LDAPUSERNAME@www02.lffs.stg"
alias www03.stg="ssh $LDAPUSERNAME@www03.lffs.stg"
alias qa="ssh $LDAPUSERNAME@www01.lffs.qa"
alias jenkins="ssh $LDAPUSERNAME@integration.flp.dev.corp.oversee.net"
alias deploy="ssh $LDAPUSERNAME@deploy01.tools.ops"
alias process01.dash="ssh $LDAPUSERNAME@process01.dash.lax1.oversee.net"
alias dragonslayer="ssh $LDAPUSERNAME@www01.dgs.lax1.oversee.net"
alias www01.dgs="ssh $LDAPUSERNAME@www01.dgs.lax1.oversee.net"
alias www02.dgs="ssh $LDAPUSERNAME@www02.dgs.lax1.oversee.net"
alias slim01.prod="ssh dash@slim01.dash.prod"
alias slim02.prod="ssh dash@slim02.dash.prod"


alias load-lffs-images="rsync -r $LDAPUSERNAME@www01.lffs.lax1.oversee.net:/home/travel/apps/FarespotterNet/shared/images $LFFS/public/images/r/"
#------------------------------------------------------------------------------
# ALIASES: GENERIC SHORTCUTS
#------------------------------------------------------------------------------
alias rgrep='grep -r'
alias rvm-reload='rvm use $(cat .ruby-version)'

#------------------------------------------------------------------------------
# ALIASES: Editors
#------------------------------------------------------------------------------
alias Emacs="open -a Terminal.app /usr/local/bin/emacs" # emacs in new window
alias vi='vim'
#------------------------------------------------------------------------------
# ALIASES: FILE MANAGEMENT
#------------------------------------------------------------------------------
alias ..="\cd ..;ls"          # go to parent dir and list contents
alias ...="\cd ../..;ls"      # go to grandparent dir and list contents
alias _="\cd -;ls"            # go to previous wd and list contents
alias mkdir='mkdir -p'        # create subdirectories as necessary
alias desk="\cd ~/Desktop"    # go to desktop
alias h="history"             # show history
alias l="ls"                  # list files
alias la="ls -A"              # list all files
alias ll="ls -loh"            # show extended listing (but not all files)
alias llg="ls -lh"            # show extended listing with group
alias lla="ls -Aloh"          # all files, info, hide group, short sizes
alias llag="ls -Al"           # all files, info, show group, short sizes
alias l.="ls -d .*"           # show only files beginning with a dot
alias ll.="ls -dloh .*"       # extended listing of files beginning with a dot
alias d='dirs -v'             # show directory stack

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
alias diff="colordiff -yw --suppress-common-lines"
                              # colorize, side-by-side, ignore whitespace, etc

function desktop {
  if [[ $1 != "hide" && $1 != "show" ]]; then
    echo "Usage: desktop [show|hide]"; return 1;
  fi
  if [[ $1 == "hide" ]]; then
    local view=false;
  elif [[ $1 == "show" ]]; then
    local view=true;
  fi
  defaults write com.apple.finder CreateDesktop -bool $view;
  killall Finder;
}

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
alias bi='bundle install' # -j3 to parallelize, but global config should be set
alias bu='bundle update'
alias brake='bundle exec rake'
alias be='bundle exec'
alias brails'=bundle exec rails'
alias brspec'=bundle exec rspec'

# rails
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias reset='bundle exec rake db:reset'
alias populate='bundle exec rake db:populate'
alias rss='bundle exec rake db:reset db:seed && rails server'
