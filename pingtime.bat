@echo off

REM Please edit SERVER, COUNTER and INTERVALINSEC (interval/pause in seconds)
REM e.g. COUNTER 10 and INTERVALINSEC 20 => Each 20 seconds a ping and the script will end after 10 rounds...
set SERVER=8.8.8.8
set COUNTER=10
set INTERVALINSEC=10


set APPL=pingtime
set LOG=%APPL%-%SERVER%.log

echo Start %APPL% - DATE: %DATE% - TIME: %TIME:~0,8% - SERVER: %SERVER% - C-I: %COUNTER%-%INTERVALINSEC%> %LOG%
echo %APPL% is running... Please, don't cancel this job!

for /l %%x in (1, 1, %COUNTER%) do (

	ping -n 1 %SERVER% -w 500 -4 | find /i "TTL" >nul 2>&1
	
	if errorlevel 1 (
		call :OFFLINEMESSAGE
	) else (
		call :ONLINEMESSAGE
	)
	timeout %INTERVALINSEC% > NUL
) 

echo End %APPL% --- DATE: %DATE% - TIME: %TIME:~0,8% >> %LOG%
echo %APPL% ending
goto END

:OFFLINEMESSAGE
echo DESTINATION %SERVER% UNREACHABLE - %DATE% %TIME:~0,8% >> %LOG%
echo DESTINATION %SERVER% UNREACHABLE - %DATE% %TIME:~0,8%
goto :eof

:ONLINEMESSAGE
echo OK %TIME:~0,8% >> %LOG%
echo OK %TIME:~0,8%
goto :eof

:END
exit

