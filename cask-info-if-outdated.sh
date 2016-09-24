#!/bin/sh

stanza=`brew cask info "$1"`
version=`echo "$stanza" | head -1 | sed -e "s/.*: //"`
if ! echo "$stanza" | grep Caskroom | grep "$version" >/dev/null; then
    echo "$stanza"
fi
