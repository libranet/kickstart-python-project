# See ../makefile

.PHONY: pyenv-which  ## show which pyenv is used
pyenv-which:
	@ which pyenv


.PHONY: pyenv-update ## run "pyenv update" to update pyenv
pyenv-update:
	pyenv update


.PHONY: pyenv-available-versions ## list available python-versions
pyenv-availabe-versions:
	pyenv install --list


.PHONY: pyenv-installed-versions ## list installed python-versions
pyenv-installed-versions:
	pyenv versions


.PHONY: pyenv-install-python-3-10-7 ## install python 3.10.7
pyenv-install-3-10-7:
	pyenv install -v 3.10.7


.PHONY: pyenv-install-python-3-10-8 ## install python 3.10.8
pyenv-install-3-10-8:
	pyenv install -v 3.10.8