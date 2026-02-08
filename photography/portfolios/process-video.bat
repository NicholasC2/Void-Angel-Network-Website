@echo off

if "%1"=="" (
    echo Please specify a portfolio folder.
    echo Usage: compile_avi.bat portfolio-folder-name
    exit /b 1
)

cd /d "%~dp0\%1\videos"

if not exist "avi" (
    mkdir "avi"
    move "*.AVI" "avi\"
)

for %%i in (avi\*.AVI) do ffmpeg -i "%%i" -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p -crf 22 "%%~ni.mp4" -y

echo Conversion complete!
cd ../..