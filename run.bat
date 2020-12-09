@echo off

echo HELPER FOR: 
echo               __                               ____
echo  __  ______/ /__  ____ ___  __  __      ____/ / /
echo / / / / __  / _ \/ __ `__ \/ / / /_____/ __  / /
echo/ /_/ / /_/ /  __/ / / / / / /_/ /_____/ /_/ / /
echo\__,_/\__,_/\___/_/ /_/ /_/\__, /      \__,_/_/
echo                          /____/
echo.
echo Written by Kambaa (github.com/Kambaa)
echo.
echo.

WHERE >nul 2>nul python
IF %ERRORLEVEL% == 0 (goto :cookieCheck)

set /p "pythonAbsPath=Cannot call `python` command. Either install python or enter python.exe absolute directory:"

:cookieCheck
if exist cookies.txt (
	GOTO :downloadLinkOps
)

:addCookieOps
echo Before starting follow these steps:
echo  1. Go to Udemy's website and login.
echo  2. Open your browser's devtools(F12 or CTRL+Shift+C) and go to `Storage` tab.
echo  3. Find and copy a cookie named `access_token`.

set /p "cookieTxt=Enter access_token cookie:"
@echo access_token=%cookieTxt% > "cookies.txt"

:downloadLinkOps
set /p "udemyCourseUrl=Enter Udemy course URL(i.e. https://www.udemy.com/course/{COURSE_NAME}/):"

echo "Course URL is set: Udemy-DL is starting"

if defined pythonAbsPath (
%pythonAbsPath% udemy-dl.py -k cookies.txt %udemyCourseUrl%
)else (
python udemy-dl.py -k cookies.txt %udemyCourseUrl%
)

echo You can check the folder with the course name on it if everything went smoothly.
echo Happy Learning!
pause
