set SRP = getobject("winmgmts:\\.\root\default:Systemrestore")
CSRP = SRP/createrestorepoint ("Restore Point Created", 0, 100)
if CSRP <> 0 then

Msgbox "Error " & CSRP & ": Unable to create System Restore point"

End If