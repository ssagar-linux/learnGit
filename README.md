###################################################################################################
Desc: 
	Some pre-made scripts to deep dive git, covering topic such as conflict, rebase, bisect, submodule
	Suggested order to understand:- 
	1) conflict.sh
	   conflict2.sh
	2) diff.sh
	   difftool.sh
	3) rebase.sh
	4) bisect.sh
	   test.sh
	5) submodules.sh
###################################################################################################





..............cd inside shell don't work because................
1) shell script runs in a subshell i
2) and once script is over it returns to the parent shell
3) that's why the curretn directory doesn't change

Sol:- to achive changing of directory via shell script use sourcing of script
for eg:- 
. scriptname.sh
source scriptname.sh
