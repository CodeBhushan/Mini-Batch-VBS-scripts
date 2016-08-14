Logo = "C:\Users\ravi\Desktop\sample.PNG"
Set objEmail          = CreateObject("CDO.Message")
objEmail.From       = "rvbhushan18@gmail.com"
objEmail.To           = "dilrajsingh17@gmail.com"
objEmail.Subject    = "TEST E-Mail Script" & vbTab & Now()
objEmail.Textbody = "TEST E-Mail Script" & vbTab & Now()
objEmail.AddAttachment "C:\a.txt"    
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com" 
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername")="rvbhushan18@gmail.com" 
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword")="OmMataPitaNamastay"

objEmail.Configuration.Fields.Update
objEmail.Send

Wscript.Echo "DONE"
Wscript.Quit