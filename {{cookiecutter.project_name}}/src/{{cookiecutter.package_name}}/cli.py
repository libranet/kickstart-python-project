"""{{cookiecutter.package_name}}.cli.

Command-line interface.
"""
from {{cookiecutter.package_name}} import __version__
# import click
import typer


# @click.command()
# @click.version_option()
# def main() -> None:
#     """{{cookiecutter.package_name}}."""


app = typer.Typer()

@app.callback()
def version_callback(value: bool):
    if value:
        typer.echo(f"{__version__}")
        raise typer.Exit()


@app.command()
def main() -> None:
    """{{cookiecutter.package_name}}."""
    typer.echo("Hello {{cookiecutter.package_name}}.")