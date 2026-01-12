"""
{{cookiecutter.package_name}}._about.

Fetch metadata from the package's pyproject.toml.
The package must be properly installed in order the metadata to be available.

"""

from __future__ import annotations

import importlib.metadata

package: str = __package__ or ""


try:
    msg = importlib.metadata.metadata(package)
    pkginfo: dict[str, str | list[str]] = msg.json  # ty: ignore[unresolved-attribute]
except ValueError:
    # A distribution name is required. __package__ is None
    pkginfo = {}
except importlib.metadata.PackageNotFoundError:  # pragma: no cover
    # fallback if this package is not properly installed
    pkginfo = {}



authors: str | list[str] = pkginfo.get("author_email", "unknown")

license_: str | list[str] = pkginfo.get("license_expression") or pkginfo.get("license", "unknown") or "unknown"

version: str | list[str] = pkginfo.get("version", "unknown")


