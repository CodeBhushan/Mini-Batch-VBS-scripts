REM we need to minimize window to notification area   http://blogs.technet.com/b/csps/archive/2011/06/15/regminimizetonotificationarea.aspx

REM You can't send keys directly from a batch file, instead you can create a VB script to send the keys and call this script from a .bat file    REM http://stackoverflow.com/questions/22836457/how-to-make-a-batch-file-to-run-a-hotkey


REM u need to fix cmd.exe always on top by 3rd party software then only it can recieve key press at anytime(then also it wont take keypress)  or u can create a batch script to minimize window, and REM create script's shortcut with hot key

:one1
echo a
choice /c zwxcd /n /t 19 /d d /m "MOVE with zwxcd"

REM The /t switch is the timeout in seconds, in this it is 5 seconds.The /d switch is the default option, use this to automatically make a choice if the command times REM out. In this case d will be the time out choice, which will exit the script.


IF %errorlevel%==1 goto :vlcontop
IF %errorlevel%==2 goto :CONTINUE
IF %errorlevel%==3 powershell -command "& { $x = New-Object -ComObject Shell.Application; $x.minimizeall() }"
IF %errorlevel%==4 goto :minimizeexceptactivewin
IF %errorlevel%==5 pause >nul
goto one1
pause


:vlcontop
@ECHO OFF
@ECHO.
@ECHO Running script to switch between two windows
@ECHO.

CScript //nologo Switch2vlcnplay.vbs

@ECHO.
@ECHO Script completed.
@ECHO.

pause

goto :one1
:minimizeexceptactivewin
:: change current command prompt window title
title my-cmd-console

:: minimize all open windows on the desktop with powershell command
powershell -command "& { $x = New-Object -ComObject Shell.Application; $x.minimizeall()  }"

:: bring console back to the front with nircmd.exe command 'win activate [filter window by title]' 
nircmd.exe win activate title "my-cmd-console" 
pause

:CONTINUE
echo You chose w
nircmd sendkeypress rwin+home
REM Continue code
goto start
pause >nul

goto :one1

:start

choice /c:HPKM /n /m "Move with arrow keys,arrow key not working"


IF %errorlevel%==1 echo 
IF %errorlevel%==2 goto :CONTINUE
IF %errorlevel%==3 echo You chose s    goto one1
IF %errorlevel%==4 exit >nul
goto one1