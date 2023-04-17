# See ../makefile
# dependencies: {VENV_DIR} defined in 01-path.mk

.PHONY: create-dirs ## initialize dir-structure, create dirs
create-dirs:
	@echo -e "In current working dir: ${PWD}"
	mkdir -p var
	mkdir -p var/cache
	mkdir -p var/cache/vscode
	mkdir -p var/html
	mkdir -p var/log
	mkdir -p var/run
	mkdir -p var/tmp


.PHONY: symlink-venv-dirs ## symlinks to venv-dirs to make bin/python work
symlink-venv-dirs:
	ln -sf ${VENV_DIR}/bin
	ln -sf ${VENV_DIR}/lib
	ln -sf ${VENV_DIR}/pyvenv.cfg
	# optional lib64
	if [ -d "${VENV_DIR}/lib64" ]; then ln -sf "${VENV_DIR}/lib64" ; fi


# .PHONY: symlink-venv-dirs ## symlinks to venv-dirs to make bin/python work
# symlink-venv-dirs:
# 	@ ln -sf ${VENV_DIR}/bin && echo -e "Created symlink to ${VENV_DIR}/bin";
# 	@if [ -e ${VENV_DIR}/lib ]; then ln -sf ${VENV_DIR}/lib && echo -e "Created symlink to ${VENV_DIR}/lib" ; fi
# 	@if [ -e ${VENV_DIR}/lib64 ]; then ln -sf ${VENV_DIR}/lib64 && echo -e "Created symlink to ${VENV_DIR}/lib64" ; fi
# 	@if [ -e ${VENV_DIR}/pyvenv.cfg ]; then ln -sf ${VENV_DIR}/pyvenv.cfg && echo -e "Created symlink to ${VENV_DIR}/pyvenv.cfg"; fi