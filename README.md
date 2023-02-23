###################################################################################################
Desc:
	Some pre-made scripts to deep dive git, covering topic such as lifeOfCommit.sh, conflict,
	rebase, bisect, submodule. Suggested order to understand:-
	*  lifeOfCommit.sh
	1) conflict.sh
	   conflict2.sh
	2) diff.sh
	   difftool.sh
	3) rebase.sh
	4) bisect.sh
	   test.sh
	5) submodules.sh
###################################################################################################

Que. What does git init do ?
	Before		|	After
------------------------------------------------------
			|  .git/config
			|  .git/description
			|  .git/HEAD
			|  .git/hooks
			|  .git/info/exclude



Que. What happens when i git add ?

	Before		|	After
------------------------------------------------------
  .git/config		|  ...all those, and:
  .git/description	|  .git/index
  .git/HEAD		|  .git/3d/16dec17e094468d6
  .git/hooks		|
  .git/info/exclude	|



Que. What is a commit ?

	Before			|	After
-----------------------------------------------------------------------
  .git/index			|  .git/index --updated
  .git/3d/16dec17e094468d6	|  .git/COMMIT_EDITMSG
  .git/HEAD			|  .git/logs/HEAD
  ...				|  .git/logs/refs/heads/master
				|  .git/refs/heads/master
				|  ...all the others + more objects



..............cd inside shell don't work because................
1) shell script runs in a subshell i
2) and once script is over it returns to the parent shell
3) that's why the curretn directory doesn't change

Sol:- to achive changing of directory via shell script use sourcing of script
for eg:-
. scriptname.sh
source scriptname.sh
