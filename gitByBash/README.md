############################################################################################
Desc:
	Implementing git's add, commit, log functionality by bash
############################################################################################


Source the file:
$ source gitBash.sh
This will import the shell function definitioons into your current shell



Create and empty directory and initialize it as a repo:
$ mkdir my-repo
$ cd my-repo
$ init .



View the empty repo:
$ tree -a .dvcsh


Create a new file and add it into the repo:
$ 'gitBash learn' > gitBash.txt
$ add gitBash.txt



View the new object and index in the repo:
$ tree -a .dvcsh
$ cat .dvcsh/index



Comit the changes:
$ commit 'Deep Dive Git via Bash with ssagar'


View the commit object and other artifacts:
$ tree -a .dvcsh


@@@@@@@@@@@@@@@@@@@@@ Future Work @@@@@@@@@@@@@@@@@@@@@@@@@@@
Implementing:-
1) git diff
2) git checkout
3) git tag
