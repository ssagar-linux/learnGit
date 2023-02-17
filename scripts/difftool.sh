#!/bin/bash

set -x
cd diff
cp -i ../examples/git-attributes .gitattributes
cat .gitattributes
set +x
read


echo "*****************************************************"
set -x
cat ../examples/git-config > .git/config
cat .git/config
set +x
read


echo "*****************************************************"
set -x
cp -i ../examples/document.odt .
git add document.odt
git commit -m 'a word doc'
set +x
read
