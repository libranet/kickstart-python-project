"""Tests for module {{cookiecutter.package_name}}.cli."""
import pytest

from typer.testing import CliRunner

from {{cookiecutter.package_name}}.cli import app



# def test_main_succeeds(runner: CliRunner) -> None:
#     """It exits with a status code of zero."""
#     result = runner.invoke(__main__.main)
#     assert result.exit_code == 0



def test_cli():

    # Invoke the main() function
    result = CliRunner().invoke(main)

    assert result.output.strip() == "{{cookiecutter.package_name}}."





def test_app_version(cli_runner):
    result = cli_runner.invoke(app, ["--version"])

    # Assert that the command exited successfully
    assert result.exit_code == 0

    # Assert that the output is what we expect
    assert "Hello Camila" in result.stdout
