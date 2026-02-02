# pylint: disable=import-outside-toplevel
# pylint: disable=missing-function-docstring
"""Testing of _helper-module."""

from _helpers import foo


def test_foo() -> None:
    assert foo() == "foo"
