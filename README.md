# Pegasus Installer

Pegasus Installer v0.1.0

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

################################################################################

## Setup Pegasus Call Watcher

## Steps

1. Install Python 3.8: <https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe>. Set Python path to C:\Python\Python38
   - If you have to install Python in a different folder, you will need to update the `PEGASUS_PYTHON` environment variable in the `setup.bat` file.
   - Check 'Add Python 3.x to PATH'
   - Click 'Customize installation'
   - Option Features
     - You can leave all items checked
     - Click Next
   - Advanced Options
     - You can check all items, or just check:
       - Associate files with Python
       - Create shortcuts for installed applications
       - Add Python to environment variables
   - Set your install location to something like `C:\Python\Python3x`, this will make it easy to find and upgrade in the future.
   - Click Install
   - When installation has completed click Close
2. Set the `PEGASUS_LOCATION` environment variable in the `setup.bat` file
3. Set the
4. Run `setup.bat`

Resources:

- <https://docs.github.com/en/rest/repos/contents?apiVersion=2022-11-28#download-a-repository-archive-zip>
- <https://nssm.cc>

---

## Remove Test Items from Setup Scripts

- remove line that creates a fake `main.py` that emulates a successful download of the github repo
  - `CALL TYPE NUL > main.py`

---

## Scripts

This batch script will check if a specific python package is installed and set a variable to 1 or 0 then install package if not already installed.

```bat
SET "PEGASUS_LOCATION=D:\Default\Documents\Business\projects\pegasus"
SET "PEGASUS_VAR_FILE=._peg_var"
SET "PEGASUS_PIP_SQLALCHEMY=0"

@REM CHECK IF SQLALCHEMY IS INSTALLED AND UPDATE VARIABLE
SET "PEGASUS_PIP_SQLALCHEMY="
CALL python -c "import pkgutil; print(1 if pkgutil.find_loader(\"sqlalchemy\") else 0)" > %PEGASUS_LOCATION%\%PEGASUS_VAR_FILE%
SET /p PEGASUS_PIP_SQLALCHEMY=<%PEGASUS_VAR_FILE%
DEL %PEGASUS_VAR_FILE%

@REM INSTALL SQLALCHEMY IF VARIABLE IS 0
If NOT "%PEGASUS_PIP_SQLALCHEMY%"=="1" (
    CALL pip3 install sqlalchemy
)
```

---

This batch script will create a temp file named 'main.py' to simulate a proper download

```bat
@REM TEMP ADD MAIN.PY TO MIMIC PROPER DOWNLOAD, REMOVE WHEN GITHUB IS UPDATED
CALL TYPE NUL > %PEGASUS_LOCATION%\main.py
```

---

Stop Pegasus Windows Service

`nssm stop pegasus`

Remove Pegasus Windows Service

`nssm remove pegasus confirm`
