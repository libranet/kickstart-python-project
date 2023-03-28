# See ../makefile

.PHONY: pyroma-which  ## show which pyroma is used
pyroma-which:
	@ which pyroma


.PHONY: pyroma  ## run pyroma
pyroma:
	- pyroma .

