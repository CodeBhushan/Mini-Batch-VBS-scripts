rem onetime running scheduled task  http://technet.microsoft.com/en-us/library/cc772785(v=ws.10).aspx#BKMK_run

schtasks /create /tn "My App" /tr C:\Users\ravi\Desktop\adminwork.bat /sc once  /st 19:08 /sd 06/30/2013 /ru ravi
rem if we use /ru system     or /ru Administrator  then this task will be created then only if this bat file is run as administrator
schtasks /run /tn "My App"  
rem this bat file also couldn't make adminwork bat file without uac prompt






For complex tasks it is easier to create the task in the GUI, export it as XML and then on the command line use SCHTASKS /CREATE /tn TaskName /XML xmlfile.

The event triggers in the GUI you likely want are listed as "At log on" and "On workstation unlock".