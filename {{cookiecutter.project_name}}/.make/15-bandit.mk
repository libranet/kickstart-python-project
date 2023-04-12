# See ../makefile

.PHONY: randit-which  ## show which bandit is used
bandit-which:
	@ which bandit


.PHONY: bandit  ## run bandit
bandit:
	bandit --recursive src --baseline etc/bandit-baseline.json


.PHONY: bandit-update-baseline  ## update bandit baseline
bandit-update-baseline:
	bandit --recursive src --format json --output etc/bandit-baseline.json