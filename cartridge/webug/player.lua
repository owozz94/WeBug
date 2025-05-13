--------------------------------------------------------------------------------
-- Copyright 2025 - 2035 by kolokuz, Inc.  All rights reserved.
-- This document contains information that is proprietary to kolokuz, Inc 
-- and no part of this source code may be used without explicit permission from kolokuz, Inc.
--------------------------------------------------------------------------------
-- 플레이어 객체를 정의하는 모듈입니다.
--------------------------------------------------------------------------------

function init_player(y, play_no)
    local player = 
    {        
        y = y,
        size = 3,
        life = 3,
        speed = 2,
        play_no = play_no,
    }

    function player:draw()
        circfill(self.y, 120, self.size, 3)
    end

    function player:update()
        if btn(BTN.LEFT) then self.y -= self.speed end
        if btn(BTN.RIGHT) then self.y += self.speed end
        if btn(BTN.DOWN) then self.size -= self.speed end
        if btn(BTN.UP) then self.size += self.speed end
    end

    return player
end

