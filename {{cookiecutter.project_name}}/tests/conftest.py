# pylint: disable=import-outside-toplevel
"""conftest.py - custom pytest-plugins.

For more information about conftest.py, please see:

 - https://docs.pytest.org/en/latest/writing_plugins.html
 - https://pytest-flask.readthedocs.io/en/latest/tutorial.html
 - https://stackoverflow.com/questions/34466027/in-pytest-what-is-the-use-of-conftest-py-files

This file contains the configurations that we need for running our tests:

 - different data, dummy, regression, classification
 - libpaths to the different models we want to test
 - A sample (baseline) configuration to pass to the experiment and artifact object
 - Utilities for generating new configurations based on provided parameters (model type, problem type)


Note: The tests-directory itself is NOT a python-package (no __init__.py).
Please avoid putting an __init.py-file in this directory. If you by accident put an __init__.py in this tests-directory,
you will not be able to run pytest, instead it will fail with:

    > ImportError: Error importing plugin "_helpers": No module named '_helpers'

The "_helpers"-directory contains code that can be re-used in various tests.

Usage:
======
  # run all test from the toplevel-directory:
  > pytest tests

  # to display the full list of tests being run
  > pytest tests -vv

  # run tests, but stop in interactive debugger upon every failure
  > pyest tests --pdb

  # run only tests-modules  filtered in a glob
  > pytest tests/foo/test_bar*

  # run only specific tests inside specific modules
  > pytest  tests/test_foo/test_bar*::*test_baz

  # only run tests with a certain marker
  > pytest -v -m "integration"
  > pytest -v -m "not integration"

  # generate coverage in the terminal + in html-report
  > pytest --cov="autoread_dotenv"  --cov-report=term  --cov-report=html

"""
import pytest
pytest_plugins = [
    "_helpers",
]


@pytest.fixture()
def demo():
    return "demo"