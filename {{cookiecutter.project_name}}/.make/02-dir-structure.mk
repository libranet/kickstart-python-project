# See ../makefile

.PHONY: create-dirs ## initialize dir-structure, create dirs
create-dirs:
	@echo -e "In current working dir: ${PWD}"
	mkdir -p var ;\
	mkdir -p var/cache ;\
	mkdir -p var/cache/vscode ;\
	mkdir -p var/log ;\
	mkdir -p var/tmp


.PHONY: symlink-venv-dirs ## symlinks to venv-dirs to make bin/python work
symlink-venv-dirs:
	ln -sf ${VENV_DIR}/bin ;\
	ln -sf ${VENV_DIR}/lib ;\
	ln -sf ${VENV_DIR}/lib64 ;\
	ln -sf ${VENV_DIR}/pyvenv.cfg