# Pegasus Installer

## Environment Variables

Update the following environment variables to download and setup Pegasus.

- "`PEGASUS_LOCATION`": Full path of Pegasus.
- "`PEGASUS_LOCATION_PYTHON`": Full path of Python.
- "`PEGASUS_LOG_DIRECTORY`": Full path of call logs.
- "`PEGASUS_GITHUB_PAT`": Access token to download Pegasus.
- "`PEGASUS_DB_NAME`": Database name.
- "`PEGASUS_DB_TABLE_PREFIX`": Prefix to anonymize database table names.
- "`PEGASUS_LOG_FILE_PREFIX`": Prefix of the call log filename.
- "`PEGASUS_LOG_FILE_SUFFIX`": Suffix of the call log filename.
- "`PEGASUS_CALL_STRING_PREFIX`": Prefix of call log string.
- "`PEGASUS_CALL_LOG_COLUMNS`": Number of items (6) in call log string plus one more for the line number; in case the call log contains multiple calls.

*Example:*

```batch
@REM SET WORKSTATION SPECIFIC ENVIRONMENT VARIABLES
SET "PEGASUS_LOCATION=c:\pegasus"
SET "PEGASUS_LOCATION_PYTHON=c:\python\python38"
SET "PEGASUS_LOG_DIRECTORY=c:\temp"

@REM SET GITHUB ENVIRONMENT VARIABLES
SET "PEGASUS_GITHUB_PAT=github_pat_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

@REM SET PEGASUS DATABASE ENVIRONMENT VARIABLES
SET "PEGASUS_DB_NAME=pegasus.sqlite"
SET "PEGASUS_DB_TABLE_PREFIX=peg_"

@REM SET PEGASUS CALL WATCHER ENVIRONMENT VARIABLES
SET "PEGASUS_LOG_FILE_PREFIX=log"
SET "PEGASUS_LOG_FILE_SUFFIX=.txt"
SET "PEGASUS_CALL_STRING_PREFIX=Call Placed"
SET "PEGASUS_CALL_LOG_COLUMNS=7"
```

## Requirements

### Windows

- Install on Windows.

### Python

Pegasus backend is built with Python.

- Download and install [Python 3.8 x64](https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe).

### Git

Git is used to download Pegasus from Github.

- Download and install [Git x64](https://git-scm.com/download/win).

### NVM for Windows

Pegasus frontend is built with Svelte. NVM is used to switch between versions of Node and NPM.

- Download [NVM](https://github.com/coreybutler/nvm-windows/releases/latest)
- Scroll down and click on 'Assets' to open the list of releases.
- Click 'nvm-setup.exe' to install
  - Click 'Yes' if a message pops up that says `Node vXX.XX.X is already installed. Do you want NVM to control this version?`
