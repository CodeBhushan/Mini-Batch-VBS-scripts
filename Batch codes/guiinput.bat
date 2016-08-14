rem @echo off
REM Input routine for batch using VBScript to provide input box
REM Stephen Knight, October 2009, http://www.dragon-it.co.uk/

call :inputbox "Please enter something for me:" "Box Title" input
echo You entered %Input%
echo %input%
pause


:InputBox
rem set input=
set %3 =
set heading=%~2
set message=%~1
echo wscript.echo inputbox(WScript.Arguments(0),WScript.Arguments(1)) >"%temp%\input1.vbs"
for /f "tokens=* delims=" %%a in ('cscript //nologo "%temp%\input1.vbs" "%message%" "%heading%"') do set %3=%%a
rem exit /b
pause
goto :EOF
rem not working echo %%3%
