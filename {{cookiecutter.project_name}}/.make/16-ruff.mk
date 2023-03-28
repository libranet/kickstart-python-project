# See ../makefile

.PHONY: ruff-which  ## show which ruff is used
ruff-which:
	@ which ruff


.PHONY: ruff  ## run ruff on python-files
ruff:
	- ruff docs/ src/ tests/


.PHONY: ruff-check  ## run ruff --check on python-files
ruff-check:
	- ruff check docs/ src/ tests/


.PHONY: ruff-fix  ## run ruff --fix on python-files
ruff-fix:
	- ruff --fix docs/ src/ tests/