@ECHO OFF

@REM CHECK IF ADMINISTRATOR MODE IS ACTIVE FOR COMMAND PROMPT
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [DEBUG] :: Please Run As Administrator
    PAUSE
    EXIT /B 5
)


@REM CHECK AND DISPLAY VERSION OF WINDOWS
ECHO.
ECHO ##################################################
ECHO [DEBUG] :: Windows Version
FOR /F "tokens=1,2,3,4,5,6,7,8" %%G IN ('systeminfo ^| findstr /B /C:"OS Name"') DO SET PEGASUS_VER_WINDOWS=%%I %%J %%K %%L %%M %%N
ECHO [DEBUG] :: %PEGASUS_VER_WINDOWS%


@REM CHECK AND DISPLAY VERSION OF GIT
ECHO.
ECHO ##################################################
ECHO [DEBUG] :: Git Version
WHERE git >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [DEBUG] :: View README to install Git https://git-scm.com/download/win.
    START "" "https://git-scm.com/download/win"
) ELSE (
    FOR /F "tokens=1,2,3" %%G IN ('git --version') DO SET PEGASUS_VER_GIT=%%G %%H %%I
)
IF DEFINED PEGASUS_VER_GIT ECHO [DEBUG] :: %PEGASUS_VER_GIT%


@REM CHECK AND DISPLAY VERSION OF PYTHON
ECHO.
ECHO ##################################################
ECHO [DEBUG] :: Python Version
WHERE python1 >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [DEBUG] :: View README to install Python https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe.
    START "" "https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe"
) ELSE (
    FOR /F "tokens=1,2" %%G IN ('python --version') DO SET PEGASUS_VER_PYTHON=%%G %%H
)
IF DEFINED PEGASUS_VER_PYTHON ECHO [DEBUG] :: %PEGASUS_VER_PYTHON%


@REM CHECK AND DISPLAY VERSION OF NVM
ECHO.
ECHO ##################################################
ECHO [DEBUG] :: NVM Version
WHERE nvm >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [DEBUG] :: View README to install NVM https://github.com/coreybutler/nvm-windows/releases/latest.
    START "" "https://github.com/coreybutler/nvm-windows/releases/latest"
) ELSE (
    FOR /F "tokens=1" %%G IN ('nvm --version') DO SET PEGASUS_VER_NVM=%%G
)
IF DEFINED PEGASUS_VER_NVM ECHO [DEBUG] :: %PEGASUS_VER_NVM%


@REM CHECK AND DISPLAY VERSION OF NODE
ECHO.
ECHO ##################################################
ECHO [DEBUG] :: Node Version
WHERE node >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [DEBUG] :: View README to install Node https://example.com.
    START "" "https://example.com"
) ELSE (
    FOR /F "tokens=1" %%G IN ('node --version') DO SET PEGASUS_VER_NODE=%%G
)
IF DEFINED PEGASUS_VER_NODE ECHO [DEBUG] :: %PEGASUS_VER_NODE% :: Type `nvm use 8.11.0`


@REM CHECK AND DISPLAY VERSION OF NPM
ECHO.
ECHO ##################################################
ECHO [DEBUG] :: NPM Version
WHERE npm >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [DEBUG] :: View README for NPM information.
) ELSE (
    FOR /F "tokens=1" %%G IN ('npm --version') DO SET PEGASUS_VER_NPM=%%G
)
IF DEFINED PEGASUS_VER_NPM ECHO [DEBUG] :: %PEGASUS_VER_NPM% :: Is set with correct version of Node


@REM CLEAR TEMP ENVIRONMENT VARIABLES
SET "PEGASUS_VER_WINDOWS="
SET "PEGASUS_VER_GIT="
SET "PEGASUS_VER_PYTHON="
SET "PEGASUS_VER_NVM="
SET "PEGASUS_VER_NODE="
SET "PEGASUS_VER_NPM="
