# See ../makefile

# do not use ths in CD/CI where other python-versions might be tested with
.PHONY: create-venv ## create virtual-env with specified python-version in .env
create-venv:
	poetry env use ${PYTHON_VERSION}


.PHONY: poetry-install ## run poetry install to create the virtualenv
poetry-install:
	poetry install


.PHONY: poetry-install-no-dev ## run poetry install without dev-dependencies
poetry-install-no-dev:
	poetry install --no-dev


.PHONY: poetry-install-no-root ## run poetry install to create the virtualenv and install only the dependencies
poetry-install-no-root:
	poetry install --no-root


.PHONY: poetry-install-no-root-no-dev ## run poetry install to create the virtualenv and install only the prd-dependencies
poetry-install-no-root-no-dev:
	poetry install --no-root --no-dev


.PHONY: poetry-lock ## run poetry lock to update poetry.lock
poetry-lock:
	poetry lock

.PHONY: poetry-self-update ## update poetry itself
poetry-self-update:
	poetry self update


.PHONY: poetry-update ## run poetry update to update your project-dependencies
poetry-update:
	poetry update


.PHONY: poetry-build ## run poetry build to create the python-package
poetry-build:
	poetry build


.PHONY: poetry-publish ## publish the package to pypi
poetry-publish:
       poetry publish


.PHONY: poetry-check ## run poetry check on python-package
poetry-check:
	poetry check


.PHONY: poetry-lock-check ## run poetry lock --check on python-package
poetry-lock-check:
	poetry lock --check


.PHONY: poetry-env-info ## run env info
poetry-env-info:
	poetry env info


.PHONY: poetry-export-requirements  ## generate a requirements.txt-file
poetry-export-requirements:
	poetry export --format requirements.txt --output requirements.txt


# no longer needed
# .PHONY: poetry-export-requirements-docs  ## generate a requirements.txt-file for readthedocs
# poetry-export-requirements-docs:
# 	poetry export --format requirements.txt --only=docs --without-hashes --output docs/requirements.txt


.PHONY: poetry-relax ## run poetry relax to relax upper bounds in pyproject.oml
poetry-relax:
	poetry relax


.PHONY: poetry-show  ## poetry show
poetry-show:
	poetry show -o


.PHONY: poetry-show-outdated  ## poetry show  --outdated
poetry-show-outdated:
	poetry show --outdated