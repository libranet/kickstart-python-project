"""{{cookiecutter.package_name}}.__main__.

Command-line interface.
"""
import click


@click.command()
@click.version_option()
def main() -> None:
    """{{cookiecutter.friendly_name}}."""