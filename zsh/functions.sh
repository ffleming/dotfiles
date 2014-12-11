# shell/functions.sh

#------------------------------------------------------------------------------
# ENHANCED MKDIR FUNCTION
#------------------------------------------------------------------------------
function nd {
  mkdir "$*" && \cd "$*"
}

#------------------------------------------------------------------------------
# HOMEBREW
#------------------------------------------------------------------------------
function brew_remove {
  brew rm "$1"  # remove package and dependencies
  brew rm $(join <(brew leaves) <(brew deps "$1"))
}

function update_homebrew {
  echo brew update  && brew update
  echo brew upgrade && brew upgrade
  echo brew cleanup && brew cleanup
  echo brew doctor  && brew doctor
}


