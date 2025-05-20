pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function new_ball(x, y, size, color, speed)
    local ball = {}
    ball.x = x
    ball.y = y
    ball.speed = speed
    ball.color = color
    ball.size = size

    function ball:sethome()
        self.x = 64
        self.y = 64
    end

    function ball:changecolor()
        self.color += 1 
    end

    ---------------------    

    function ball:update()
        if btn(0) then self.x -= self.speed end
        if btn(1) then self.x += self.speed end
        if btn(2) then self.y -= self.speed end
        if btn(3) then self.y += self.speed end
        if btn(4) then self:sethome() end
        if btn(5) then self:changecolor() end
    end

    function ball:draw()
        circfill(self.x, self.y, self.size, self.color) -- x, y, 반지름, 색상
    end
    
    return ball
end


function _init()
    ball1 = new_ball(64, 64, 4, 7, 1)
    ball2 = new_ball(32, 48, 1, 3, 4)
end

function _update()
    ball1:update()
    ball2:update()
end

function _draw()
    cls()         -- 화면 지우기
    ball1:draw()   -- 공 그리기
    ball2:draw()
end