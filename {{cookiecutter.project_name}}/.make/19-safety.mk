# See ../makefile

.PHONY: safety-which  ## show which safety is used
safety-which:
	@ which safety


.PHONY: safety-check  ## run safety check
safety-check:
	safety check


.PHONY: safety-check-html  ## run safety check with html-report
safety-check-html:
	@ mkdir -p var/html/safety
	safety check --save-html var/html/safety/safety.html
