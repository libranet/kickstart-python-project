# Contributing

Install the development environment:

```bash
just install
```

Run tests and lint checks before submitting a pull request:

```bash
uv run pytest
uv run ruff check src tests
uv run ruff format --check src tests
```
