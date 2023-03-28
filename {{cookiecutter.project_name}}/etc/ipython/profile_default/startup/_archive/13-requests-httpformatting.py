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
We avoid executing code when debugging in ipdb by checking on env-var IS_IPYTHON
which is set in sitecustomize.

"""
print(f"\nRunning {__file__}")

import logging
import requests
import textwrap

url = "https://example.com"


# from demo_flask.formatter import HttpFormatter

class HttpFormatter(logging.Formatter):

    def format_headers(self, d):
        return '\n'.join(f'{k}: {v}' for k, v in d.items())

    def formatMessage(self, record):
        result = super().formatMessage(record)
        # if record.name == 'http.client':

        result += textwrap.dedent("""
            ---------------- request ----------------
            {req.method} {req.url}
            {req_headers}

            Body:
            {req.body}
            \n
            ---------------- response ----------------
            {resp.status_code} {resp.reason} {resp.url}
            {resp_headers}

            {resp.text}
        """).format(
            req=record.req,
            resp=record.res,
            req_headers=self.format_headers(record.req.headers),
            resp_headers=self.format_headers(record.res.headers),
        )

#         return result


formatter = HttpFormatter('{asctime} {levelname} {name} {message}', style='{')
handler = logging.StreamHandler()
handler.setFormatter(formatter)


log = logging.getLogger("httplogger")

# log.handlers.append(handler)

def log_roundtrip(response, *args, **kwargs):
    extra = {'req': response.request, 'res': response}
    # breakpoint()
    log.debug('HTTP roundtrip', extra=extra)

session = requests.Session()
session.hooks['response'].append(log_roundtrip)

resp = session.get(url, timeout=5)
# resp = session.get(url, hooks={'response': [log_roundtrip]})



# def print_url(r, *args, **kwargs):
#     print(r.url)

# def record_hook(r, *args, **kwargs):
#     r.hook_called = True
#     return r

# hooks={'response': print_url}

# requests.get('https://httpbin.org/', hooks={'response': print_url})
# r = requests.get('https://httpbin.org/', hooks={'response': [print_url, log_roundtrip, record_hook]})


