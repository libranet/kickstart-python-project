# Migration Plan: Cookiecutter to Copier

This document outlines the migration strategy for converting the `kickstart-python-project` template from Cookiecutter to Copier.

## Why Migrate to Copier?

| Feature | Cookiecutter | Copier |
|---------|-------------|--------|
| Template updates | Not supported | Built-in (`copier update`) |
| Configuration format | JSON | YAML (more readable) |
| Migrations | Not supported | Version-based migrations |
| Tasks | Hooks (Python scripts) | YAML-defined tasks |
| Multi-document config | Not supported | Supported with `!include` |
| Answer file | `.cookiecutter.json` | `.copier-answers.yml` |

---

## Migration Steps Overview

1. [ ] Create `copier.yaml` configuration
2. [ ] Rename template directory
3. [ ] Convert Jinja2 syntax
4. [ ] Convert hooks to tasks
5. [ ] Set up conditional file handling
6. [ ] Add Copier-specific features
7. [ ] Test and validate
8. [ ] Update documentation

---

## Step 1: Create `copier.yaml` Configuration

### Current `cookiecutter.json`:
```json
{
  "project_name": "kickstart-python-project",
  "package_name": "{{ cookiecutter.project_name.replace('-', '_') }}",
  "description": "Write project summary.",
  "author": "Wouter Vanden Hove",
  "email": "wouter@libranet.eu",
  "git_platform": ["github", "gitlab"],
  "github_user": "libranet",
  "version": "0.1",
  "_copyright_year": "{% now 'utc', '%Y' %}",
  "license": ["MIT"],
  "development_status": ["Development Status :: 4 - Beta"],
  "minimum_python": "3.13",
  "with_django": "0",
  "with_flask": "0",
  "with_fastapi": "0",
  "with_cyclopts": "1",
  "with_postgres": "0",
  "support_rtd": "0",
  "__package_name_snake_case": "{{ cookiecutter.package_name|slugify(separator='_') }}",
  "_copy_without_render": ["justfile", ".just/*.justfile"]
}
```

### Target `copier.yaml`:
```yaml
# Copier configuration for kickstart-python-project
# https://copier.readthedocs.io/en/stable/configuring/

_min_copier_version: "9.0.0"
_subdirectory: template
_templates_suffix: .jinja
_answers_file: .copier-answers.yml

# Exclude patterns (files not to copy)
_exclude:
  - copier.yaml
  - "*.pyc"
  - __pycache__
  - .git

# Skip these files if they already exist (for updates)
_skip_if_exists:
  - .env
  - "var/"

# Jinja2 extensions
_jinja_extensions:
  - jinja2_time.TimeExtension
  - copier_templates_extensions.TemplateExtensionLoader

# ============================================================================
# Questions
# ============================================================================

project_name:
  type: str
  help: "Project name (use dashes, e.g., my-awesome-project)"
  default: kickstart-python-project
  validator: "{% if not project_name | regex_search('^[a-z][a-z0-9-]*$') %}Must be lowercase with dashes{% endif %}"

package_name:
  type: str
  help: "Python package name (derived from project name)"
  default: "{{ project_name | replace('-', '_') }}"
  validator: "{% if not package_name | regex_search('^[a-z][a-z0-9_]*$') %}Must be valid Python identifier{% endif %}"

description:
  type: str
  help: "Short project description"
  default: "Write project summary."

author:
  type: str
  help: "Author full name"
  default: "Wouter Vanden Hove"

email:
  type: str
  help: "Author email address"
  default: "wouter@libranet.eu"

git_platform:
  type: str
  help: "Git hosting platform"
  choices:
    - github
    - gitlab
  default: github

github_user:
  type: str
  help: "GitHub/GitLab username or organization"
  default: libranet

version:
  type: str
  help: "Initial project version"
  default: "0.1"

license:
  type: str
  help: "Project license"
  choices:
    - MIT
    - Apache-2.0
    - GPL-3.0
  default: MIT

development_status:
  type: str
  help: "PyPI development status classifier"
  choices:
    "1 - Planning": "Development Status :: 1 - Planning"
    "2 - Pre-Alpha": "Development Status :: 2 - Pre-Alpha"
    "3 - Alpha": "Development Status :: 3 - Alpha"
    "4 - Beta": "Development Status :: 4 - Beta"
    "5 - Production/Stable": "Development Status :: 5 - Production/Stable"
  default: "Development Status :: 4 - Beta"

minimum_python:
  type: str
  help: "Minimum Python version (e.g., 3.13)"
  default: "3.13"
  choices:
    - "3.9"
    - "3.10"
    - "3.11"
    - "3.12"
    - "3.13"
    - "3.14"

# Feature toggles (boolean questions)
with_cyclopts:
  type: bool
  help: "Include CLI support with cyclopts?"
  default: true

with_django:
  type: bool
  help: "Include Django framework?"
  default: false

with_flask:
  type: bool
  help: "Include Flask framework?"
  default: false

with_fastapi:
  type: bool
  help: "Include FastAPI framework?"
  default: false

with_postgres:
  type: bool
  help: "Include PostgreSQL support?"
  default: false
  when: "{{ with_django or with_fastapi }}"

support_rtd:
  type: bool
  help: "Include ReadTheDocs configuration?"
  default: false

# Computed/private variables (prefixed with _)
_copyright_year:
  type: str
  default: "{{ '%Y' | strftime }}"
  when: false  # Don't prompt, just compute

# ============================================================================
# Tasks (post-generation)
# ============================================================================

_tasks:
  # Initialize git repository
  - command: git init
    when: "{{ _copier_operation == 'copy' }}"

  # Install dependencies with uv
  - command: uv sync
    when: "{{ _copier_operation == 'copy' }}"

  # Run pre-commit install
  - command: uv run pre-commit install
    when: "{{ _copier_operation == 'copy' }}"

# ============================================================================
# Migrations (for template updates)
# ============================================================================

_migrations:
  - version: v1.0.0
    before:
      - command: echo "Migrating to v1.0.0"
```

---

## Step 2: Rename Template Directory

### Current structure:
```
kickstart-python-project/
├── cookiecutter.json
├── hooks/
│   └── post_gen_project.py
└── {{cookiecutter.project_name}}/
    └── ... (all template files)
```

### Target structure:
```
kickstart-python-project/
├── copier.yaml
└── template/
    └── {{project_name}}/
        └── ... (all template files with .jinja suffix)
```

**Actions:**
1. Create `template/` subdirectory
2. Move `{{cookiecutter.project_name}}/` to `template/{{project_name}}/`
3. Add `.jinja` suffix to files that need rendering

---

## Step 3: Convert Jinja2 Syntax

### Variable References

| Cookiecutter | Copier |
|-------------|--------|
| `{{ cookiecutter.project_name }}` | `{{ project_name }}` |
| `{{ cookiecutter.package_name }}` | `{{ package_name }}` |
| `{{ cookiecutter.with_django\|int }}` | `{{ with_django }}` (native bool) |

### Conditionals

**Cookiecutter:**
```jinja2
{%- if cookiecutter.with_cyclopts|int %}
"cyclopts>=3.24",
{%- endif %}
```

**Copier:**
```jinja2
{%- if with_cyclopts %}
"cyclopts>=3.24",
{%- endif %}
```

### Loops (Python version classifiers)

**Cookiecutter:**
```jinja2
{%- for v in range(cookiecutter.minimum_python.split('.')[1]|int, 15)|reverse %}
"Programming Language :: Python :: 3.{{ v }}",
{%- endfor %}
```

**Copier:**
```jinja2
{%- for v in range(minimum_python.split('.')[1]|int, 15)|reverse %}
"Programming Language :: Python :: 3.{{ v }}",
{%- endfor %}
```

### Raw Blocks (GitHub Actions)

Both use the same syntax - no change needed:
```jinja2
{% raw %}${{ github.workflow }}{% endraw %}
```

---

## Step 4: Convert Hooks to Tasks

### Current `hooks/post_gen_project.py`:
```python
from pathlib import Path
from shutil import rmtree

package_name = "{{ cookiecutter.__package_name_snake_case }}"
with_fastapi = int("{{ cookiecutter.with_fastapi }}")
with_cyclopts = int("{{ cookiecutter.with_cyclopts }}")
support_rtd = int("{{ cookiecutter.support_rtd }}")
git_platform = "{{ cookiecutter.git_platform }}"

def unlink(rel_path):
    Path(rel_path.format(package_name=package_name)).unlink(missing_ok=True)

if not with_fastapi:
    unlink("src/{package_name}/api.py")
    unlink("tests/test_api.py")

if not with_cyclopts:
    unlink("src/{package_name}/cli.py")
    unlink("tests/test_cli.py")

if not support_rtd:
    unlink(".readthedocs.yaml")

if git_platform != "github":
    rmtree(".github/", ignore_errors=True)
elif git_platform != "gitlab":
    unlink(".gitlab-ci.yaml")
```

### Copier Approach - Conditional File Names

Instead of post-generation hooks, use conditional file names:

```
template/{{project_name}}/
├── {% if with_fastapi %}src/{{package_name}}/api.py{% endif %}.jinja
├── {% if with_cyclopts %}src/{{package_name}}/cli/{% endif %}
├── {% if support_rtd %}.readthedocs.yaml{% endif %}.jinja
├── {% if git_platform == 'github' %}.github{% endif %}/
└── {% if git_platform == 'gitlab' %}.gitlab-ci.yaml{% endif %}.jinja
```

---

## Step 5: Conditional File Handling

### Files to make conditional:

| File/Directory | Condition |
|---------------|-----------|
| `.github/` | `git_platform == 'github'` |
| `.gitlab-ci.yaml` | `git_platform == 'gitlab'` |
| `.readthedocs.yaml` | `support_rtd` |
| `src/*/api.py` | `with_fastapi` |
| `src/*/cli/` | `with_cyclopts` |
| `tests/test_api.py` | `with_fastapi` |
| `tests/test_cli.py` | `with_cyclopts` |

### Directory conditional syntax:
```
{% if git_platform == 'github' %}.github{% endif %}/
    workflows/
        linting.yaml.jinja
        testing.yaml.jinja
```

---

## Step 6: Add Copier-Specific Features

### 6.1 Answer File Template
Create `.copier-answers.yml.jinja`:
```yaml
# This file was generated by Copier. Do not edit manually.
# https://copier.readthedocs.io/
_commit: "{{ _copier_conf.commit }}"
_src_path: "{{ _copier_conf.src_path }}"
```

### 6.2 Skip If Exists (for updates)
In `copier.yaml`:
```yaml
_skip_if_exists:
  - .env
  - "var/**"
  - "*.local"
```

### 6.3 Migrations Support
```yaml
_migrations:
  - version: v2.0.0
    before:
      - command: "echo 'Backing up pyproject.toml'"
      - command: "cp pyproject.toml pyproject.toml.bak"
    after:
      - command: "uv sync"
```

---

## Step 7: File Renaming Summary

### Files requiring `.jinja` suffix:

All files with Jinja2 templating need the `.jinja` suffix:

```
pyproject.toml          → pyproject.toml.jinja
.env.template           → .env.template.jinja
.pre-commit-config.yaml → .pre-commit-config.yaml.jinja
.gitlab-ci.yaml         → .gitlab-ci.yaml.jinja
docs/conf.py            → docs/conf.py.jinja
docs/readme.md          → docs/readme.md.jinja
etc/logging.yaml        → etc/logging.yaml.jinja
src/*/about.py          → src/*/about.py.jinja
src/*/cfg.py            → src/*/cfg.py.jinja
src/*/cli/__init__.py   → src/*/cli/__init__.py.jinja
tests/*.py              → tests/*.py.jinja
```

### Files to keep without `.jinja` suffix:

Files in `_copy_without_render` (justfiles):
```
justfile                → justfile (no suffix)
.just/*.justfile        → .just/*.justfile (no suffix)
```

---

## Step 8: Testing Checklist

- [ ] Generate new project with all features enabled
- [ ] Generate new project with all features disabled
- [ ] Verify conditional files are correctly included/excluded
- [ ] Test `copier update` on existing project
- [ ] Verify GitHub Actions syntax preserved (`{% raw %}`)
- [ ] Verify justfile variables preserved (not rendered)
- [ ] Run generated project's test suite
- [ ] Verify pre-commit hooks work

---

## Implementation Order

1. **Phase 1: Core Migration**
   - Create `copier.yaml` with all questions
   - Create `template/` subdirectory structure
   - Rename `{{cookiecutter.project_name}}` to `{{project_name}}`

2. **Phase 2: Syntax Conversion**
   - Add `.jinja` suffix to templated files
   - Convert `{{ cookiecutter.* }}` to `{{ * }}`
   - Convert `|int` conditionals to native booleans

3. **Phase 3: Conditional Files**
   - Implement conditional file/directory names
   - Remove post_gen_project.py hook
   - Add Copier tasks for git init, uv sync

4. **Phase 4: Validation**
   - Test all feature combinations
   - Test template updates
   - Update documentation

---

## References

- [Copier Documentation](https://copier.readthedocs.io/en/stable/)
- [Copier Configuration](https://copier.readthedocs.io/en/stable/configuring/)
- [Migration Guide from Cookiecutter](https://guidebook.devops.uis.cam.ac.uk/howtos/development/copier/migrate/)
- [From Cookiecutter to Copier Article](https://medium.com/@gema.correa/from-cookiecutter-to-copier-uv-and-just-the-new-python-project-stack-90fb4ba247a9)
