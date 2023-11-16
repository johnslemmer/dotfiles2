#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";
dotfiles=`ls -pa | grep -v / | grep "^\..*"`

for file in .*;
do
    if [ ! -d "$file" ]; then
        echo DIFFING $file
        diff ~/$file $file
    fi
done
