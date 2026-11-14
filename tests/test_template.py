"""Regression checks for rendered Copier projects.

Run with `uv run python -m unittest tests/test_template.py` (dependencies: `testing` group in pyproject.toml).
"""

import ast
import pathlib
import shutil
import subprocess
import sys
import tempfile
import tomllib
import unittest

ROOT = pathlib.Path(__file__).resolve().parents[1]

# Run copier from the current environment (the `testing` dependency group, which includes jinja2-time).
COPIER = [sys.executable, "-m", "copier"]


class TemplateTests(unittest.TestCase):
    def test_options(self):
        for platform, cli, license_name in (
            ("github", True, "MIT"),
            ("gitlab", False, "Apache-2.0"),
            ("github", False, "GPL-3.0"),
        ):
            with self.subTest(platform=platform, cli=cli, license=license_name):
                with tempfile.TemporaryDirectory() as directory:
                    destination = pathlib.Path(directory) / "project"
                    answers = {
                        "project_name": "demo-project",
                        "package_name": "custom_package",
                        "author": 'A "quoted" author',
                        "email": "author@example.com",
                        "description": 'A "quoted" description',
                        "git_platform": platform,
                        "with_cyclopts": str(cli).lower(),
                        "license": license_name,
                        "minimum_python": "3.12",
                        "with_flask": "true",
                        "with_postgres": "true",
                    }
                    command = [
                        *COPIER, "copy", "--quiet", "--trust", "--skip-tasks",
                        "--defaults", "--vcs-ref", "HEAD",
                    ]
                    for key, value in answers.items():
                        command.extend(["-d", f"{key}={value}"])
                    subprocess.run(command + [str(ROOT), str(destination)], check=True)
                    metadata = tomllib.loads((destination / "pyproject.toml").read_text())
                    self.assertEqual(metadata["project"]["authors"][0]["name"], answers["author"])
                    self.assertEqual(bool(metadata["project"].get("scripts")), cli)
                    self.assertEqual((destination / "src/custom_package/cli").exists(), cli)
                    self.assertEqual((destination / ".gitlab-ci.yml").exists(), platform == "gitlab")
                    self.assertTrue((destination / "tests/_helpers/__init__.py").exists())
                    saved = (destination / ".copier-answers.yml").read_text()
                    self.assertIn("package_name: custom_package", saved)
                    self.assertIn("project_name: demo-project", saved)
                    dependencies = metadata["project"]["dependencies"]
                    self.assertTrue(any(item.startswith("flask>=") for item in dependencies))
                    self.assertTrue(any(item.startswith("psycopg[binary]") for item in dependencies))
                    for source in destination.rglob("*.py"):
                        ast.parse(source.read_text())
                    for workflow in (destination / ".github/workflows").glob("*.yaml"):
                        if workflow.stem in ("testing", "linting"):
                            self.assertIn('- "3.12"', workflow.read_text())
                            self.assertNotIn('- "3.11"', workflow.read_text())
    def test_update_preserves_answers_and_customizations(self):
        with tempfile.TemporaryDirectory() as directory:
            source = pathlib.Path(directory) / "template"
            destination = pathlib.Path(directory) / "project"
            source.mkdir()
            shutil.copytree(ROOT / "template", source / "template")
            shutil.copy2(ROOT / "copier.yaml", source / "copier.yaml")

            def git(path, *args):
                subprocess.run(
                    ["git", "-C", str(path), *args], check=True,
                    stdout=subprocess.DEVNULL, stderr=subprocess.PIPE,
                )

            def initialize(path):
                git(path, "init")
                git(path, "config", "user.name", "Template Test")
                git(path, "config", "user.email", "test@example.com")
                git(path, "config", "core.excludesfile", "/dev/null")
                git(path, "config", "commit.gpgsign", "false")

            initialize(source)
            git(source, "add", ".")
            git(source, "commit", "-m", "Test template v1")
            git(source, "tag", "v1.0.0")
            subprocess.run([
                *COPIER, "copy", "--quiet", "--trust", "--skip-tasks", "--defaults",
                "-d", "project_name=update-demo", "-d", "package_name=custom_package",
                "-d", "author=Tester", "-d", "email=test@example.com",
                "-d", "description=Update test", "-d", "with_cyclopts=false",
                str(source), str(destination),
            ], check=True)
            (destination / ".env").write_text("CUSTOM=value\n")
            initialize(destination)
            git(destination, "add", ".")
            git(destination, "commit", "-m", "Generated test project")
            (source / "template/update-marker.txt").write_text("updated\n")
            git(source, "add", ".")
            git(source, "commit", "-m", "Test template v2")
            git(source, "tag", "v2.0.0")
            subprocess.run([
                *COPIER, "update", "--quiet", "--trust", "--skip-tasks", "--defaults",
            ], cwd=destination, check=True)
            self.assertEqual((destination / "update-marker.txt").read_text(), "updated\n")
            self.assertEqual((destination / ".env").read_text(), "CUSTOM=value\n")
            self.assertTrue((destination / "src/custom_package").is_dir())
            self.assertFalse((destination / "src/custom_package/cli").exists())
