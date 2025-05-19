pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function new_ball(x, y)
    local ball = {}

    -- 공의 좌표
    ball.x = x
    ball.y = y

    -- 공의 이동 속도 (픽셀 단위)
    ball.speed = 2

    -- 공을 그리는 함수
    function ball:draw()
        circfill(self.x, self.y, 4, 8) -- x, y, 반지름, 색상
    end

    -- 방향키 입력으로 공을 움직이는 함수
    function ball:update()
        if btn(0) then self.x -= self.speed end -- 왼쪽
        if btn(1) then self.x += self.speed end -- 오른쪽
        if btn(2) then self.y -= self.speed end -- 위쪽
        if btn(3) then self.y += self.speed end -- 아래쪽
    end

    function ball:reset()
        self.x = 64
        self.y = 64
    end

    return ball
end

function _init()
    ball = new_ball(64, 64)
end

-- 프레임마다 호출됨: 키 입력 체크 등
function _update()
    ball:update()
end

-- 화면을 지우고 그리기 (60FPS)
function _draw()
    cls()         -- 화면 지우기
    ball:draw()   -- 공 그리기
end