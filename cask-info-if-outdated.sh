#!/bin/sh

function check_stanza () {
  stanza=`brew cask info "$1"`
  version=`echo "$stanza" | head -1 | sed -e "s/.*: //"`
  if ! echo "$stanza" | sed -e '1,2d' -e '/^From: /,$d' | grep "/$1/$version[/ ]" >/dev/null; then
    echo
    echo "$stanza"
  else
    printf %c .
  fi
}

export -f check_stanza
brew cask list | xargs -n 1 -- sh -c 'check_stanza "$@"' _
echo
