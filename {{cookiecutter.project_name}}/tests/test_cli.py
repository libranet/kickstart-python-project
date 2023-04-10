"""Tests for module {{cookiecutter.package_name}}.cli."""
import pytest

from click.testing import CliRunner

from {{cookiecutter.package_name}} import cli


# @pytest.fixture
# def runner() -> CliRunner:
#     """Fixture for invoking command-line interfaces."""
#     return CliRunner()


# def test_main_succeeds(runner: CliRunner) -> None:
#     """It exits with a status code of zero."""
#     result = runner.invoke(__main__.main)
#     assert result.exit_code == 0



def test_cli():
    # Your test setup code goes here, if any

    # Invoke the main() function
    result = CliRunner().invoke(main)

    # Assert that the command exited successfully
    assert result.exit_code == 0

    # Assert that the output is what we expect
    assert result.output.strip() == "{{cookiecutter.package_name}}."

    # Your test teardown code goes here, if any