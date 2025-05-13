@echo off

:nohide
cd /d %~dp0
start "" pico-8\pico8.exe -root_path "cartridge" -windowed 1 -window_size 4
exit