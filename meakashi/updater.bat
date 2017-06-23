@echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

echo Welcome to the patch updater for Higurashi When They Cry Hou - Ch. 5 Meakashi
echo This updater features a number of choices that will update individually parts of the patch
timeout /t 2 > nul
echo:
echo Remember that this tool is still dumb and doesn't know what version you have installed!
echo This tool will download the latest patch and apply it in your game,
echo regardless of the version you current have installed.
timeout /t 3 > nul
echo:
:start
echo To start, select an option from this list:
echo 1) Update the patch scripts (Update folder)
echo 2) Update the PS3 graphics patch
echo 3) Update the MangaGamer graphics patch
echo 4) Update the Voice patch
echo 5) Change your game from NVL to ADV mode (Unstable)
echo:
set /p choice=Type the number of your chosen option and press enter: 

if %choice%==1 goto :Patch
if %choice%==2 goto :CG
if %choice%==3 goto :CGAlt
if %choice%==4 goto :SE
if %choice%==5 goto :ADV

echo "%choice%" is not a valid option. Do your best and type it correctly now.
echo.
goto start

:Patch
call :colorEcho a0 "Downloading patch..."
echo.
timeout /t 1 > nul
.\aria2c.exe --file-allocation=none --continue=true https://github.com/07th-mod/meakashi/releases/download/v1.5.2/Meakashi.Voice.and.Graphics.Patch.v1.5.2.zip
call :colorEcho a0 "Extracting files..."
echo.
timeout /t 1 > nul
.\7za.exe x Meakashi.Voice.and.Graphics.Patch.*.zip
call :colorEcho a0 "Moving folders..."
echo.
timeout /t 1 > nul
echo D | xcopy /E /Y .\SE ..\SE > nul
echo D | xcopy /E /Y .\Update ..\Update > nul
call :colorEcho a0 "Deleting useless files..."
echo.
timeout /t 1 > nul
rmdir /S /Q .\Update > nul
rmdir /S /Q .\SE > nul
cls
call :colorEcho a0 "All done, you can close the window now or update other patches."
timeout /t 3 > nul
goto start

:CG
call :colorEcho a0 "Downloading graphics patch..."
echo.
timeout /t 1 > nul
.\aria2c.exe --file-allocation=none --continue=true https://github.com/07th-mod/resources/releases/download/Nipah/Meakashi-CG.zip
timeout /t 1 > nul
call :colorEcho a0 "Extracting files..."
echo.
timeout /t 1 > nul
.\7za.exe x Meakashi-CG.zip
call :colorEcho a0 "Moving folders..."
echo.
echo D | xcopy /E /Y .\CG ..\CG > nul
call :colorEcho a0 "Deleting useless files..."
echo.
timeout /t 1 > nul
rmdir /S /Q .\CG > nul
cls
call :colorEcho a0 "All done, you can close the window now or update other patches."
timeout /t 3 > nul
goto start

:CGAlt
call :colorEcho a0 "Downloading MangaGamer sprites patch..."
echo.
timeout /t 1 > nul
.\aria2c.exe --file-allocation=none --continue=true https://github.com/07th-mod/resources/releases/download/Nipah/Meakashi-CGAlt.zip
timeout /t 1 > nul
call :colorEcho a0 "Extracting files..."
echo.
timeout /t 1 > nul
.\7za.exe x Meakashi-CGAlt.zip
call :colorEcho a0 "Moving folders..."
echo.
echo D | xcopy /E /Y .\CGAlt ..\CGAlt > nul
call :colorEcho a0 "Deleting useless files..."
echo.
timeout /t 1 > nul
rmdir /S /Q .\CGAlt > nul
cls
call :colorEcho a0 "All done, you can close the window now or update other patches."
timeout /t 3 > nul
goto start

:SE
call :colorEcho a0 "Downloading voice patch..."
echo.
timeout /t 1 > nul
.\aria2c.exe --file-allocation=none --continue=true https://github.com/07th-mod/resources/releases/download/Nipah/Meakashi-Voices.zip
timeout /t 1 > nul
call :colorEcho a0 "Extracting files..."
echo.
timeout /t 1 > nul
.\7za.exe x Meakashi-Voices.zip
call :colorEcho a0 "Moving folders..."
echo.
echo D | xcopy /E /Y .\SE ..\SE > nul
call :colorEcho a0 "Deleting useless files..."
echo.
timeout /t 1 > nul
rmdir /S /Q .\SE > nul
cls
call :colorEcho a0 "All done, you can close the window now or update other patches."
timeout /t 3 > nul
goto start

:ADV
call :colorEcho a0 "Downloading ADV mode patch..."
echo.
timeout /t 1 > nul
.\aria2c.exe -o adv-mode.zip --file-allocation=none --continue=true https://github.com/07th-mod/meakashi/archive/adv-mode.zip
call :colorEcho a0 "Extracting files..."
echo.
timeout /t 1 > nul
.\7za.exe x adv-mode.zip
call :colorEcho a0 "Moving folders..."
echo.
timeout /t 1 > nul
echo D | xcopy /E /Y .\meakashi-adv-mode\SE ..\SE > nul
echo D | xcopy /E /Y .\meakashi-adv-mode\Update ..\Update > nul
echo D | xcopy /E /Y .\meakashi-adv-mode\CG ..\CG > nul
call :colorEcho a0 "Deleting useless files..."
echo.
timeout /t 1 > nul
rmdir /S /Q .\meakashi-adv-mode > nul
del ..\CompiledUpdateScripts\*.mg > nul
cls
call :colorEcho a0 "All done, you can close the window now or update other patches."
timeout /t 3 > nul
goto start



exit
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i