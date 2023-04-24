import os
import shutil

# Read Cookiecutter configuration.
package_name = "{{ cookiecutter.__package_name_snake_case }}"
with_django = int("{{ cookiecutter.with_django }}")
with_fastapi = int("{{ cookiecutter.with_fastapi }}")
with_flask = int("{{ cookiecutter.with_flask }}")
with_typer = int("{{ cookiecutter.with_typer }}")
support_rtd = int("{{ cookiecutter.support_rtd }}")
git_platform= int("{{ cookiecutter.git_platform }}")

if not with_fastapi:
    os.remove(f"src/{package_name}/api.py")
    os.remove("tests/test_api.py")

if not with_typer:
    os.remove(f"src/{package_name}/cli.py")
    os.remove("tests/test_cli.py")

if not support_rtd:
    os.remove(".readthedocs.yaml")


if git_platform != "gitHub":
    shutil.rmtree(".github/")
elif git_platform != "gitLab":
    os.remove(".gitlab-ci.yml")