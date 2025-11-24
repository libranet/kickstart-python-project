{% raw -%}
# ty


# show verion of ty
[group: 'ty']
ty-version:
    @ .venv/bin/ty --version

# run ty --check on python-files
[group: 'ty']
ty-check args="":
    - .venv/bin/ty check src/ tests/ {{args}}


{%- endraw %}
