# shell/functions.sh

function rmdir {
  SEP=$IFS[0,1]
  DOT="$SEP\.$SEP"
  RMDIR="$(whereis rmdir)"
  if [ "$*" =~ $DOT -o "$*" == '.' ]; then
    CURDIR="$(pwd)"
    cd ..
    $RMDIR $CURDIR
  else
    $RMDIR $*
  fi
}
