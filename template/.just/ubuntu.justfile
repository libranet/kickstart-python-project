
# ubuntu


# update ubuntu-packages
[group: 'ubuntu']
ubuntu-update:
    @ apt-get update


# cleanup ubuntu-cache
[group: 'ubuntu']
ubuntu-cleanup:
    #!/usr/bin/env bash
    set -euxo pipefail
    # clean up to reduce container size
    apt-get clean
    apt-get purge --auto-remove -y
    rm -rf /var/lib/apt/lists/*
    rm -rf /var/cache/apt/archives/*


# cleanup tmp-dir
[group: 'ubuntu']
ubuntu-cleanup-tmp:
    #!/usr/bin/env bash
    set -euxo pipefail
    rm -rf /tmp/*


# search for ubuntu-packages
[group: 'ubuntu']
ubuntu-search term:
    @ apt-cache search {{term}}


# remove global sitecustomize.py (to unblock our own)
[group: 'ubuntu']
ubuntu-remove-global-sitecustomize:
	sudo rm -f /usr/lib/python3.*/sitecustomize.py
	sudo rm -f /etc/python3.*/sitecustomize.py


# run steps to finalize docker-build-stage
[group: 'ubuntu']
ubuntu-finalize-stage stage: ubuntu-cleanup ubuntu-cleanup-tmp
    #!/usr/bin/env bash
    set -euxo pipefail

    # report about disk-usage
    echo "total disk-usage is now:"
    du -hs /usr /opt /var 2>/dev/null


# install ubuntu packages
[group: 'ubuntu']
ubuntu-install-package packages="": ubuntu-update && ubuntu-cleanup
    apt-get install --yes {{packages}}


# install firefox
[group: 'ubuntu']
ubuntu-install-neovim: ubuntu-update && ubuntu-cleanup
    apt-get install -y neovim

alias install-neovim := ubuntu-install-neovim


# install recent shellcheck
[group: 'ubuntu']
shellcheck-install target_dir="~/bin":
    #!/usr/bin/env bash
    set -euxo pipefail

    VERSION=v0.10.0
    FILENAME=shellcheck-${VERSION}.linux.x86_64.tar.xz
    DOWNLOAD_URL=https://github.com/koalaman/shellcheck/releases/download/${VERSION}/${FILENAME}

    echo -e "Downloading ${DOWNLOAD_URL}"
    curl -SLf ${DOWNLOAD_URL} --output /tmp/${FILENAME}
    tar xf /tmp/${FILENAME} --directory /tmp --strip-components 1
    mv /tmp/shellcheck {{target_dir}}
    chmod u+x {{target_dir}}/shellcheck


