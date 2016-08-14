'vlc window shouldn't be minimized(otherwise it wont work), it can be in  behind
' Define the titles to look for
'gTitle1		= "Goog
gTitle1		= "VLC media player"

gSecondsToWait	= 10
count=0
zero=0

' Create scripting object
Dim WShell, lRunUninstall
Set WShell = CreateObject("WScript.Shell")

Do
	' Activate the window that has a title matching, starting, or ending with gTitle1.
	bWindowFound = WShell.AppActivate(gTitle1)
'WScript.Echo "f"
	' Check if we activated the window ?
'Msgbox bWindowFound
	If(Not bWindowFound ) Then
If(count = 0) Then


		
		WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}"

		
End If
If(count = 1) Then


	WShell.SendKeys "%{TAB}"
		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}"

End If
If(count = 2) Then

WShell.SendKeys "%{TAB}{TAB}"
		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}{TAB}"
End If
If(count = 3) Then

	WShell.SendKeys "%{TAB}{TAB}{TAB}"

		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}"


End If
If(count = 4) Then

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}"

		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}"


End If
If(count = 5) Then

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}"

		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}"


End If
If(count = 6) Then

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}"

		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}"


End If

If(count = 7) Then

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}"

		
WScript.Sleep (gSecondsToWait * 1000)

	WShell.SendKeys "%{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}"


End If
WScript.Sleep (gSecondsToWait * 1000)
count=count+1
	End If





If(bWindowFound) Then

bWindowFound= Not bWindowFound
'Msgbox bWindowFound
WShell.SendKeys " "
End If

Loop Until Not bWindowFound

' Completed. Stop the script
'WScript.Echo "Quitting script"
Set WShell = Nothing
WScript.quit(0)