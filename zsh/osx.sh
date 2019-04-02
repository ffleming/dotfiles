alias eject_cd="drutil eject" # eject cd
alias hide="setfile -a V"     # hide a file
alias unhide="setfile -a v"   # unhide a file

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
