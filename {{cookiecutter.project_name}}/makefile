# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.
#
# For more information, please see
#   - https://www.gnu.org/software/make/manual/make.html
#
# General syntax:
#   targets : prerequisites; recipes
#   <TAB>recipe
#
# - Commands starting with
#     "-" are ignoring their exit-code.
#     "@" do not echo the command itself.
#
# - make starts a new shell process for each recipe line.
#   Thus shell variables, even exported environment variables, cannot propagate upwards.
#   Therefore better concatenate your multiline-commands with ";\" into a single line.


# include re-usable makefiles
-include .make/*.mk


.PHONY: install  ## full initial installation
install: create-dirs create-dirs-extra dotenv-install poetry-install symlink-venv-dirs


.PHONY: install-dev  ## development installation
install-dev: git-init precommit-install-hook install


.PHONY: prd-install-prd  ## production installation
install-prd: create-dirs dotenv-install poetry-install


.PHONY: post-install  ## post-install steps
post-install:
	# bin/pip install -e var/src/<dependent-package>


.PHONY: create-dirs-extra ## create extra dirs
create-dirs-extra:
	mkdir -p var/data
	mkdir -p var/static
	mkdir -p var/upload