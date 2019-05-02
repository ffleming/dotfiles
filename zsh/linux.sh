alias cbcopy="xclip -selection clipboard"
alias cbc=cbcopy

alias cbpaste="xclip -selection clipboard -o"
alias cbp=cbpaste

open() {
  setsid nohup xdg-open $1 > /dev/null 2> /dev/null
}
