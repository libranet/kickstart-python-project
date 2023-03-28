# See ../makefile

# readthedocs already provisions a virtualenv for us.
# So we only need to install our packags into that virtualenv.
.PHONY: install-rtd  ## installation for readthedocs
install-rtd:
	- python -m pip install --upgrade pip
	- python -m pip install poetry
	- poetry config virtualenvs.create false --local
	- poetry install --only docs
