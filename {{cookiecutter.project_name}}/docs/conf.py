"""Sphinx configuration."""
project = "{{cookiecutter.project_name}}"
author = "{{cookiecutter.author}}"
copyright = "{{cookiecutter.copyright_year}}, {{cookiecutter.author}}"
extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
{%- if cookiecutter.with_typer|int %}
    "sphinx_click",
{%- endif %}
    "myst_parser",
]
autodoc_typehints = "description"
html_theme = "furo"
