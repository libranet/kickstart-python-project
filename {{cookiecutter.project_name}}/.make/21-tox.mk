# See ../makefile

.PHONY: tox-which  ## show which tox is used
tox-which:
	@ which tox


.PHONY: tox ## run tox
tox: tox-which
	- tox

