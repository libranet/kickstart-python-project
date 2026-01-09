
# ty


# show verion of ty
[group: 'ty']
ty-version:
    @ uv run ty --version

# run ty --check on python-files
[group: 'ty']
ty-check *args:
    - uv run ty check src/ tests/ {{args}}



