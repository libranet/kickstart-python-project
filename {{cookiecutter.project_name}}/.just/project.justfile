{% raw -%}
# project


# run all install-steps to full initial installation
[group: 'project']
install: create-dirs dotenv-install uv-sync-all-groups && symlink-venv-dirs

{%- endraw %}