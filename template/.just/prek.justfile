
# See ../justfile

# display version of prek
[group: 'prek']
prek-version:
	uv run prek --version


# display help for prek
[group: 'prek']
prek-help:
	uv run prek --help


# install the pre-commit-hook in .git/hooks
[group: 'prek']
prek-install-hook:
    uv run prek install


# uninstall the pre-commit-hook in .git/hooks
[group: 'prek']
prek-uninstall-hook:
    uv run prek uninstall


# validate .pre-commit-config.yaml
[group: 'prek']
prek-validate-config:
    uv run prek validate-config


# validate .pre-commit-hooks.yaml
[group: 'prek']
prek-validate-manifest:
    uv run prek validate-manifest


# run all precommit-steps on all files
[group: 'prek']
prek-run-files:
    uv run prek run --all-files
