"""{{cookiecutter.package_name}}.cfg."""

import logging
import pathlib as pl

import pydantic as pdt
import pydantic_settings

log = logging.getLogger(__name__)


class Settings(pydantic_settings.BaseSettings):
    """Application settings."""

    class Config:
        """Configuration for settings."""

        # we assume the environment variables are already loaded
        populate_by_name = True

    app_secret_key: str = pdt.Field(validation_alias="APP_SECRET_KEY")

    base_dir: pl.Path = pdt.Field(validation_alias="BASE_DIR")

    project_name: str = pdt.Field(default="{{cookiecutter.project_name}}", validation_alias="PROJECT_NAME")

    tmpdir: pl.Path = pdt.Field(default=pl.Path("/tmp"), validation_alias="TMPDIR")


def get_settings() -> Settings:
    """Get application settings."""
    return Settings()

