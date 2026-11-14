# Changelog

All notable changes to this project will be documented in this file.


## 3.0 (unreleased)

- Rename `docs/changes.md` to `docs/changelog.md`, in this repository and in generated projects.

- Migrate from Cookiecutter to Copier template engine.

- Add support for template updates via `copier update`.

- Use conditional file names instead of post-generation hooks.

- Add native boolean support for feature toggles (no more `|int` casting).

- Generate `.copier-answers.yml` from `_copier_answers` for tracking template configuration.

- Add post-generation tasks: git init, uv sync, pre-commit install.

- Support multiple licenses: MIT, Apache-2.0, GPL-3.0.

- Archive original Cookiecutter files to `_archive/cookiecutter/`.

- Flatten the template from `template/{{project_name}}/` to `template/`: the copier destination is now the
  project root, and tasks run in `.`.

- Rename `_copyright_year` to `copyright_year` so it is rendered in license files and Sphinx config.

- Fall back to the template author/email for the initial commit when no git identity is configured.

- Validate that `package_name` is not a Python keyword; allow single-letter project names.

- Drop Python 3.9; derive CI test and lint matrices from `minimum_python`.

- Escape strings in `pyproject.toml`, add `flask` and `psycopg` dependencies, only add `[project.scripts]` with
  cyclopts, and use `git_platform` in project URLs.

- Use a PEP 639 SPDX `license` expression with `license-files` in `pyproject.toml` instead of license
  classifiers; GPL-3.0 maps to `GPL-3.0-or-later`. Generated license tests check the SPDX expression.

- Require `uv_build>=0.13.0,<1.0`: a loose upper bound, so `uv build` neither warns about the current uv version
  being out of range nor about a missing upper bound, and new uv minor releases need no template update.

- Require `pytest>=9.0` and move pytest settings from `[tool.pytest.ini_options]` to the native `[tool.pytest]` table.

- Optionally import user-level just recipes from the global just config directory in the generated `justfile`,
  after the project recipes and with `allow-duplicate-recipes`, so project recipes win on a name clash.

- Add a `zizmor` GitHub workflow, `.just/zizmor.justfile` and `zizmor` security dependency to GitHub projects, to
  lint GitHub Actions workflows for security issues (pedantic persona).

- Update GitHub Actions in the linting and testing workflows: `actions/checkout` v7.0.1, `astral-sh/setup-uv`
  v10.0.1, `codecov/codecov-action` v7.0.0; add `extractions/setup-just` v4.0.0. Pin just 1.58.0 and uv 0.13.7,
  install via `just install`, run tests via `just pytest-cov`, and pass matrix values through `env`.

- Replace Dependabot and the `dependabot-auto-merge` workflow with Renovate (`.github/renovate.json5`), which
  auto-merges passing minor/patch updates itself. By default it only updates GitHub Actions; the new
  `with_renovate_python` option also enables Python dependency and `uv.lock` updates.

- GitLab CI: pin uv 0.13.7 and just 1.58.0 (installed as `rust-just` via `uv tool`), install via `just install`,
  run tests via `just pytest-cov`, and publish the JUnit report.

- Rename `.gitlab-ci.yaml` to `.gitlab-ci.yml` and `supervisord.just` to `supervisord.justfile`.

- Add `docs/changelog.md` and self-contained docs pages; switch Sphinx theme to `sphinx_rtd_theme`.

- Fix the ruff pre-commit hooks to run via `uv run`; fix `about.py` metadata lookup by distribution name.

- Add `tests/test_template.py` to render and check the template for several option combinations. It is a uv
  test has no dependency on `just`; run it with
  `uv run --with copier --with jinja2-time python -m unittest tests/test_template.py`.

- Add github-cli, supervisord, mdformat and markdown-lint justfiles; support Python 3.14;
  add `exclude-newer = "7 days"`.

- Remove personal defaults in favour of placeholders; start with an empty keyword list.


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
