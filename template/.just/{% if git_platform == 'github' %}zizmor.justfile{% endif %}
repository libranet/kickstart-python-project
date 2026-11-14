# zizmor - lints Github Actions workflows for security issues, see ../justfile
# docs: https://docs.zizmor.sh/


# show which zizmor is used
[group: 'zizmor']
zizmor-which:
    @ echo -e "Using uv run zizmor"


# run zizmor on the github workflows (pedantic persona, same as CI)
[group: 'zizmor']
zizmor *args:
    uv run zizmor --persona pedantic .github/workflows {{args}}

alias zizmor-check := zizmor


# run zizmor and apply safe auto-fixes
[group: 'zizmor']
zizmor-fix *args:
    uv run zizmor --persona pedantic --fix=safe .github/workflows {{args}}


# run zizmor with sarif output
[group: 'zizmor']
zizmor-sarif:
    @ mkdir -p var/zizmor
    @ echo -e "Zizmor SARIF report generated in var/zizmor/results.sarif.json"
    uv run zizmor --persona pedantic --format sarif .github/workflows > var/zizmor/results.sarif.json


# display zizmor version
[group: 'zizmor']
zizmor-version:
    uv run zizmor --version
