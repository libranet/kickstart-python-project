
# See ../justfile
#
# - justfile_directory() is the directory of the toplevel justfile


# prepend local bin-directory to $PATH
venv_bin_dir := if os_family() == "windows" { justfile_directory() / ".venv/Scripts" } else { justfile_directory() / ".venv/bin" }
export PATH := if os_family() == "windows" { venv_bin_dir + x";${PATH}" } else { venv_bin_dir + x":${PATH}" }


# initialize dir-structure, create dirs
[group: 'dir-structure']
create-dirs:
    # vscode does not create cache-dirs, so we need to create it
    @ echo  "In current working dir: ${PWD}"
    @ echo  "Creating project directory-structure:"
    mkdir -p var
    mkdir -p var/cache
    mkdir -p var/cache/mypy
    mkdir -p var/cache/vscode
    mkdir -p var/coverage
    mkdir -p var/log
    mkdir -p var/run
    mkdir -p var/tmp
    @ echo ""


# symlinks to venv-dirs to make bin/python work
[group: 'dir-structure']
symlink-venv-dirs:
    @ echo -e "Creating .venv-symlinks:"
    ln -sf .venv/bin
    ln -sf .venv/lib
    ln -sf .venv/lib64
    ln -sf .venv/pyvenv.cfg
    @ echo -e ""


# remove venv-symlinks
[group: 'dir-structure']
clean-symlinks:
    rm -f bin
    rm -f lib
    rm -f lib64
    rm -f pyvenv.cfg

alias clear-symlinks := clean-symlinks


# remove .venv-directory
[group: 'dir-structure']
clean-venv:
    rm -fr .venv

alias clear-venv := clean-venv


# remove all __pycache__-folders
[group: 'dir-structure']
clean-pyhon-cache-files:
    find . -type d -name "__pycache__" -exec rm -rf {} +


# clean up all generated files
[group: 'dir-structure']
clean: clean-symlinks clean-venv clean-pyhon-cache-files
    rm -fr var/cache
    rm -fr var/log

alias clear := clean


