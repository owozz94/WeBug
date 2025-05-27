pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function new_ball(x, y, size, color, speed) --new object 같이 생성자이면서 동시에 클래스를 정의합니다
    
    local ball = {}-- new_ball() 로 생성한 객체 그 자체입니다.
    ------------- 딕셔내리로써 밑에서 선언하는 x, y, speed 등의 인스턴스와 
    ------------- sethome, changecolor, update 등의 함수를 갖는 객체가 됩니다.


    
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
    
    
    
    
    
    
    ------------- 메인의 _update(), _draw() 에 놓을 함수입니다.----------
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
--================[main_call_back]====================--
function _init()
    ball1 = new_ball(64, 64, 4, 7, 1)
    ball2 = new_ball(32, 48, 1, 3, 4)
    ball3 = new_ball(32, 48, 2, 4, -2)
end

function _update()
    ball1:update()
    ball2:update()
    ball3:update()
end

function _draw()
    cls()         -- 화면 지우기
    ball1:draw()   -- 공 그리기
    ball2:draw()
    ball3:draw()
end