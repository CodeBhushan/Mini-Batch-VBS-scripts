Dim objShell 
Dim objFile, strDir, strExt, strUpdate 
Set objShell = WScript.CreateObject( "WScript.Shell" ) 
Const ForAppending = 8 
Const ForReading = 1 


strComputer = "." 
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2") 

Set colEvents = objWMIService.ExecNotificationQuery _ 
          ("Select * From __InstanceOperationEvent Within 10 Where " _ 
		& "TargetInstance isa 'Win32_LogicalDisk'") 

Do While True 
      Set objEvent = colEvents.NextEvent 
      If objEvent.TargetInstance.DriveType = 2 Then 
	Select Case objEvent.Path_.Class 
	  Case "__InstanceCreationEvent" 
		Wscript.Echo "Flash Drive" & objEvent.TargetInstance.DeviceId & _  
                      "has been added." 

strDir = ("C:\") 


set objFSO = CreateObject("Scripting.FileSystemObject") 
strExt = "Flash_Drive_Log" 
strUpdate = "Flash Drive Detected on System: " & Now 

set objFile = objFSO.OpenTextFile(strDir & strExt & ".txt", ForAppending, True) 
objFile.WriteLine strUpdate 
objFile.Close 

'get label name 
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2") 
Set colItems = objWMIService.ExecQuery _ 
    ("Select * From Win32_LogicalDisk Where DeviceID = 'J:'") 

For Each objItem in colItems 
     'Wscript.Echo objItem.VolumeName 
If objItem.VolumeName = "DECENCY" Then 
'MsgBox"Correct Flash Drive Inserted" 
objShell.Run("""c:\Users\ravi\desktop\backups.bat""") 
'Set objShell = Nothing 
Else 
MsgBox"Incorrect Backup Drive, No backup will be performed!", vbExclamation 
End If 
Next 

        Case "__InstanceDeletionEvent" 
            Wscript.Echo "Drive " & objEvent.TargetInstance.DeviceId & _ 
               " has been removed." 
      End Select 
  End If 
Loop 