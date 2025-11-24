{% raw -%}
# uv


# use existing env-variable 'UV_PYTHON_INSTALL_DIR' or default to '/opt/python'
export UV_PYTHON_INSTALL_DIR := env('UV_PYTHON_INSTALL_DIR', '/opt/python')

# install uv/uvx directly in /opt/bin
export UV_INSTALL_DIR := env('UV_INSTALL_DIR', '/usr/local/bin')
export TMPDIR := env('TMPDIR', '/tmp')


# install uv + uvx
[group: 'uv']
uv-install:
    @ echo "Using temp-folder {{TMPDIR}}"
    mkdir -p {{TMPDIR}}
    curl --create-dirs --fail --location --no-progress-bar --silent --show-error --proto '=https' --tlsv1.2 https://astral.sh/uv/install.sh | env INSTALLER_NO_MODIFY_PATH=1 bash -s -- --verbose

alias install-uv := uv-install


# upgrade uv itself
[group: 'uv']
uv-upgrade target_version="":
    uv self update {{target_version}}

alias upgrade-uv := uv-upgrade


# show location of uv
[group: 'uv']
uv-which:
    @ which uv

alias which-uv := uv-which


# display uv version
[group: 'uv']
uv-version:
    uv --version

alias version-uv := uv-version


# clear the cache used by uv
[group: 'uv']
uv-cache-clean:
    uv cache clean


# display cache-dir used by uv
[group: 'uv']
uv-cache-dir:
    uv cache dir


# install the project and all dependencies from only the default groups
[group: 'uv']
uv-sync args="":
    uv sync {{args}}

# alias uv-install := uv-sync
alias create-venv := uv-sync


# install the project including all dependencies from all groups
[group: 'uv']
uv-sync-all-groups args="":
    uv sync --all-groups {{args}}

alias uv-sync-all := uv-sync-all-groups


# update uv.lock
[group: 'uv']
uv-lock args="":
    uv lock {{args}}


# check uv.lock is up-to-date
[group: 'uv']
uv-lock-check args="":
    uv lock --check {{args}}


# build the python-package
[group: 'uv']
uv-build args="":
    uv build {{args}}


# publish the python-package
[group: 'uv']
uv-publish path="dist/" args="":
    uv publish {{path}} --verbose {{args}}


# export uv-defined requirements to a pip-installable requirements-file
[group: 'uv']
[unix]
uv-export-requirements:
    uv export --format requirements-txt --no-hashes --output-file etc/requirements.txt
    @ echo -e "Updated etc/requirements.txt"

alias uv-export := uv-export-requirements


# set python-version in .python-version file
[group: 'uv']
[unix]
uv-set-python-version version="3.10":
    mv .python-version .python-version.backup
    @ echo "{{version}}" > .python-version
    @ echo -e "Set python version to {{version}}"


{%- endraw %}