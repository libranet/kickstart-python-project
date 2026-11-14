# Changelog

All notable changes to this project will be documented in this file.


## 3.1 (2026-11-14)

- Flatten the template from `template/{{project_name}}/` to `template/`: the copier destination is now the
  project root, and tasks run in `.`.

- Generate a proper `.copier-answers.yml` from `_copier_answers`, so `copier update` works.

- Rename `_copyright_year` to `copyright_year` so it is rendered in license files and Sphinx config.

- Fall back to the template author/email for the initial commit when no git identity is configured.

- Validate that `package_name` is not a Python keyword; allow single-letter project names.

- Drop Python 3.9; derive CI test and lint matrices from `minimum_python`.

- Escape strings in `pyproject.toml`, select the license classifier per license, add `flask` and `psycopg`
  dependencies, only add `[project.scripts]` with cyclopts, and use `git_platform` in project URLs.

- Rename `.gitlab-ci.yaml` to `.gitlab-ci.yml` and `supervisord.just` to `supervisord.justfile`.

- Add `docs/changes.md` and self-contained docs pages; switch Sphinx theme to `sphinx_rtd_theme`.

- Fix the ruff pre-commit hooks to run via `uv run`; fix `about.py` metadata lookup by distribution name.

- Add `tests/test_template.py` to render and check the template for several option combinations.

- Add github-cli, supervisord, mdformat and markdown-lint justfiles; support Python 3.14; add `exclude-newer`.

- Remove personal defaults in favour of placeholders; start with an empty keyword list.


## 3.0 (2026-02-02)

- Migrate from Cookiecutter to Copier template engine.

- Add support for template updates via `copier update`.

- Use conditional file names instead of post-generation hooks.

- Add native boolean support for feature toggles (no more `|int` casting).

- Add `.copier-answers.yml` for tracking template configuration.

- Add post-generation tasks: git init, uv sync, pre-commit install.

- Support multiple licenses: MIT, Apache-2.0, GPL-3.0.

- Archive original Cookiecutter files to `_archive/cookiecutter/`.


## 2.0 (2025-11-15)

- Replace `makefile` with `justfile`.

- Replace `poetry` with `uv`.

- Replace `typer` with `cyclopts`.


## 1.0.2 (2023-03-20)

- Add boilerplate-files to comply with Github's [_Community Standards_](https://github.com/libranet/autoadd-bindir/community)

- Refactored make-file.

- Fix some typo's in docstrings.

## 1.0.1 (2023-03-19)

- Test releasing via ``poetry-release``.


## 1.0 (23-03-19)

- Add ``readthedocs.yaml``.

- Package created by [Wouter Vanden Hove <wouter@libranet.eu>]
