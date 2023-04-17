# Taken from https://gist.github.com/viliampucik/8713b09ff7e4d984b29bfcd7804dc1f4
#
# Store interactive Python shell history in ~/.cache/python_history
# instead of ~/.python_history.
#
# Create the following ~/.config/pythonstartup.py file
# and export its path using PYTHONSTARTUP environment variable:
#
# export PYTHONSTARTUP="${HOME}/.config/pythonstartup.py"
#
# this file is executed *after* sitecustomize.

import atexit
import pathlib as pl
import readline
import sys

# check if we use the python from a virtualenv.
prefix = pl.Path(sys.prefix)
base_dir = prefix.parent if prefix.name == ".venv" else prefix
local_cache_dir = base_dir / "var" / "cache"

local_cache_dir_python = local_cache_dir / "python"
local_cache_dir_python.mkdir(parents=True, exist_ok=True)
histfile = str(local_cache_dir_python / "python_history")

try:
    readline.read_history_file(histfile)
    # default history len is -1 (infinite), which may grow unruly
    readline.set_history_length(1000000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile)

# cleanup namespace
del atexit
del readline
del pl
del sys
del base_dir
del histfile
del local_cache_dir
del local_cache_dir_python
del prefix

print("PYTHONSTARTUP")
