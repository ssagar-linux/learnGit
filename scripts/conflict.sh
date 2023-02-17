#!/bin/bash
# 'set -x' prints every command executed in script on stdout 
# 'set +x' turns off printing 
# 'set -o history -o histexpand' enable history expansion in script
# for help use 'help -m set'

set -x
git init branched
cd branched
cp -i ../conflict2.sh .
git add conflict2.sh
git commit -m 'Handy script will be needed later'
set +x
read -N 2


echo "*****************************************"
set -x
cat ../examples/the-house-that-jack-built.txt > house.txt
git add house.txt
git commit -m 'Add a brilliant feature to the project'
set +x
read -N 2


echo "*****************************************"
set -x
git branch awkward
cat ../examples/jacks-house.txt > house.txt
set +x
read -N 2
