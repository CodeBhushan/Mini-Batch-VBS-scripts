@echo off 
:: variables 
set drive=J: 
set backupcmd=xcopy /s /c /d /e /h /i /r /y 
echo Backup in progress... 
%backupcmd% "%USERPROFILE%\Desktop\temp" "%drive%TEMP MISC\" 
echo Your Backup is Complete! 
@pause