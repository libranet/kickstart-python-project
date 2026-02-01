"""Tests for module demo3.cli."""
import pytest


def test_cli(capsys: pytest.CaptureFixture[str]) -> None:
    """Test that the main command runs without error."""
    from demo3.cli import app

    # Invoke the app with no arguments (runs default command)
    # Must pass empty list explicitly to prevent cyclopts from using sys.argv
    with pytest.raises(SystemExit) as exc_info:
        app([])

    assert exc_info.value.code == 0

    captured = capsys.readouterr()
    # main() currently does nothing (pass), so no output expected
    assert captured.out == ""


def test_app_version(capsys: pytest.CaptureFixture[str]) -> None:
    """Test that --version flag works."""
    from demo3.about import version
    from demo3.cli import app

    # Invoke the app with --version flag
    with pytest.raises(SystemExit) as exc_info:
        app(["--version"])

    # --version typically exits with code 0
    assert exc_info.value.code == 0

    captured = capsys.readouterr()
    assert str(version) in captured.out
