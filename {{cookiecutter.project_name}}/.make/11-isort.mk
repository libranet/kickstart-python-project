# See ../makefile

.PHONY: isort-which  ## show which isort is used
isort-which:
	@ which isort


.PHONY: isort  ## run isort on python-files
isort: isort-which
	- isort --settings-path=pyproject.toml src/**/*.py tests/**/*.py