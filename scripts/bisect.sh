#!/bin/bash

set -x
git init faulty
cd faulty
~/scripts/generaterandomchanges 20 stuff txt
read

rm -rf stuff1.txt
git add stuff1.txt
git commit -m 'deleted a file. Tee hee'
read


~/scripts/generaterandomchanges 7 stuffy txt
git log --graph --all --oneline
set +x
