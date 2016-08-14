@echo off
(set/p adminuser=ravi: )
runas /user:%userdomain%\%adminuser% cmd.exe