;pic8 은 실행하면 %appdata%/pico-8/pico-8/ 에서 실행됩니다.
;개발할때 애로사항이 있으므로 아래의 명령어를 통해 
;root_path 를 cartridge 폴더로 변경하여 pico8 을 실행합니다.
;start "" pico-8\pico8.exe -home ./AppData

@echo off
:nohide
cd /d %~dp0
start "" pico-8\pico8.exe -root_path "carts" -windowed 1 -window_size 3
exit