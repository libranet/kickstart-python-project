# See ../makefile

.PHONY: sphinx-build-which  ## show which sphinx-build is used
sphinx-build-which:
	@ which sphinx-build


.PHONY: sphinx-docs  ## generate sphinx-docs in var/html-docs
sphinx-docs: sphinx-build-which
	sphinx-build -b html -d var/cache/sphinx-doctrees -w var/log/sphinx-build.log docs var/html-docs
	@echo
	@echo "Build finished."


.PHONY : docs  ## alias for sphinx-docs
docs : sphinx-docs