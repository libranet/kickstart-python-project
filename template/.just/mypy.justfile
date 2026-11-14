
# mypy


# run mypy on python-files
[group: 'mypy']
mypy *args:
    uv run mypy src tests {{ args }}


# run mypy with html-reporting
[group: 'mypy']
mypy-report path="var/html/mypy/" *args:
    @ mkdir -p {{ path }}
    uv run mypy src tests --html-report {{ path }} {{ args }}


# alias for mypy-report
[group: 'mypy']
mypy-html: mypy-report

