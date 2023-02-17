#!/bin/bash

function git_init()
{
	set -x
	mkdir -p lifeOfCommit/.git
	cd lifeOfCommit
	mkdir -p .git/objects
	mkdir -p .git/refs
	echo -e "[core]\n\trepositoryformatversion = 0\n\tfilemode = true\n\t bare = false\n\tlogallrefupdates = true" > .git/config
	git status 
	if [ $? -ne 0 ]
	then
		echo 'ref: refs/heads/main' > .git/HEAD
	fi
	git status
	set +x
}

git_init
