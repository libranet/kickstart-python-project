# Overview

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/libranet/kickstart-python-project/blob/main/license.md)

**kickstart-python-project** is a [Copier](https://copier.readthedocs.io/)
template to generate
the file and directory structure for a Python project, according to Libranet
coding conventions.

## Features

- Modern Python tooling: **uv** for package management, **just** for task
running
- CLI support with **cyclopts** (optional)
- Pre-configured linting: **ruff**, **mypy**, **pylint**
- Testing with **pytest** and coverage reporting
- GitHub Actions / GitLab CI workflows
- Pre-commit hooks
- Multiple license options: MIT, Apache-2.0, GPL-3.0
- Optional framework support: Django, Flask, FastAPI
- ReadTheDocs integration (optional)
- **Template updates**: update existing projects when the template evolves

## Requirements

- Python 3.9+
- [Copier](https://copier.readthedocs.io/) 9.0+
- [uv](https://docs.astral.sh/uv/)
- [just](https://just.systems/)

## Installation

Install Copier with the template's Jinja extension:

```bash
uv tool install copier --with jinja2-time
```

## Usage

The destination directory is the project root. Generation installs all
dependency groups and initializes a Git repository.

Use `--skip-tasks` to render files without installing dependencies or
initializing Git. Only use `--trust` with a template
you have reviewed; this template uses a Jinja extension and post-generation
commands.

### Create a new project

```bash
copier copy --trust gh:libranet/kickstart-python-project my-new-project
```

Or from a local clone:

```bash
copier copy --trust /path/to/kickstart-python-project my-new-project
```

### Update an existing project

When the template evolves, update your project:

```bash
cd my-existing-project
copier update --trust
```

## Template Options

| Option | Description | Default |
| -------- | ------------- | --------- |
| `project_name` | Project name (dashed) | required |
| `package_name` | Python package name | derived from project_name |
| `description` | Project description | required |
| `author` | Author name | required |
| `email` | Author email | required |
| `git_platform` | GitHub or GitLab | `github` |
| `license` | MIT, Apache-2.0, GPL-3.0 | `MIT` |
| `minimum_python` | Minimum Python version | `3.14` |
| `with_cyclopts` | Include CLI support | `true` |
| `with_django` | Include Django | `false` |
| `with_fastapi` | Include FastAPI | `false` |
| `support_rtd` | ReadTheDocs config | `false` |

## Documentation

- [Changelog](changes.md)
- [Migration Guide](migration-to-copier.md)
- [Contributing](contributing.md)
- [License](../license.md)
