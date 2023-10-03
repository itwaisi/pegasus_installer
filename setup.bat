@ECHO OFF

@REM CLEAR COMMAND PROMPT SCREEN
CALL CLS

@REM SET PEGASUS SETUP LOCATION ENVIRONMENT VARIABLE
SET "PEGASUS_LOCATION_SETUP=%~dp0"
IF %PEGASUS_LOCATION_SETUP:~-1%==\ SET PEGASUS_LOCATION_SETUP=%PEGASUS_LOCATION_SETUP:~0,-1%

@REM SET ALL ENVIRONMENT VARIABLES
CALL %PEGASUS_LOCATION_SETUP%\env_usr.bat
CALL %PEGASUS_LOCATION_SETUP%\env_sys.bat

@REM CHECK IF ADMINISTRATOR MODE IS ACTIVE FOR COMMAND PROMPT
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Please Start in Windows Explorer And Run As Administrator
    PAUSE
    EXIT /B 5
)

@REM DEACTIVATE PYTHON VIRTUAL ENVIRONMENT
IF EXIST "%PEGASUS_VENV_DEACTIVATE%" (
    CALL %PEGASUS_VENV_DEACTIVATE%
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Deactivating Pegasus Virtual Environment
)

@REM REMOVE PREVIOUSLY INSTALLED PEGASUS DIRECTORY
IF EXIST "%PEGASUS_LOCATION%" (
    ECHO.
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Do you want to remove previously installed version of Pegasus?
    CALL RMDIR /S %PEGASUS_LOCATION%
    ECHO.
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Previously Installed Pegasus Has Been Removed
)


@REM CREATE PEGASUS PACKAGE DIRECTORIES
CALL MKDIR %PEGASUS_LOCATION%

@REM DOWNLOAD GITHUB PACKAGE: SKIP IF DEBUG VARIABLE IS SET
IF [%PEGASUS_DBG_DOWNLOAD%] NEQ [] (
    @REM DOWNLOAD PEGASUS FROM GITHUB
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Downloading Pegasus
    CD %PEGASUS_LOCATION%
    git clone https://%PEGASUS_GITHUB_PAT%@github.com/itwaisi/pegasus.git .
) ELSE (
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: DEBUG :: Skip Downloading Package From Github
)

@REM CREATE PYTHON VIRTUAL ENVIRONMENT
IF NOT EXIST "%PEGASUS_VENV_ACTIVATE%" (
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Creating Pegasus Virtual Environment
    CALL %PEGASUS_PYTHON% -m venv %PEGASUS_LOCATION_VENV%
)

@REM ACTIVATE PYTHON VIRTUAL ENVIRONMENT
ECHO [%PEGASUS_LABEL_PROGRAM%] :: Activating Pegasus Virtual Environment
CALL %PEGASUS_VENV_ACTIVATE%

@REM CREATE LOG DIRECTORY
CALL MKDIR %PEGASUS_LOCATION_SERVICE_LOGS%

@REM INSTALL REQUIRED PYTHON PACKAGES: SKIP IF DEBUG VARIABLE IS SET
IF [%PEGASUS_DBG_PIP_INSTALL%] NEQ [] (
    ECHO.
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Installing Pegasus
    ECHO.
    CALL %PEGASUS_VENV_PIP% install -r %PEGASUS_LOCATION%\requirements.txt
    ECHO.
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Pegasus Installed
) ELSE (
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: DEBUG :: Skip Installing Required Python Packages
)

@REM CREATE WINDOWS SERVICE: SKIP IF DEBUG VARIABLE IS SET
IF [%PEGASUS_DBG_CREATE_SERVICE%] NEQ [] (
    @REM STOP AND REMOVE THE CURRENT PEGASUS WINDOWS SERVICE
    ECHO.
    SC QUERY %PEGASUS_SERVICE_NAME% >NUL 2>&1
    IF %ERRORLEVEL% NEQ 0 (
        CALL %PEGASUS_NSSM% stop %PEGASUS_SERVICE_NAME%
        CALL %PEGASUS_NSSM% remove %PEGASUS_SERVICE_NAME% confirm
    )

    @REM INSTALL AND START THE NEW PEGASUS WINDOWS SERVICE
    CALL %PEGASUS_NSSM% install %PEGASUS_SERVICE_NAME% %PEGASUS_SERVICE_PROGRAM%
    CALL %PEGASUS_NSSM% set %PEGASUS_SERVICE_NAME% AppStdout %PEGASUS_LOCATION_SERVICE_LOGS%\%PEGASUS_LABEL_SERVICE_STDOUT%
    CALL %PEGASUS_NSSM% set %PEGASUS_SERVICE_NAME% AppStderr %PEGASUS_LOCATION_SERVICE_LOGS%\%PEGASUS_LABEL_SERVICE_STDERR%
    CALL %PEGASUS_NSSM% set %PEGASUS_SERVICE_NAME% DisplayName %PEGASUS_SERVICE_DISPLAYNAME%
    CALL %PEGASUS_NSSM% set %PEGASUS_SERVICE_NAME% Description %PEGASUS_SERVICE_DESCRIPTION%
    CALL %PEGASUS_NSSM% set %PEGASUS_SERVICE_NAME% AppEnvironmentExtra PEGASUS_LOCATION_SETUP=%PEGASUS_LOCATION_SETUP%
    CALL %PEGASUS_NSSM% start %PEGASUS_SERVICE_NAME%
    ECHO.

    ECHO [%PEGASUS_LABEL_PROGRAM%] :: Pegasus Service Started
) ELSE (
    ECHO [%PEGASUS_LABEL_PROGRAM%] :: DEBUG :: Skip Creating Windows Service, Then Start Call Watcher
    CALL %PEGASUS_VENV_PYTHON% %PEGASUS_LOCATION%\main.py
)
