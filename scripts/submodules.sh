#!/bin/bash

set -x
git init submod
cd submod
~/scripts/generaterandomchanges 3 file txt 
cd ..
git clone --bare submod mainmod.git
set +x
read

echo "*******************************************"
set -x
git init modules
cd modules
~/scripts/generaterandomchanges 4 stuff txt
set +x
read

echo "*******************************************"
git submodule add ../mainmod.git submod
git status
set +x
read
