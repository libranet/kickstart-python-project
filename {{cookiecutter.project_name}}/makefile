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
install: create-dirs dotenv-install poetry-install symlink-venv-dirs


.PHONY: dev-install  ## development installation
dev-install: git-init precommit-install-hook install


.PHONY: prd-install  ## production installation
dev-install: create-dirs dotenv-install poetry-install


.PHONY: post-install  ## post-install steps
post-install:
	# bin/pip install -e var/src/<dependent-package>

