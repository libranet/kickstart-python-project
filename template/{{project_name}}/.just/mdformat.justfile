# mdformat


# show which mdformat is used
[group: 'mdformat']
mdformat-which:
    @ echo -e "Using uv run mdformat"


# check markdown files without modifying
[group: 'mdformat']
mdformat-check *args:
    - uv run mdformat --check docs/ {{args}}


# format markdown files
[group: 'mdformat']
mdformat-format *args:
    - uv run mdformat docs/ {{args}}

alias mdformat := mdformat-format


# format a single markdown file
[group: 'mdformat']
mdformat-file file *args:
    - uv run mdformat {{file}} {{args}}
