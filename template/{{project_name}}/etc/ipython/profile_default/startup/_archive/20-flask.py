# flake8: noqa: E402 (module level import not at top of file)
# pylint: disable=unused-import
# pylint: disable=wrong-import-position
# pylint: disable=invalid-name
"""IPython startup-file, outside of PYTHONPATH.

Files in this startup-folder will be run in lexicographical order,
so you can control the execution order of files with a prefix, e.g.::

    00-foo.py
    10-baz.py
    20-bar.py

return-statements are not allowed.

"""
print(f"\nRunning {__file__}")

import sys
import flask
from flask import g

import demo_flask.main

# instantiate the flask-app
app = demo_flask.main.create_app()

# The app context contains application-specific information.
# An app context is created and pushed at the beginning of each request
# if one is not already active. An app context is also pushed when
# running CLI commands.
# see https://flask.palletsprojects.com/en/2.2.x/appcontext/

# create an application-context to bind flask.g
app.app_context().push()

# print(f"Python {sys.version} on {sys.platform}")
print(f"App: {app.import_name} (debug={app.debug})")
print(f"Instance: {app.instance_path}")
print(f"g: {g}")
