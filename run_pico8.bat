@REM ;pic8 은 실행하면 %appdata%/pico-8/pico-8/ 에서 실행됩니다.
@REM ;개발할때 애로사항이 있으므로 아래의 명령어를 통해 
@REM ;root_path 를 cartridge 폴더로 변경하여 pico8 을 실행합니다.

@REM @echo off
:nohide
setlocal
set BASEDIR=%~dp0
set PICOEXEPATH=%BASEDIR%pico-8\pico8.exe
set HOMEDIR=%BASEDIR%pico-8\AppData
set ROOTDIR=%BASEDIR%carts
set DESKTOPDIR=%BASEDIR%screenshots
set P8PATH=%BASEDIR%carts\webug\webug.p8

start %PICOEXEPATH% -home "%HOMEDIR%" -root_path "%ROOTDIR%" -desktop "%DESKTOPDIR%" -windowed 1 -width 1280 -height 1280 -gif_len 60 -capture_timestamps 1
exit
No newline at end of file