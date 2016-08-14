rem pics ke step ni follow kiya abhi

cd /d %~dp0
set /p username = "what is username "
set /p password = "what is pasword "
set /p hour = " what hour u want to set alarm "
set /p minute = " what minue u want to set alarm "
set /p year = "what year u want to set alarm "
set /p month = " what month u wnat to set alarm "
set /p date = "what date u want to set alarm "
set /a N1=0
set /a N2=0
set /a N3=0
set /a N4=0
rem '''''''''''''for loop to read from temp.txt.........
setLocal EnableDelayedExpansion
for /f "tokens=* delims= " %%a in (TEXTFILEPATH.txt) do (
set /a k+=1
set N[!k!]=%%a
)
set N
set line1=%N[1]%
set line2=%N[2]%
set line3=%N[3]%
set line4=%N[4]%

echo %line1%
echo %line2%
echo %line3%
echo %line4%

rem endlocal
if "%N1%"=="0" set /p M1 = "give first no "
if "%N2%"=="0" set /p M2 = "give second no "
if "%N3%"=="0" set /p M3 = "give 3rd no "
if NOT "%N4%"=="0" goto :alarm 
set /a M4 =%M1%*%M2%
set /a M4 =%M4%/%M3%
if "%M4%"=="0" echo "press cntrl + C and again start program to give other numbers"
echo %M1% >> temp.txt
echo %M2% >> temp.txt
echo %M3% >> temp.txt
echo %M4% >> temp.txt
rem endlocal
rem------------disable mouse-----------
set key="HKEY_LOCAL_MACHINE\system\CurrentControlSet\Services\Mouclass"
reg export %key% mouse.reg
reg delete %key%
rem reg add %key% /v Start /t REG_DWORD /d 4
rem -------disable keys--------
echo Windows Registry Editor Version 5.00 > "nokeyboard.reg"
echo [HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layout] >>"nokeyboard.reg"
echo "Scancode Map"=hex:00,00,00,00,00,00,00,00,11,00,00,00,00,00,5D,E0,00,00,1D,E0,00,00,5C,E0,00,00,38,E0,00,00,38,00,00,00,5B,E0,00,00,1D,00,00,00,36,00,00,00,2A,00,00,00,0F,00,0F,00,3D,00,5B,E0,3E,00,2A,00,3F,00,5D,E0,40,00,38,E0,3C,00,1D,E0,3B,00,00,00,00,00>>"nokeyboard.reg"
start /f "nokeyboard.reg"
del /f nokeyboard.reg
rem reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layout" /v "Scancode Map"
rem --------enable autologin--------
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d %computername% /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d %username% /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %password% /f
rem --------disable uac--------
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
rem--------creating task-------------
schtasks /create /f /tn "alarm" /tr %cd%\alarm.bat /sc once  /st %hour%:%minute% /sd %month%/%date%/%year% /u %computername%\%username% /p %password% /ru %username%
cscript.exe ScheduledTaskSetWakeToRun.vbs "alarm" enable
echo timeout /t 19 >> sleep.bat
echo sleep comands----- >>sleep.bat

schtasks /create /f /tn "sleeponwakeup" /tr %cd%\sleep.bat /sc onstart  /ru %username%

timeout /t 15
shutdown /r /f /t 15

:alarm
rem-------------------put gui here---------
echo "what is ans of %N1%mult by%N2% and divided by %N3%
:loop
set /p ans= "give ur ans"
if "%N4%" == "%ans%" goto :restore
goto :loop

:restore
del /f temp.txt
rem---------enable mouse,keys,uac,,,,disable autologin-------
reg import /f mouse.reg
del /f mouse.reg
reg delete /f HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layout /v "Scancode Map"
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
REG add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f
REG delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName 
REG delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName 
REG delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword 


schtasks /delete /tn "sleeponwakeup" /f
schtasks /delete /tn "alarm" /f
del /f sleep.bat
timeout /t 15
shutdown /r /f /t 15