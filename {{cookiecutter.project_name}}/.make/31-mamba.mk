# See ../makefile

.PHONY: mamba-which  ## show which mamba is used
mamba-which:
	@ which mamba


.PHONY: mamba-info ## list info currently activated conda-env (via mamba)
mamba-info:
	mamba info


.PHONY: mamba-info-envs ## list available conda-envs (via mamba)
mamba-info-envs:
	mamba info --envs
