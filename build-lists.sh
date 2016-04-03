#!/bin/bash

pull_and_split() {
  curl "$1" | split -l $2 - $3
  find . -not -name "*.txt" -name "$3*" -execdir mv "{}" "{}.txt" \;
}

mkdir -p lists
pushd lists

pull_and_split "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt" 200 disconnect.me.simple_ad.
pull_and_split "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt" 200 disconnect.me.simple_tracking.

popd
