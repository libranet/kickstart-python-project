
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




[group: 'dotenv']
[windows]
dotenv-install-from-template:
    #!pwsh
    if (Test-Path .env) {
        Write-Host ".env file already exists. Not overwriting it.`n"
    } else {
        Write-Host "Copying .env.template to .env"
        Copy-Item .env.template .env
    }



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


[group: 'dotenv']
[windows]
dotenv-set-basedir:
    #!pwsh
    if (Test-Path .env) {
        $currentDir = (Get-Location).Path
        Write-Host "Replacing string __CWD__ with current directory $currentDir in .env file."
        Copy-Item .env .env.backup
        (Get-Content .env) -replace '__CWD__', $currentDir | Set-Content .env
        Write-Host ".env updated successfully. Please review any credentials.`n"
    } else {
        Write-Error "Error: .env file not found!`n"
        exit 1
    }


# install .env-file from .env.template
[group: 'dotenv']
dotenv-install: dotenv-install-from-template dotenv-set-basedir

alias install-dotenv := dotenv-install


# display env-vars defined in .env
[group: 'dotenv']
show-dotenv:
    @ echo -e "Following environment variables are defined in the {{env_file}}:"
    @ cat .env

