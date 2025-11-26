{% raw -%}
# dotenv

env_file :=  justfile_directory() / ".env"


# instantiate the dotenv-file (no override)
# cp --backup creates .env~, but will overwrite this next time.
# safest way, is to not overwrite existing .env-files, manual intervention needed.
[group: 'dotenv']
[unix]
dotenv-install-from-template:
    #!/usr/bin/env bash
    if [ -f .env ]; then
        echo -e ".env file already exists. Not overwriting it.\n"
    else
        echo -e "Copying .env.template to .env" ;\
        cp .env.template .env ;\
    fi



# # replace placeholder __CWD__ with current working directory
# [group: 'dotenv']
# dotenv-set-basedir:
#     @echo -e "Replacing string __CWD__ -> $(PWD)" ;\
#     sed -i 's@__CWD__@'"$(PWD)"'@'  .env


# replace placeholder __CWD__ with current working directory
[group: 'dotenv']
[linux]
dotenv-set-basedir:
    #!/usr/bin/env bash
    if [ -f .env ]; then
        echo -e "Replacing string __CWD__ with current directory $(pwd) in .env file."
        sed -i.backup 's@__CWD__@'"$(pwd)"'@g' .env
        echo -e ".env updated successfully. Please review any credentials.\n"
    else
        echo -e "Error: .env file not found!\n" >&2
        exit 1
    fi


# install .env-file from .env.template
[group: 'dotenv']
dotenv-install: dotenv-install-from-template dotenv-set-basedir

alias install-dotenv := dotenv-install


# display env-vars defined in .env
[group: 'dotenv']
show-dotenv:
    @ echo -e "Following environment variables are defined in the {{env_file}}:"
    @ cat .env

{%- endraw %}