#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
mkdir -p original

if [ -f index.html ] && [ ! -f original/requiem-original.html ]; then
  cp index.html original/requiem-original.html
  echo "Origineel opgeslagen als original/requiem-original.html"
else
  echo "Origineel bestaat al of index.html ontbreekt; niets overschreven."
fi
