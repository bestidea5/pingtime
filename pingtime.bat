@echo off

set SERVER=8.8.8.8
set COUNTER=60

set APPL=pingtime
set LOG=%APPL%-%SERVER%.log

echo Start %APPL% - DATE: %DATE% - TIME: %TIME:~0,8% > %LOG%
echo %APPL% is running... Please, don't cancel this job!

for /l %%x in (1, 1, %COUNTER%) do (

	ping -n 1 %SERVER% -w 500 -4 | find /i "TTL" >nul 2>&1
	
	if errorlevel 1 (
		call :OFFLINEMESSAGE
	) else (
		call :ONLINEMESSAGE
	)
	timeout 1 > NUL
) 

echo End %APPL% --- DATE: %DATE% - TIME: %TIME:~0,8% >> %LOG%
echo %APPL% ending
goto END

:OFFLINEMESSAGE
echo DESTINATION %SERVER% UNREACHABLE - %DATE% %TIME:~0,8% >> %LOG%
goto :eof

:ONLINEMESSAGE
echo OK %TIME:~0,8%
goto :eof

:END
exit

