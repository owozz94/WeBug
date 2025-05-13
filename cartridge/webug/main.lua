--------------------------------------------------------------------------------
-- Copyright 2025 - 2035 by kolokuz, Inc.  All rights reserved.
-- This document contains information that is proprietary to kolokuz, Inc 
-- and no part of this source code may be used without explicit permission from kolokuz, Inc.
--------------------------------------------------------------------------------
-- 게임의 콜백함수인 _init() _update() _draw()를 정의합니다.
--------------------------------------------------------------------------------

player1 = init_player(64, PLAYER.NO1)
player2 = init_player(64, PLAYER.NO2)

function _init()
    cls()
end

function _update()
    player1:update()    
    player2:update()    
end

function _draw()
    cls()    
    player1:draw()
    player2:draw()    
end