@ECHO OFF

@REM SET ALL ENVIRONMENT VARIABLES
CALL %PEGASUS_LOCATION_SETUP%\env_usr.bat
CALL %PEGASUS_LOCATION_SETUP%\env_sys.bat

@REM LAUNCH WITH WINDOWS SERVICE TO START CALL WATCHER
CALL %PEGASUS_VENV_PYTHON% %PEGASUS_LOCATION%\main.py
