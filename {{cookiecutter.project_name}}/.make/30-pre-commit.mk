# See ../makefile

.PHONY: pre-commit-which  ## show which pre-commit is used
pre-commit-which:
	@ which pre-commit


.PHONY: precommit-install-hook  ## install the pre-commit-hook in .git/hooks
precommit-install-hook:
	pre-commit install


.PHONY: precommit-run-files  ## run all precommit-steps on all files
precommit-run-files:
	pre-commit run --all-files

