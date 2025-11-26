# pylint: disable=import-outside-toplevel
# pylint: disable=missing-function-docstring
"""Testing of module {{cookiecutter.package_name}}.__init__."""
import packaging.version


def test_version() -> None:
    from {{cookiecutter.package_name}} import __version__

    assert isinstance(__version__, str)
    assert packaging.version.parse(__version__) >= packaging.version.parse("0.0")


# def test_copyright() -> None:
#     from {{cookiecutter.package_name}} import __copyright__

#     assert isinstance(__copyright__, str)
#     assert "Copyright" in __copyright__


def test_license() -> None:
    import {{cookiecutter.package_name}}
    # from {{cookiecutter.package_name}} import __license__

    assert isinstance({{cookiecutter.package_name}}.__license__, str)
    assert "MIT" in {{cookiecutter.package_name}}.__license__
