@echo off
:: setup for ColorText
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
mode con: cols=100 lines=30
echo       ::::::::  
ping 0.0.0.0.0 >nul
echo     :+:    :+:  
ping 0.0.0.0.0 >nul
echo    +:+        
ping 0.0.0.0.0 >nul  
echo   +#+         
ping 0.0.0.0.0 >nul  
echo  +#+          
ping 0.0.0.0.0 >nul  
echo #+#    #+#    
ping 0.0.0.0.0 >nul  
echo ########
ping 0.0.0.0 >nul
call :ColorText 6 "Welcome to Crimzen!"
echo.
cd Sys
set /p Build=<version.txt
cd ..
call :ColorText 6 "Version %Build% by CSBX inc."
echo.
:: prob put like a message of the day here
call :ColorText 5 "If you aren't a beta tester, or a CSBX employee, you shouldnt have this!"
echo.
pause
:setup
cd Reg
set /p isconfig=<Setup.txt
if %isconfig%==true goto :load
:setup
echo Setup has detected this is a new installation of Crimzen, so it will guide you throught the setup process
pause




:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
