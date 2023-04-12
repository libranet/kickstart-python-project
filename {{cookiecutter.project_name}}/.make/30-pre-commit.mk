# See ../makefile

.PHONY: pre-commit-which  ## show which pre-commit is used
pre-commit-which:
	@ which pre-commit


.PHONY: precommit-install-hook  ## install the pre-commit-hook in .git/hooks
precommit-install-hook: pre-commit-which
	pre-commit install


.PHONY: precommit-uninstall-hook  ## uninstall the pre-commit-hook in .git/hooks
precommit-uninstall-hook: pre-commit-which
	pre-commit uninstall


.PHONY: precommit-run-files  ## run all precommit-steps on all files
precommit-run-files: pre-commit-which
	pre-commit run --all-files


.PHONY: precommit-validate-config  ## validate .pre-commit-config.yaml
precommit-validate-config: pre-commit-which
	pre-commit validate-config
