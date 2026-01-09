
# See ../justfile


# show which pyroma is used
# [group: 'pyroma']
# pyroma-which:
#     @ which pyroma


# run pyroma
[group: 'pyroma']
pyroma: pyroma-which
    uv run pyroma .
