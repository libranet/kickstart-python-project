
# sshx


# install sshx
[group: 'sshx']
[unix]
sshx-install:
    curl -sSf https://sshx.io/get | sh

alias install-sshx := sshx-install


# display version of sshx
[group: 'sshx']
[unix]
sshx-version:
	sshx --version


# run sshx
[group: 'sshx']
[unix]
sshx-run:
	sshx


# run sshx for interactive cli-debugging
[group: 'sshx']
[unix]
sshx: sshx-install sshx-run

