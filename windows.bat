@echo off

echo.
echo *** Registry Backup ***
echo.

echo * Explorer.reg
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" backup/Explorer.reg /y

echo * MediaPlayer.reg
reg export "HKCU\Software\Microsoft\MediaPlayer\Preferences" backup/MediaPlayer.reg /y

echo * Keyboard.reg
reg export "HKCU\Control Panel\Keyboard" backup/Keyboard.reg /y

echo * Mouse.reg
reg export "HKCU\Control Panel\Mouse" backup/Mouse.reg /y

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

powershell -NoProfile -ExecutionPolicy Unrestricted ./windows.ps1

pause
exit

