# See ../makefile

.PHONY: django-which  ## show which django is used
django-which:
	@ which django


.PHONY: django-help  ## display django-admin --help
django-help:
	- django-admin --help


.PHONY: django-version  ## display django-admin --version
django-version:
	- django-admin --version


.PHONY: django-runserver  ## runserver
django-runserver:
	- django-admin runserver


.PHONY: django-migrate  ## migrate database
django-migrate:
	- django-admin migrate


.PHONY: django-createsuperuser  ## create super-user
django-createsuperuser:
	- django-admin createsuperuser


.PHONY: django-collectstatic  ## collectstatic
django-collectstatic:
	- django-admin collectstatic --no-input


# Define variables outside the recipe
# NEW_KEY=`echo $(RANDOM) | md5sum | head -c 20; echo`
DJANGO_SECRET_KEY=`python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"`

.PHONY: dotenv-set-django-secret-key  ## replace placeholder __DJANGO_SECRET_KEY__ with random value
dotenv-set-django-secret-key:
	echo -e "Replacing string __DJANGO_SECRET_KEY__ with random generated value" ;\
	$(SED) -i 's@__DJANGO_SECRET_KEY__@'"$(DJANGO_SECRET_KEY)"'@' .env


# # Define variables outside the recipe
# NEW_KEY=`echo $(RANDOM) | md5sum | head -c 20; echo`
# .PHONY: dotenv-set-flask-secret-key  ## replace placeholder __SECRET_KEY__ with random value
# dotenv-set-flask-secret-key:
# 	echo -e "Replacing string __SECRET_KEY__ with random generated value" ;\
# 	$(SED) -i 's@__SECRET_KEY__@'"$(NEW_KEY)"'@' .env
