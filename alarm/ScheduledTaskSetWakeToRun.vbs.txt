'  Name:    ScheduledTaskSetWakeToRun.vbs
'  Author:    Matthew Boyd (iboyd.net)
'  Date:    10/13/2010
'  Purpose:    Enables or disables the "Wake the computer to run this task" setting on Windows Vista and Windows 7 systems.
'        It seems that in order to do this successfully, both in the GUI or via this script,the task compatibility
'        mode must be set to "2.0" or else the setting gets reverted.
'  Usage:    cscript.exe ScheduledTaskSetWakeToRun.vbs "" [enable | disable]
'  Example:    cscript.exe ScheduledTaskSetWakeToRun.vbs "My Scheduled Task" enable
'        The command above would set "Wake the computer to run this task" to enabled.
 
Option Explicit
 
Const TASK_UPDATE = &H4
Const TASK_DONT_ADD_PRINCIPAL_ACE = &H10
 
Dim TaskName, EnableWakeToRun, objTaskService, objRootFolder, objTask, objDefinition
 
If Wscript.Arguments.Count < 1 Then
 Err.Raise 1, "Invalid command line arguments!"
Else
 TaskName = Wscript.Arguments.Item(0)
End If
 
Wscript.echo "Task Name: " & TaskName
If Wscript.Arguments.Count < 2 Then 'Set EnableWakeToRun to true by default if enable/disable was not specified.
 EnableWakeToRun = true
 wscript.echo "Action: ENABLE 'Wake the computer to run this task'"
ElseIf UCase(Wscript.Arguments.Item(1)) = "ENABLE" Then
 wscript.echo "Action: ENABLE 'Wake the computer to run this task'"
 EnableWakeToRun = true
Else
 wscript.echo "Action: DISABLE 'Wake the computer to run this task'"
 EnableWakeToRun = false
End If
 
Set objTaskService = CreateObject("Schedule.Service")
objTaskService.Connect
Set objRootFolder = objTaskService.GetFolder("\")
Set objTask = objRootFolder.GetTask ("\" & TaskName)
 
Set objDefinition = objTask.Definition
wscript.echo "Current WakeToRun Setting: " & CStr(objDefinition.Settings.WakeToRun)
wscript.echo "Current Compatibility Setting: " & objDefinition.Settings.Compatibility
wscript.echo "---"
objDefinition.Settings.WakeToRun = EnableWakeToRun
objDefinition.Settings.Compatibility = 2
objRootFolder.RegisterTaskDefinition objTask.Name, objDefinition, TASK_UPDATE or  TASK_DONT_ADD_PRINCIPAL_ACE, , , objDefinition.Principal.LogonType
 
Set objTaskService = CreateObject("Schedule.Service")
objTaskService.Connect
Set objRootFolder = objTaskService.GetFolder("\")
Set objTask = objRootFolder.GetTask (TaskName)
wscript.echo "New WakeToRun Setting: " & CStr(objTask.Definition.Settings.WakeToRun)
wscript.echo "New Compatibility Setting: " & objDefinition.Settings.Compatibility