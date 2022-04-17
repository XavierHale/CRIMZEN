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
if exist setup.txt ( 
  goto :launch
  ) else (
    goto :setup
  )
:setup
echo Setup has detected this is a new installation of Crimzen, so it will guide you throught the setup process
pause
echo What color would you like the default theme to be? Use the table below. The first digit or leter is background,
echo second is foreground. (Ex, for a white background and blue text, enter 71)
echo 0	=	Black	 	8	=	Gray
echo 1	=	Blue	 	9	=	Light Blue
echo 2	=	Green	 	A	=	Light Green
echo 3	=	Aqua	 	B	=	Light Aqua
echo 4	=	Red	 	    C	=	Light Red
echo 5	=	Purple	 	D	=	Light Purple
echo 6	=	Yellow	 	E	=	Light Yellow
echo 7	=	White	 	F	=	Bright White
set /p setcolor=
timeout 1 /nobreak >nul
echo What would you like your username to be?
set /p setuser=
echo That is setup done, would you like to:
echo (1)Save and launch Crimzen
echo (2)Save and exit 
echo (3)Exit without saving
set /p setchoice1=
if %setchoice1%==1 goto :savelaunch
if %setchoice1%==2 goto :saveandexit
if %setchoice1%==3 goto :eof
:saveandexit
%setcolor%>>color.txt
%setuser%>>user.txt
goto :eof
:savelaunch
%setcolor%>>color.txt
%setuser%>>user.txt
cd..
:launch
cd..
cd Sys
start CRIMZEN.bat 
goto :eof



:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
