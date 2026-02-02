
# pylint


## run pylint on python-files
[group: 'pylint']
pylint *args:
    uv run pylint src/ tests/  {{args}}


## run pylint on python-files in src/
[group: 'pylint']
pylint-src *args:
    uv run pylint src/  {{args}}


## run pylint on python-files in tests/
[group: 'pylint']
pylint-tests *args:
    uv run pylint tests/  {{args}}

