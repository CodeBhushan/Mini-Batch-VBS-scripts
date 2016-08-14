' Creates a SR point during the first startup of the day
' December 18, 2005
' For Windows® XP
' © 2005 Ramesh Srinivasan
' Website: http://windowsxp.mvps.org
'put this file in startup folder..............

Option Explicit
Dim SRP, CSRP, objWMI, clsPoint
Dim RPDate, D1, D2, dtmInstallDate, DMatch
DMatch = 0
Set SRP = getobject("winmgmts:\\.\root\default:Systemrestore")
Set dtmInstallDate = CreateObject("WbemScripting.SWbemDateTime")
Set objWMI = getobject( _
    "winmgmts:\\.\root\default").InstancesOf ("systemrestore")
For Each clsPoint In objWMI
    RPDate = getmytime(clsPoint.creationtime)
    D1 = Month(RPDate) & "/" & Day(RPDate) & "/" & Year(RPDate)
    D2 = Month(Date) & "/" & Day(Date) & "/" & Year(Date)
    If D1 = D2 Then DMatch = 1
Next

Function getmytime(wmitime)
    dtmInstallDate.Value = wmitime
    getmytime = dtmInstallDate.GetVarDate
end Function

If DMatch = 0 Then
    CSRP = SRP.createrestorepoint ("Daily Restore Point", 0, 100)
End If