

set /a counter=00
 rem for /D %%k  in (%cd%\*) do rename "%%k" "%%~nxk_iloveuuuuuu"
for /D %%k  in (%cd%\*) do call x2.BAT %%~sk
 for %%f in (*)  do call X2.BAT %%f


rem cd should not have space in its name

rem for /D %f  in (%~dp0\*) do rename "%f" "%~nxf_ilove"
rem for /D %%f in (C:\path\to\Workspace where's folders'\name\u\wana\change\*) do rename "%%f" "%%~nxf_ilove"
rem rename *.jpg 1_*
rem rename * 2_*_3
rem rename h?pe.txt hope.txt
rem ren *.txt *.html

rem for %%f in (*.jpg)  do call X2.BAT %%f
