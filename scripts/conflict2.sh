#!/bin/bash

set -x
git checkout awkward
cat ../examples/jacks-other-house.txt > house.txt
git add house.txt
git commit -m 'Completed the feature the correct way'
set +x
read
