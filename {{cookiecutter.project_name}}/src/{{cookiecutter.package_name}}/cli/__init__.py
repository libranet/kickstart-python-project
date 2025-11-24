"""{{cookiecutter.package_name}}.cli."""

import cyclopts

from {{cookiecutter.package_name}} import __version__
from {{cookiecutter.package_name}}.cli.subcmd1 import app_subcmd1

app: cyclopts.App = cyclopts.App(version=__version__)

# register subcommands
app.command(obj=app_subcmd1)


@app.default
def main() -> None:
    """Main command when no subcommand is provided."""
    pass
