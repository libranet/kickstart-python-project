# pylint: disable=import-outside-toplevel
# pylint: disable=missing-function-docstring
"""Testing of module {{cookiecutter.package_name}}.about."""

import packaging.version


def test_version() -> None:
    from {{cookiecutter.package_name}}.about import version

    assert isinstance(version, str)
    assert packaging.version.parse(version) >= packaging.version.parse("0.0")


def test_license() -> None:
    from {{cookiecutter.package_name}}.about import license

    assert isinstance(license, str)
    assert "Copyright" in license
