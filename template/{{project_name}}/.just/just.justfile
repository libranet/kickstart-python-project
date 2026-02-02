
# just


# install Just to latest version
[group: 'just']
[windows]
just-install:
    winget install --id Casey.Just --exact --force


# install Just to latest version
[group: 'just']
[unix]
just-install:
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/bin

alias just-update := just-install


# show help
[group: 'just']
help:
    @ {{just_executable()}} --help


# show version
[group: 'just']
just-version:
    {{just_executable()}} --version

alias version := just-version


# Display all canonical tasks and their aliases
[group: 'just']
list-all:
    @ {{just_executable()}} --list --unsorted


# select recipe from list
[group: 'just']
choose:
    @ {{just_executable()}} --choose --justfile justfile


[group: 'just']
evaluate:
    @ {{just_executable()}} evaluate


# Install or update tab-completion for just-recipes
[group: 'just']
[windows]
just-install-completions:
    #!pwsh.exe
    $filePath = Join-Path $HOME 'completions-just.ps1'
    {{just_executable()}} --completions powershell > $filePath
    Write-Host "Generated completions-file in $filePath"
    Write-Host "Add following line to your Powershell-profile:"
    Write-Host ". ~\completions-just.ps1 -Force"%


# Update tab-completions file for just
[group: 'just']
[windows]
just-update-completions:
    #!pwsh.exe
    $filePath = 'etc/just/completions-just.ps1'
    {{just_executable()}} --completions powershell > $filePath
    Write-Host "Generated new completions-file for powershell in $filePath"


# show location of just.exe
[group: 'just']
[windows]
just-where:
    @ Write-Host "Location of just.exe is:"
    @ (Get-Command just.exe).Source


[group: 'just']
[windows]
just-create-symlinks:
    @ Write-Host "Create symlinks:"
    @ bin/create-symlink.ps1 justfile $env:USERPROFILE\justfile
    @ bin/create-symlink.ps1 bin\just.exe $env:USERPROFILE\bin\just.exe


[group: 'just']
[windows]
just-create-toplevel-symlinks:
    @ Write-Host "Create symlinks:"
    @ # bin/create-symlink.ps1 justfile C:\justfile
    # Start-Process powershell -Verb runAs "bin/create-symlink.ps1 justfile C:\justfile"
    Start-Process powershell -ArgumentList '-ExecutionPolicy', 'Bypass', '-File', 'bin\create-symlink.ps1', 'justfile', 'C:\justfile' -Verb RunAs


# Symlink justfile from C:\
[group: 'just']
[windows]
just-symlink-toplevel-justfile:
        #!pwsh.exe
        $path = "."

        # Resolve the current directory to get its full path
        $fullPath = (Get-Item -Path $path -ErrorAction SilentlyContinue)?.FullName

        if (-not [string]::IsNullOrWhiteSpace($fullPath)) {
            # Check if the resolved path is a drive root
            if ($fullPath -eq (Split-Path $fullPath -Parent)) {
                $topLevelParent = $null  # Set to null if the path is the drive root
            } else {
                # Loop to find the top-level parent directory
                while ($fullPath -ne "" -and $fullPath -ne (Split-Path $fullPath -Parent)) {
                    Write-Output "Resolving the full path of the current directory: $fullPath"
                    $topLevelParent = $fullPath  # Update $topLevelParent within the loop
                    $fullPath = Split-Path $fullPath -Parent
                }
            }

            if ($topLevelParent) {
                Write-Output "Top-level parent directory: $topLevelParent"
            } else {
                Write-Output "Failed to resolve the top-level parent directory."
            }
        } else {
            Write-Output "Failed to resolve the current directory."
        }


# check if just is installed, otherwise install it
[group: 'just']
[windows]
just-check:
    @if (-not (Get-Command uv.exe -ErrorAction SilentlyContinue)) { \
        just just-install; \
    } else { \
        Write-Output "uv.exe found on PATH"; \
    }


# install just
# [windows]
#     #!pwsh.exe
#     $installCommand = "curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to $targetDir"
#     Invoke-Expression -Command $installCommand
#     $installScript = Invoke-WebRequest -Uri "https://just.systems/install.sh"
#     $installCommand = $installScript.Content + " --to $targetDir"
#     Invoke-Expression -Command $installCommand
#     Invoke-WebRequest -Uri "https://just.systems/install.sh" -UseBasicParsing | Invoke-Expression -ArgumentList "--to $DEST"


# # Update Just to a newer version
# [windows]
# just-update:
#     #!pwsh.exe
#     $targetDir = "$env:USERPROFILE\bin"
#     Invoke-WebRequest -Uri "https://just.systems/install.sh"
#     $installCommand = $installScript.Content + " --to $targetDir"
#     Invoke-Expression -Command $installCommand
#     Invoke-WebRequest -Uri "https://just.systems/install.sh" -UseBasicParsing | Invoke-Expression -ArgumentList "--to $DEST"
