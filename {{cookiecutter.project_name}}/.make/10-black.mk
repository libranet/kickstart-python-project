# See ../makefile

.PHONY: black-which  ## show which black is used
black-which:
	@ which black


.PHONY: black  ## run black on python-files
black: black-which
	- black docs/ src/ tests/

