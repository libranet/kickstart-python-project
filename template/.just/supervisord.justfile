# See ../justfile


# execute bin/supervisord
[group: 'supervisord']
supervisord-start:
	bin/supervisord


# execute bin/supervisorctl shutdown
[group: 'supervisord']
supervisord-stop:
	bin/supervisorctl shutdown


# execute bin/supervisorctl status
[group: 'supervisord']
supervisord-status:
	bin/supervisorctl status
