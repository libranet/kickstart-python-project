# See ../makefile

.PHONY: git-init  ## initialize  new git-repo
git-init:
	git init


.PHONY: git-remote-show-origin  ## git-remote-show-origin
git-remote-show-origin:
	git remote show origin


.PHONY: git-fetch-tags  ## git fetch --tags
git-fetch-tags:
	git fetch --tags


.PHONY: git-show-remote-tags  ## git ls-remote --tags
git-show-remote-tags:
	git ls-remote --tags


.PHONY: git-show-local-tags  ## git tag -l
git-show-local-tags: git-fetch-tags
	echo -e "Local tags"
	git tag -l


.PHONY: git-show-tags  ## show local & remote tags
git-show-tags:
	@echo -e "Local tags"
	git tag -l
	@echo -e "Remote tags"
	git ls-remote --tags
