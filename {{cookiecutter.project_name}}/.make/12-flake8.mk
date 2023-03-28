# See ../makefile

.PHONY: flake8-which  ## show which flake8 is used
flake8-which:
	@ which flake8


.PHONY: flake8  ## run flake8 on python-files
flake8: flake8-which
	- flake8 docs/ src/ tests

