
# ipython


# symlink ipython to ip
# [group: 'ipython']
# symlink-ipython:
#     @ cd .venv/bin && ln -sf ipython ip


# open python-shell
[group: 'ipython']
python-shell *args:
    @ uv run python {{args}}

alias python := python-shell


# open ipython-shell
[group: 'ipython']
ipython-shell *args:
    @ uv run ipython {{args}}

alias ipython := ipython-shell
alias ip := ipython-shell


# open ipython-shell in debug-mode
[group: 'ipython']
ipython-shell-debug *args:
    @ uv run ipython --debug {{args}}

alias ipython-debug := ipython-shell-debug


# create an ipython profile
[group: 'ipython']
ipython-create-profile name="":
    uv run ipython profile create {{name}}
