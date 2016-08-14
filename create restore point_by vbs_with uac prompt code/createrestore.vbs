Set IRP = getobject("winmgmts:\\.\root\default:Systemrestore")
 var a=IRP.createrestorepoint ("YOUR USERNAME Restore Point", 0, 100)