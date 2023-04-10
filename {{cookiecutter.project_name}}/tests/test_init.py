# pylint: disable=import-outside-toplevel
# pylint: disable=missing-function-docstring
"""Testing of module {{cookiecutter.package_name}}.__init__."""
import packaging.version


def test_version() -> None:
    from {{cookiecutter.package_name}} import __version__

    assert isinstance(__version__, str)
    assert packaging.version.parse(__version__) >= packaging.version.parse("0.0")


def test_copyright() -> None:
    from {{cookiecutter.package_name}} import __copyright__

    assert isinstance(__copyright__, str)
    assert "Copyright" in __copyright__
