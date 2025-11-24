# bandit, see ../justfile
{% raw -%}

# show which bandit is used
[group: 'bandit']
bandit-which:
    @ which bandit


# run bandit
[group: 'bandit']
bandit:
    # bandit --configfile pyproject.toml --recursive src --baseline etc/bandit-baseline.json
    .venv/bin/bandit --configfile pyproject.toml --recursive .


# run bandit with htm-report
[group: 'bandit']
bandit-html:
    @ mkdir -p var/html/bandit
    @ echo -e "Bandit-report generated in var/html/bandit/bandit.html"
    .venv/bin/bandit --config pyproject.toml --recursive . --format html > var/html/bandit/bandit.html


# update bandit baseline
[group: 'bandit']
bandit-update-baseline:
    .venv/bin/bandit --configfile pyproject.toml --recursive .  --format json --output etc/bandit-baseline.json

{%- endraw %}