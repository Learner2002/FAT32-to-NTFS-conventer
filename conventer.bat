@echo off
mode con:cols=88 lines=50
:start
cls
Set _list=a,b,c,d,e,f,g,h,i,g,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
echo ########################################################################################
echo #                               FAT32 to NTFS conventer                                #
echo ########################################################################################
set /p Letter="Enter the letter of your USB: "
Echo %Letter% |FindStr /R "[a-z]" >nul
IF %ERRORLEVEL% EQU 0 (
	IF %Letter%==%Letter:~0,1% (
		chkdsk %Letter%: /F
		If ERRORLEVEL 1  (
			echo Disk does not exist please try again.
        		pause >nul
     			GOTO start
		)ELSE (
			convert %Letter%: /FS:NTFS
			echo Done
			)
	)ELSE (
		ECHO Wrong input please try again.
		pause >nul
		GOTO start
      		)
	) 

	IF %ERRORLEVEL% EQU 1 (
		echo Wrong input please try again.
		pause >nul
		GOTO start
		)
pause >nul


