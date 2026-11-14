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

import sitecustomize

print("Unfiltered entrypoints:")
sitecustomize.print_entrypoints(filtered=False)

print("\n")
print("Filtered entrypoints:")
sitecustomize.print_entrypoints(filtered=True)
