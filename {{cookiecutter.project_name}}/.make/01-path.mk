# See ../makefile

# Add virtualenv to PATH, same effect as activating the virtualenv
# VENV_BIN_DIR := $(shell pwd)/.venv/bin
VENV_DIR := $(shell poetry env info --path)
VENV_BIN_DIR := ${VENV_DIR}/bin
export PATH := $(VENV_BIN_DIR):$(PATH)
