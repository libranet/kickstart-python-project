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
print(f"Importing {__file__}")

import logging


import rich

log: logging.Logger = logging.getLogger("ipython-startup")


def demo_urllib():
    """Demo urllib usage."""
    import urllib.request
    url = "https://httpbin.org/get"
    resp = urllib.request.urlopen(url)


def demo_requests():
    """Demo requests usage."""
    import requests

    url = "https://httpbin.org/get"
    resp = requests.get(url)
    log.info("Requests response status code: %s", resp.status_code)
    data = resp.json()
    log.info("Requests response data: %s", data)

    rich.print_json(data=data)

def demo_httpx():
    """Demo httpx usage."""
    import httpx

    url = "https://httpbin.org/get"
    log.debug(f"Fetching data from {url}")
    resp = httpx.get(url)
    log.info("HTTPX response status code: %s", resp.status_code)
    data = resp.json()
    log.info("HTTPX response data: %s", data)

    rich.print_json(data=data)

    # for key, value in data.items():
    #     r
    #     log.debug("Key: %s; Value: %s", key, value)