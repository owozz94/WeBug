pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
x = 0
y = 0
size = 2
color = 2

function _init()
    camera(0, -127) -- 카메라를 x,y 좌표로 이동시킵니다.   
end

function _update()
	if btn(0) then	x -= 2	end
	if btn(1) then	x += 2	end
    if btn(2) then	y += 2	end
    if btn(3) then	y -= 2	end
    if btn(4) then	size += 1 end
    if btn(5) then	color += 2 end
end

function _draw()
	cls() --clear screen
    rect(0,-0, 30,-30, 3)
	circfill(x,-y,size,color) --draw circle
    circ(0,0, 8, 4)
end
