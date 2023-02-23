#!/bin/bash

function git_init()
{
	echo '*********************** Git Init ****************************'
	set -x
	mkdir -p lifeOfCommit/.git/refs
	cd lifeOfCommit
	mkdir -p .git/objects/{info,pack}
	echo -e "[core]\n\trepositoryformatversion = 0\n\tfilemode = true\n\t bare = false\n\tlogallrefupdates = true" > .git/config
	git status
	if [ $? -ne 0 ]
	then
		echo 'ref: refs/heads/main' > .git/HEAD
	fi
	git status
	set +x
}

# accepts blob id and fileSize then create zlib compressed file in .git/objects/01/23fdlakfja...
function blobObjCreate()
{
	echo '*********************** Blob Object Create ****************************'
	tree -a .git/
	tFileSize=$2
	tBlobId=$1; dirName=${tBlobId:0:2}
	blobFileName=$(echo $tBlobId | cut -c 3-)
	mkdir -p .git/objects/$dirName
	cd .git/objects/$dirName
	{ printf 'blob %u\0' $tFileSize; cat ../../../main.c; } | pigz -zc > $blobFileName
	chmod -w $fileName
	cd ../../../
	tree -a .git/
	git ls-files --debug
	read
	unset tBlobId tFileSize dirName blobFileName
}

function update-index()
{
	echo '*********************** Upate Index ****************************'
	tBlobId=$1; tFileName=$2
	git status; git ls-files --debug
	git update-index --add --cacheinfo 100644 $tBlobId $tFileName
	git ls-files --debug
	tree -a .git/
	read

	git status
	git ls-files --debug
	read
	unset tBlobId tFileName
}


function show_index()
{
	echo '*********************** Show Index ****************************'
	od -tx1z .git/index
	git ls-files --debug
	read
}

function create_commit()
{
	echo '*********************** Create Commit ****************************'
	treeId=$(git write-tree)
	git ls-tree $treeId
	tree -a .git/
	git cat-file tree $treeId | od -tx1z
	read

	commitId=$(git commit-tree $treeId -m 'Deep Dive Git with ssagar')
	git show
	if [ $? -ne 0 ]
	then
		tree -a .git
		git update-ref refs/heads/main $commitId
		read
		tree -a .git
	fi
	git show
	read

	git cat-file --batch-check --batch-all-objects
	git cat-file commit $commitId
	pigz -dcz < .git/objects/${commitId:0:2}/${commitId:2:${#commitId}}

}

git_init
echo '*********************** Creating/Deleting/Modifying content ****************************'
set -x
fileName=main.c
echo -e "#include <stdio.h>\n\nint main(){\n\tprintf(\"Hello World\\\n\");\n}" > $fileName
ls -l
read

fileSize=$(wc -c main.c | awk '{ print $1 }')
blobId=$({ printf 'blob %u\0' $fileSize; cat $fileName; } | sha1sum | awk '{ print $1 }')
read

blobObjCreate $blobId $fileSize
git fsck
read

update-index $blobId $fileName
show_index
create_commit
read
set +x
