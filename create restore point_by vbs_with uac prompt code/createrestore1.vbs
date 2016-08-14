Option Explicit
'-> Varibles
Dim Chk1, Chk2, Chk3, CSRP, RP, SRName, SRP
'-> Get User Input
 SRName = InputBox("Type in the name for the SystemRestore.")
'-> Checks Input Then Starts The Restore Process
  If SRName = "" Then 'Cancel Reply
   Chk1 = True
  ElseIf Len(SRName) = 0 Then 'Ok Was Pushed But Nothing In The Inputbox
   Chk1 = True
  ElseIf Len(SRName) > 3 Then 'Make Sure There At Least 3 Characters
  '-> Make The Restore Point
   Set SRP = GetObject("winmgmts:\\.\root\default:Systemrestore")
   CSRP = SRP.createrestorepoint(SRName, 0, 100)
  '-> Check To See If It Was Created
   Set SRP = GetObject("winmgmts:root/default").InstancesOf ("SystemRestore")
        For Each RP In SRP
         If InStr(RP.Description,SRName) Then
          Chk1 = False
          Chk2 = False
          Chk3 = True
         End If
        Next
   Else 'Less The 3 Characters
        Chk2 = True
  End If
'-> Report Back
  If Chk1 = True Then 
   Msgbox "There Was No User Input Cannot Create Restore Point", 4128, "Error No Input" 
   WScript.Quit(0)
  End If
  If Chk2 = True Then 
   Msgbox "There Needs To Be 3 Charters For It To Be Valid", 4128, "Not Valid" 
   WScript.Quit(0)
  End If  
  If Chk3 = True Then 
   Msgbox "The New System Restore Point Has Been Created", 4128, "Confirm Restore Point" 
  Else
   Msgbox vbtab & "Error Unknown" & vbCrLf & "System Restore Point Not Created", 4128, "Error Unknown" 
  End If