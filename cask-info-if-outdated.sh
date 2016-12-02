#!/bin/sh

function check_stanza () {
  stanza=`brew cask info "$1"`
  version=`echo "$stanza" | head -1 | sed -e "s/.*: //"`
  if ! echo "$stanza" | grep Caskroom | grep "$version" >/dev/null; then
    echo "$stanza"
  fi
}

export -f check_stanza
brew cask list | xargs -n 1 -- sh -c 'check_stanza "$@"' _
