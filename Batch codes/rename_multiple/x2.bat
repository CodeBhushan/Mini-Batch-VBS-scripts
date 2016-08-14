@echo off
rem call x3.BAT
set /a counter=%counter%+13

rem ren %1 i_love_u_u%counter%.jpg


rem ren %1 i_love_u_u%counter%.%~x1
rem ren %~f1 i_love_u_u%counter%

ren %~f1 i_love_u_u%counter%.%~x1


rem ren %1 i_love_u_%counter%