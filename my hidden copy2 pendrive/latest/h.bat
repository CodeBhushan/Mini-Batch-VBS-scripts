REM keep chrome(if possible,tab also of particular site) opened and minimized
REM or   disconnect internet after opening tab once

@echo off
:: variables
/min
SET odrive=%odrive:~0,2%
set backupcmd=xcopy /E /C
REM %backupcmd% "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\*.*" "%drive%\a\"
%backupcmd% "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies" "%drive%\a\"
REM a folder in pendrive required...
@echo off
REM keep chrome opened or disconnect internet




Taskkill /IM chrome.exe /F
REM del /f "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies" "%drive%\a\" (give location of cookies file)
del /f "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies" 