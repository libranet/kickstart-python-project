# See ../makefile

.PHONY: conda-which  ## show which conda is used
conda-which:
	@ which conda


.PHONY: install-mamba-in-base-conda  ## install mamba package manager
install-mamba-in-base-conda:
	conda install --name base --channel conda-forge --yes mamba


.PHONY: conda-info ## list info currently activated conda-env
conda-info:
	conda info


.PHONY: conda-info-envs ## list available conda-envs
conda-info-envs:
	conda info --envs
