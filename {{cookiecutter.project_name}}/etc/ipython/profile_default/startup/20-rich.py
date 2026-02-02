# pylint: disable=unused-import
# pylint: disable=wrong-import-position
# pylint: disable=invalid-name

# ruff: noqa: INP001 (implicit part of namespace package)
# ruff: noqa: E402 (module level import not at top of file)
# ruff: noqa: F401 (unused import)

"""IPython startup-file, outside of PYTHONPATH. See readme."""

print(f"Importing {__file__}")

import rich.panel
import rich.pretty
from rich import inspect
from rich import print as rprint
from rich.panel import Panel
from rich.pretty import pprint
from rich.pretty import pprint as pp  # shorter alias

# see https://rich.readthedocs.io/en/stable/introduction.html#rich-in-the-repl
rich.pretty.install()

# in ipython-startup files, Panel.fit() alone does not display the panel
# The issue is that Panel.fit() creates a Panel object, but doesn't automatically display it.
# By wrapping it with rich.print the Panel will be rendered when IPython starts up.
# rprint(rich.panel.Panel.fit("[bold yellow]Hi, I'm a Panel", border_style="blue"))
