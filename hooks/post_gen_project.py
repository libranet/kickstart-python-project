import pathlib as pl
import shutil

# Read Cookiecutter configuration.
package_name = "{{ cookiecutter.__package_name_snake_case }}"
with_django = int("{{ cookiecutter.with_django }}")
with_fastapi = int("{{ cookiecutter.with_fastapi }}")
with_flask = int("{{ cookiecutter.with_flask }}")
with_typer = int("{{ cookiecutter.with_typer }}")
support_rtd = int("{{ cookiecutter.support_rtd }}")
git_platform= "{{ cookiecutter.git_platform }}"

if not with_fastapi:
    pl.Path(f"src/{package_name}/api.py").unlink(missing_ok=True)
    pl.Path(f"tests/test_api.py").unlink(missing_ok=True)

if not with_typer:
    pl.Path(f"src/{package_name}/cli.py").unlink(missing_ok=True)
    pl.Path(f"tests/test_cli.py").unlink(missing_ok=True)

if not support_rtd:
    pl.Path(f".readthedocs.yaml").unlink(missing_ok=True)

if git_platform != "github":
    shutil.rmtree(".github/")
elif git_platform != "gitlab":
    pl.Path(f".gitlab-ci.yaml").unlink(missing_ok=True)
