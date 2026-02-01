"""{{cookiecutter.package_name}}.logging."""

import importlib.resources

import libranet_logging


def initialize():
    """Configure logging using the logging.yaml file from the package resources."""
    logging_yaml_file = importlib.resources.files("{{cookiecutter.package_name}}").joinpath("logging.yaml")  # Python3.9+
    libranet_logging.initialize(path=logging_yaml_file)
