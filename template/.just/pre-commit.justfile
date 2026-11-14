
# See ../justfile


# install the pre-commit-hook in .git/hooks
[group: 'pre-commit']
pre-commit-install-hook:
    pre-commit install

alias precommit-install-hook := pre-commit-install-hook


# uninstall the pre-commit-hook in .git/hooks
[group: 'pre-commit']
pre-commit-uninstall-hook:
    pre-commit uninstall

alias precommit-uninstall-hook := pre-commit-uninstall-hook


# validate .pre-commit-config.yaml
[group: 'pre-commit']
pre-commit-validate-config:
    pre-commit validate-config

alias precommit-validate-config := pre-commit-validate-config


# run all precommit-steps on all files
[group: 'pre-commit']
pre-commit-run-files:
    pre-commit run --all-files

alias precommit-run-files := pre-commit-run-files


