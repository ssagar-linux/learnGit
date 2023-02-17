#!/bin/bash

set -x
git init --bare baserepo.git 
rm -rf baserepo.git/hooks
git clone baserepo.git myrepo
rm -rf myrepo/.git/hooks
set +x
read

echo "**************************************************"
set -x
cd myrepo
touch nothing
git add nothing
git commit -m 'starting point'
git push
set +x
read


echo "**************************************************"
set -x
git checkout -b branch1
~/scripts/generaterandomchanges 3 feature php
read

echo "**************************************************"
git checkout main 
~/scripts/generaterandomchanges 6 app php
set +x
read
