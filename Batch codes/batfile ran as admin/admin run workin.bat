rem if this file is run by doubleclick, uac prompt will come,,,, if run as administrator, uac prompt wont' come

if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof
pause
:payload
    echo %~nx0: running payload with parameters:
    echo %*
    echo ---------------------------------------------------
    cd /d %2
    shift
    shift
    rem put your code here
pause
rem net user ravi 147369147369
start alarm.M3U
pause
    rem e.g.: perl myscript.pl %1 %2 %3 %4 %5 %6 %7 %8 %9
goto :eof
pause