"""Tests for module {{cookiecutter.package_name}}.cli."""
from typer.testing import CliRunner


# def test_main_succeeds(runner: CliRunner) -> None:
#     """It exits with a status code of zero."""
#     result = runner.invoke(__main__.main)
#     assert result.exit_code == 0


def test_cli() -> None:
    from {{cookiecutter.package_name}}.cli import main

    # Invoke the main() function
    result = CliRunner().invoke(main)

    assert result.output.strip() == "{{cookiecutter.package_name}}."



def test_app_version(cli_runner) -> None:
    from {{cookiecutter.package_name}}.cli import app

    result = cli_runner.invoke(app, ["--version"])

    # Assert that the command exited successfully
    assert result.exit_code == 0

    # Assert that the output is what we expect
    assert "Hello Camila" in result.stdout
