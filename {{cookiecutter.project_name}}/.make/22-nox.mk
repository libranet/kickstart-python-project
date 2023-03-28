# See ../makefile

.PHONY: nox-which  ## show which nox is used
nox-which:
	@ which nox


.PHONY: nox ## run nox
nox: nox-which
	- nox
