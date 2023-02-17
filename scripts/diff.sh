#!/bin/bash

set -x
git init diff
cd diff
~/scripts/generaterandomchanges 2 stuff txt
~/scripts/generaterandomfiles 2 stuff txt
git add stuff1.txt
set +x
read

