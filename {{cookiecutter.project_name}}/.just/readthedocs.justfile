{% raw -%}
# readthedocs, see ../justfile

# readthedocs already provisions a virtualenv for us.
# So we only need to install our packages into that virtualenv.

# installation for readthedocs
[group: 'readthedocs']
install-rtd:
    - uv sync --only docs

{%- endraw %}