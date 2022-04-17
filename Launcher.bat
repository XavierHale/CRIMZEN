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
  goto :setup
  ) else (
    goto :launch
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
%setcolor%>>color.txt
timeout 1 /nobreak >nul






:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
