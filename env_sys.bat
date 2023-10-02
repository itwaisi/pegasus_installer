@ECHO OFF

@REM SET DEBUG ENVIRONMENT VARIABLES
SET "PEGASUS_DBG_DOWNLOAD=1"
SET "PEGASUS_DBG_PIP_INSTALL=1"
SET "PEGASUS_DBG_CREATE_SERVICE=1"

@REM SET PEGASUS LABEL ENVIRONMENT VARIABLES
SET "PEGASUS_LABEL_PROGRAM=PEGASUS"
SET "PEGASUS_LABEL_WATCHER=CALL WATCHER"
SET "PEGASUS_LABEL_API=API"
SET "PEGASUS_LABEL_FRONTEND=WEBSITE"
SET "PEGASUS_LABEL_VENV=.venv"

@REM SET PEGASUS FOLDER ENVIRONMENT VARIABLES
SET "PEGASUS_LOCATION_PACKAGE=%PEGASUS_LOCATION%\pegasus"
SET "PEGASUS_LOCATION_APP_CALLWATCHER=%PEGASUS_LOCATION_PACKAGE%\call_watcher"
SET "PEGASUS_LOCATION_APP_API=%PEGASUS_LOCATION_PACKAGE%\api"
SET "PEGASUS_LOCATION_APP_FRONTEND=%PEGASUS_LOCATION_PACKAGE%\frontend"
SET "PEGASUS_LOCATION_APP_FRONTEND_DIST=%PEGASUS_LOCATION_PACKAGE%\frontend\dist"
SET "PEGASUS_LOCATION_APP_DATABASE=%PEGASUS_LOCATION_PACKAGE%\database"
SET "PEGASUS_LOCATION_DATABASE_STORAGE=%PEGASUS_LOCATION_APP_DATABASE%\storage"
SET "PEGASUS_LOCATION_VENV=%PEGASUS_LOCATION%\%PEGASUS_LABEL_VENV%"

@REM SET PYTHON ENVIRONMENT VARIABLES
SET "PEGASUS_PYTHON=%PEGASUS_LOCATION_PYTHON%\python.exe"
SET "PEGASUS_PIP=%PEGASUS_LOCATION_PYTHON%\Scripts\pip3.exe"
SET "PEGASUS_VENV_PYTHON=%PEGASUS_LOCATION_VENV%\Scripts\python.exe"
SET "PEGASUS_VENV_PIP=%PEGASUS_LOCATION_VENV%\Scripts\pip3.exe"
SET "PEGASUS_VENV_ACTIVATE=%PEGASUS_LOCATION_VENV%\Scripts\activate.bat"
SET "PEGASUS_VENV_DEACTIVATE=%PEGASUS_LOCATION_VENV%\Scripts\deactivate.bat"

@REM SET PEGASUS WINDOWS SERIVCE ENVIRONMENT VARIABLES
SET "PEGASUS_NSSM=%PEGASUS_LOCATION_SETUP%\nssm.exe"
SET "PEGASUS_SERVICE_PROGRAM=%PEGASUS_LOCATION_SETUP%\pegasus_service.bat"
SET "PEGASUS_SERVICE_NAME=pegasus"
SET "PEGASUS_SERVICE_DISPLAYNAME=Pegasus Call Watcher"
SET "PEGASUS_SERVICE_DESCRIPTION=Nurse call watcher and user interface."
SET "PEGASUS_LOCATION_SERVICE_LOGS=%PEGASUS_LOCATION%\logs"
SET "PEGASUS_LABEL_SERVICE_STDOUT=service.log"
SET "PEGASUS_LABEL_SERVICE_STDERR=service-error.log"

@REM SET PEGASUS DATABASE ENVIRONMENT VARIABLES
SET "PEGASUS_DB_NAME=pegasus.sqlite"
SET "PEGASUS_DB_TABLE_PREFIX=peg_"

@REM SET PEGASUS CALL WATCHER ENVIRONMENT VARIABLES
SET "PEGASUS_LOG_FILE_PREFIX=log"
SET "PEGASUS_LOG_FILE_SUFFIX=.txt"
SET "PEGASUS_CALL_STRING_PREFIX=Call Placed"
SET "PEGASUS_CALL_LOG_COLUMNS=7"
