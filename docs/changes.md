# Changelog

All notable changes to this project will be documented in this file.


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
