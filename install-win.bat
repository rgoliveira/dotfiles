@ECHO OFF
::Test If script has Admin Priviledges/is elevated
:: see http://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
net session >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO You need to run this with elevated rights...
    PAUSE
    EXIT /B 1
)

set dothome=%~dp0

:::::::::::::::
:: ViM Setup ::
:::::::::::::::
echo ViM dotfiles setup in progress...

set vimdir=%dothome%\vim

:: cleanup
echo   - Cleaning up old files/links (if exist)...
del   /Q /S %USERPROFILE%\_vimrc    >nul 2>&1
del   /Q /S %USERPROFILE%\_gvimrc   >nul 2>&1
rmdir /Q /S %USERPROFILE%\vimfiles  >nul 2>&1

:: set soft links
echo   - Creating new links...
mklink    %USERPROFILE%\_vimrc    %vimdir%\.vimrc   >nul 2>&1
mklink    %USERPROFILE%\_gvimrc   %vimdir%\.gvimrc  >nul 2>&1
mklink /D %USERPROFILE%\vimfiles  %vimdir%\.vim     >nul 2>&1
:: nvim files
mklink /D %USERPROFILE%\AppData\Local\nvim          %vimdir%\.vim     >nul 2>&1
mklink    %USERPROFILE%\AppData\Local\nvim\init.vim %vimdir%\.vimrc   >nul 2>&1

:: set context menu for folders
echo.
ver>nul
if %errorlevel% EQU 0 (
  choice /m "Want to add 'Open ViM here' context menu entries for folders?" /c YN
  IF ERRORLEVEL 2 goto :ctxNope
  IF ERRORLEVEL 1 cmd /c %dothome%\win_register-context-options.reg
)
:ctxNope

:::::::::::::::::
:: Emacs Setup ::
:::::::::::::::::
:: disabled
::
REM echo Emacs dotfiles setup in progress...

REM set emacsdir=%dothome%\vim

REM :: cleanup
REM echo   - Cleaning up old files/links (if exist)...
REM del /Q /S %USERPROFILE%\.emacs.d    >nul 2>&1
REM del /Q /S %USERPROFILE%\.emacs      >nul 2>&1
REM :: set up emacs home via user environment variable
REM setx HOME %USERPROFILE% >nul 2>&1

REM echo   - Creating new links...
REM mklink    %USERPROFILE%\.emacs    %emacsdir%\.emacs   >nul 2>&1
REM mklink /D %USERPROFILE%\.emacs.d  %emacsdir%\.emacs.d >nul 2>&1

:::::::::
:: fin ::
:::::::::
echo.
echo Done!
echo.
pause

exit /b 0

