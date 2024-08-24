@echo on
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

:: UFDEV Install bacth file
SET /p pdir=Enter the root directory without trailing slash
echo %pdir%/ufdev
echo I thisd correct? If not  abort ctrl-c
pause
setx /m MATLABPATH "%pdir%\ufdev\Project\matlab\latex;%pdir%\UFDEV\Project\matlab\MPS\common;%pdir%\UFDEV\Project\matlab\MPS;%pdir%\UFDEV\Project\matlab\MPS\main"
SET
pause