
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/libranet/kickstart-python-project/blob/main/docs/license.md)


# Overview

**kickstart-python-project** is a [Copier](https://copier.readthedocs.io/) template to generate
the file- and directory-structure for a Python project, according to Libranet coding conventions.

## Features

- Modern Python tooling: **uv** for package management, **just** for task running
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
- [uv](https://docs.astral.sh/uv/) (recommended)


## Installation

Install Copier via uv or pip:

```bash
uv tool install copier
```

```bash
pip install copier
```


## Usage

### Create a new project

```bash
copier copy gh:libranet/kickstart-python-project my-new-project
```

Or from a local clone:

```bash
copier copy /path/to/kickstart-python-project my-new-project
```

### Update an existing project

When the template evolves, update your project:

```bash
cd my-existing-project
copier update
```


## Template Options

| Option | Description | Default |
|--------|-------------|---------|
| `project_name` | Project name (dashed) | `kickstart-python-project` |
| `package_name` | Python package name | derived from project_name |
| `description` | Project description | `A Python project.` |
| `author` | Author name | `Wouter Vanden Hove` |
| `email` | Author email | `wouter@libranet.eu` |
| `git_platform` | GitHub or GitLab | `github` |
| `license` | MIT, Apache-2.0, GPL-3.0 | `MIT` |
| `minimum_python` | Minimum Python version | `3.13` |
| `with_cyclopts` | Include CLI support | `true` |
| `with_django` | Include Django | `false` |
| `with_fastapi` | Include FastAPI | `false` |
| `support_rtd` | ReadTheDocs config | `false` |


## Documentation

- [Changelog](changes.md)
- [Migration Guide](migration-to-copier.md)
- [Contributing](contributing.md)
- [License](license.md)
