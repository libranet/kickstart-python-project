
# pylint


# show which pylint is used
[group: 'pylint']
pylint-which:
    @ which pylint


## run pylint on python-files
[group: 'pylint']
pylint args="": pylint-which
    - pylint src/ tests/  {{args}}


## run pylint on python-files in src/
[group: 'pylint']
pylint-src args="": pylint-which
    - pylint src/  {{args}}


## run pylint on python-files in tests/
[group: 'pylint']
pylint-tests args="": pylint-which
    - pylint tests/  {{args}}

