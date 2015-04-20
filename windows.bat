@echo off

echo.
echo *** Registry Backup ***
echo.

echo * Explorer.hiv
reg save "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" %~dp0/backup/Explorer.hiv /y
call :error_check

echo * MediaPlayer.hiv
reg save "HKCU\Software\Microsoft\MediaPlayer\Preferences" %~dp0/backup/MediaPlayer.hiv /y
call :error_check

echo * Keyboard.hiv
reg save "HKCU\Control Panel\Keyboard" %~dp0/backup/Keyboard.hiv /y
call :error_check

echo * Mouse.hiv
reg save "HKCU\Control Panel\Mouse" %~dp0/backup/Mouse.hiv /y
call :error_check

echo * KeyboardLayout.hiv
reg save "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" %~dp0/backup/KeyboardLayout.hiv /y
call :error_check

echo.
echo *** Registry Customize ***
echo.

echo * Show extention
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f

echo * Show all folder, file and drive
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f

echo * Disable showing junp-list-history
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f

echo * Disable Windows Media Player music history
reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "DisableMRUMusic" /t REG_DWORD /d "1" /f

echo * Disable Windows Media Player pictures history
reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "DisableMRUPictures" /t REG_DWORD /d "1" /f

echo * Disable Windows Media Player playlists history
reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "DisableMRUPlaylists" /t REG_DWORD /d "1" /f

echo * Disable Windows Media Player video history
reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "DisableMRUVideo" /t REG_DWORD /d "1" /f

echo * Keyboard speed up
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f

echo * Mouse speed up
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "12" /f

echo.
pause

:select
cls
echo *** Keyboard Layout Customize ***
echo.
echo ====== Select your keyboard ======
echo  A: Windows Keyboard
echo     * Replace CapsLock to Esc
echo  B: Mac Keyboard
echo     * Replace Control to Esc
echo     * Replace CapsLock to Control
echo ==================================
set KEYBOARD_LAYOUT=
set /p KEYBOARD_LAYOUT="Press 'A' or 'B': "
if not "%KEYBOARD_LAYOUT%"=="" set KEYBOARD_LAYOUT=%KEYBOARD_LAYOUT:~0,1%
if "%KEYBOARD_LAYOUT%"=="A" goto confirm
if "%KEYBOARD_LAYOUT%"=="a" goto confirm
if "%KEYBOARD_LAYOUT%"=="B" goto confirm
if "%KEYBOARD_LAYOUT%"=="b" goto confirm
goto select

:confirm
echo.
echo Your keyboard is really type '%KEYBOARD_LAYOUT%'?
set CONFIRM=
set /p CONFIRM="Press 'Y' or 'N': "
if not "%CONFIRM%"=="" set CONFIRM=%CONFIRM:~0,1%
if "%CONFIRM%"=="Y" goto replace
if "%CONFIRM%"=="y" goto replace
if "%CONFIRM%"=="N" goto select
if "%CONFIRM%"=="n" goto select
goto confirm

:replace
if "%KEYBOARD_LAYOUT%"=="A" goto replace_impl_a
if "%KEYBOARD_LAYOUT%"=="a" goto replace_impl_a
if "%KEYBOARD_LAYOUT%"=="B" goto replace_impl_b
if "%KEYBOARD_LAYOUT%"=="b" goto replace_impl_b

:replace_impl_a
echo.
echo * Replace CapsLock to Esc
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d "00000000000000000200000001003A0000000000" /f
goto ps

:replace_impl_b
echo.
echo * Replace Control to Esc
echo * Replace CapsLock to Control
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d "0000000000000000030000001D003A0001001D0000000000" /f
goto ps

:ps
powershell -NoProfile -ExecutionPolicy Unrestricted "%~dp0/windows.ps1"

pause
exit

:error_check
echo %errorlevel%
if not %errorlevel%=="0" (
  echo Failed to save registry file
  echo Are you administrator?
  echo Aborting...
  pause
  exit
)
exit /b

