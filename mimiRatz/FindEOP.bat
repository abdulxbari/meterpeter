@echo off

:: List PRIVILEGES
whoami /user
echo.
echo.

:: List HOTFIXES
powershell -C "Get-HotFix|Select-Object Description,HotFixID,InstalledBy,InstalledOn|Format-table -AutoSize|Out-String -Stream|Select-Object -Skip 1|Select-Object -SkipLast 1"

:: List PRIVILEGES
whoami /priv
echo.
echo.


cd %userprofile%
echo UNQUOTED SERVICE PATHS
echo ----------------------
sc query state= all > scoutput.txt
findstr "SERVICE_NAME:" scoutput.txt > Servicenames.txt
FOR /F "tokens=2 delims= " %%i in (Servicenames.txt) DO @echo %%i >> services.txt
FOR /F %%i in (services.txt) DO @sc qc %%i | findstr "BINARY_PATH_NAME" >> path.txt
find /v """" path.txt > unquotedpaths.txt
sort unquotedpaths.txt|findstr /i /v C:\WINDOWS|findstr /V /C:"---------- PATH.TXT"
del /f Servicenames.txt
del /f services.txt
del /f path.txt
del /f scoutput.txt
del /f unquotedpaths.txt
echo.
echo.

echo PROGRAMS THAT RUN AT STARTUP
echo ----------------------------
powershell -C "Get-CimInstance Win32_StartupCommand|Select-Object Name,command,Location,User|Format-List"

::echo PROGRAMS RUNNING UNDER SYSTEM PRIVILEGES
::echo ----------------------------------------
::tasklist /v /fi "username eq system"
::echo.
::echo.

echo LINK RUNNING PROCESSES TO STARTED SERVICES
echo ------------------------------------------
tasklist /SVC


cd %tmp%
exit

