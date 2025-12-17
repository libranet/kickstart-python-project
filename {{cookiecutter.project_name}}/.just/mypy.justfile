
# mypy


# show which mypy is used
[group: 'mypy']
mypy-which:
    @ which mypy


# run mypy on python-files
[group: 'mypy']
mypy args="": mypy-which
    mypy src tests {{ args }}



# run mypy with html-reporting
[group: 'mypy']
mypy-report path="var/html/mypy/" args="": mypy-which
    @ mkdir -p {{ path }}
    mypy src tests --html-report {{ path }} {{ args }}


# alias for mypy-report
[group: 'mypy']
mypy-html: mypy-report



