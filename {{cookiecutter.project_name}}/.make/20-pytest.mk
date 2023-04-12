# See ../makefile

.PHONY: pytest-which  ## show which pytest is used
pytest-which:
	@ which pytest


.PHONY: pytest ## run pytest on python-files
pytest:
	- pytest tests


.PHONY: pytest-pdb  ## run pytest on python-files with the --pdb-flag
pytest-pdb:
	- pytest tests --pdb


.PHONY: pytest-cov  ## run pytest and generate html-coverage --pdb-flag
pytest-cov:
	- pytest tests --cov=src --cov-report html  --cov-report xml --cov-report term  -v


.PHONY: pytest-pdb-cov  ## run pytest with the --pdb-flag and generate html-coverage
pytest-pdb-cov:
	- pytest tests --cov=src --cov-report html  --cov-report xml --cov-report term  -v  --pdb


.PHONY: pytest-cov-pdb  ## run pytest with the --pdb-flag and generate html-coverage
pytest-cov-pdb: pytest-pdb-cov


.PHONY: pytest-pdb-cov-lf
pytest-pdb-cov-lf:
	- pytest tests --cov=src --cov-report html -v --pdb --lf


.PHONY: pytest-cov-pdb-lf
pytest-cov-pdb-lf: pytest-pdb-cov-lf