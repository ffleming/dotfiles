alias eject_cd="drutil eject" # eject cd
alias hide="setfile -a V"     # hide a file
alias unhide="setfile -a v"   # unhide a file

# Use homebrew coreutils if present
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

command -v /Applications/VMware\ Fusion.app/Contents/Library/vmrun 2>&1 > /dev/null && \
  alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

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
