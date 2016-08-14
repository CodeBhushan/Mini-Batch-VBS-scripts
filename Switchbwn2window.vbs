' Define the titles to look for
'gTitle1		= "Google - Mozilla Firefox"
gTitle1		= "VLC media player"
'gTitle2		= "Bing - Mozilla Firefox"
'gTitle2		= "Computer Management" ' <-- Window 2
gTitle2		= "Switchbwn2window - Notepad"
gSecondsToWait	= 5

' If one of the window closes, this variable becomes False and the script exits.
Dim bWindowFound

' Create scripting object
Dim WShell, lRunUninstall
Set WShell = CreateObject("WScript.Shell")

Do
	' Activate the window that has a title matching, starting, or ending with gTitle1.
	bWindowFound = WShell.AppActivate(gTitle1)
'WScript.Echo "f"
	' Check if we activated the window ?
	If(bWindowFound) Then

		' Send ALT+SPACEBAR (system menu) M (move) ESCAPE (cancel) to activate window.
'		'WShell.SendKeys "% M{ESCAPE}"

		' Wait 60 seconds
		WScript.Sleep (gSecondsToWait * 1000)

		' You can either send ALT+TAB and then wait 60 seconds, or activate the other window
		WShell.SendKeys "%{TAB}"

		' Switch to the other window
		bWindowFound = WShell.AppActivate(gTitle2)
		If(bWindowFound) Then

'WScript.Echo "f"
			' Send ALT+SPACEBAR (system menu) M (move) ESCAPE (cancel) to activate window.
			''WShell.SendKeys "% M{ESCAPE}"
WShell.SendKeys "%{TAB}"

			' Wait 60 seconds
			WScript.Sleep (gSecondsToWait * 1000)
		End If
	End If

Loop Until Not bWindowFound

' Completed. Stop the script
WScript.Echo "Quitting script"
Set WShell = Nothing
WScript.quit(0)