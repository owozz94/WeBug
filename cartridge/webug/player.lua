--------------------------------------------------------------------------------
-- Copyright 2025 - 2035 by kolokuz, Inc.  All rights reserved.
-- This document contains information that is proprietary to kolokuz, Inc 
-- and no part of this source code may be used without explicit permission from kolokuz, Inc.
--------------------------------------------------------------------------------
-- 플레이어 객체를 정의하는 모듈입니다.
--------------------------------------------------------------------------------

function init_player(x, play_no)
    local player = 
    {        
        x = x,
        y = POS.BOTTOM,
        size = 3,
        life = 3,
        speed = 2,
        play_no = play_no,
        color = 3,
    }

    function player:draw()
        circfill(self.x, self.y, self.size, self.color)
    end

    function player:update()
        if btn(BTN.LEFT, play_no) then self.x -= self.speed end
        if btn(BTN.RIGHT, play_no) then self.x += self.speed end
        if btn(BTN.DOWN, play_no) then self.size -= self.speed end
        if btn(BTN.UP, play_no) then self.size += self.speed end
        if btn(BTN.JUMP, play_no) then self.y -= self.speed end
        if btn(BTN.FIRE, play_no) then self.color = flr(rnd(8)) end
    end

    return player
end

