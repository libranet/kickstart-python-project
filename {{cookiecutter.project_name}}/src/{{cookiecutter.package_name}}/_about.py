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



# __metadata__: dict = pkginfo

# __author__: str | list[str] = pkginfo.get("author", "unknown")

# __author_email__: str | list[str] = pkginfo.get("author_email", "unknown")

# __copyright__: str | list[str] = pkginfo.get("license", "unknown")

# __description__: str | list[str] = pkginfo.get("summary", "unknown")

# __license__: str | list[str] = pkginfo.get("license", "unknown")

# __pkg_name__: str | list[str] = pkginfo.get("name", "unknown")

# __readme__: str | list[str] = pkginfo.get("description", "unknown")

# __url__: str | list[str] = pkginfo.get("project_url", "unknown")

# __version__: str | list[str] = pkginfo.get("version", "unknown")
