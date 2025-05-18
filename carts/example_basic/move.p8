pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
x = 64
y = 64

function _update()
	if	btn(0) then	x -= 2	end
	if btn(1) then	x += 2	end
end

function _draw()
	cls() --clear screen
	circfill(x,y,4,3) --draw circle
end
