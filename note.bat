@echo off
: Sets the proper date and time stamp with 24Hr Time for log file naming
: convention
set root= SET YOUR NOTE DIRECTORY HERE
cd %root%
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

if %MM%==01 (set mf=01-JANUARY&set pm=12-DECEMBER)
if %MM%==02 (set mf=02-FEBURARY&set pm=01-JANUARY)
if %MM%==03 (set mf=03-MARCH&set pm=02-FEBURARY)
if %MM%==04 (set mf=04-APRIL&set pm=03-MARCH)
if %MM%==05 (set mf=05-MAY & set pm=04-APRIL)
if %MM%==06 (set mf=06-JUNE & set pm=05-MAY)
if %MM%==07 (set mf=07-JULY & set pm=06-JUNE)
if %MM%==08 (set mf=08-AUGUST & set pm=07-JULY)
if %MM%==09 (set mf=09-SEPTEMBER & set pm=08-AUGUST)
if %MM%==10 (set mf=10-OCTOBER & set pm=09-SEPTEMBER)
if %MM%==11 (set mf=11-NOVEMBER & set pm=10-OCTOBER)
if %MM%==12 (set mf=12-DECEMBER & set pm=11-NOVEMBER)

if exist %root%\%YYYY%\ (
  	echo Yes 
	if exist %root%\%YYYY%\%mf%\ (
		cd %root%\%YYYY%\%mf%\
	) else (
		cd %root%\%YYYY%\%pm%\
		set sn=%pm%&_SUMMARY
		type  *.md > summary.txt
		ren summary.txt summary.md
		mkdir %root%\%YYYY%\%mf%\
		cd %root%\%YYYY%\%mf%\
	)
) else (
	mkdir %root%\%YYYY%\
	if exist %root%\%YYYY%\%mf%\ (
		cd %root%\%YYYY%\%mf%\
	) else (
		mkdir %root%\%YYYY%\%mf%\
		cd %root%\%YYYY%\%mf%\
	)
)

set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%%Min%%Sec%"
echo datestamp: "%datestamp%"
echo timestamp: "%timestamp%"
echo fullstamp: "%fullstamp%"
set SAVESTAMP=Note-%fullstamp:,=.%.md
REM echo.> %SAVESTAMP%
start notepad %SAVESTAMP%
