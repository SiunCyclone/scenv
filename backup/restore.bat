@echo off

echo.
echo *** Registry Restore ***
echo.

echo * Explorer.hiv
reg restore "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" %~dp0/Explorer.hiv

echo * MediaPlayer.hiv
reg restore "HKCU\Software\Microsoft\MediaPlayer\Preferences" %~dp0/MediaPlayer.hiv

echo * Keyboard.hiv
reg restore "HKCU\Control Panel\Keyboard" %~dp0/Keyboard.hiv

echo * Mouse.hiv
reg restore "HKCU\Control Panel\Mouse" %~dp0/Mouse.hiv

echo * KeyboardLayout.hiv
reg restore "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" %~dp0/KeyboardLayout.hiv

pause
exit

