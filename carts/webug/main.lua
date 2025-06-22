dungbox = new_dungbox()
lobby = new_lobby()
game = {
    state = GAMESTATE.LOBBY,    
    player1 =
    {
        enable = true,
        charactor = 1,
        life = 3
    },
    plyaer2 = 
    {
        enable = true,
        charactor = 2,
        life = 3
    }
}
gamestate = GAMESTATE.LOBBY

function _init()
    -- Initialize the game
    x = 64
    y = 110
    g = 0.8
    cls(0)    
end

msg = 1
function _update()
    if (gamestate == GAMESTATE.LOBBY) then
        --LOBBY-----------------------------------------------------------
        gamestate = lobby:update()
    elseif (gamestate == GAMESTATE.STAGE1) then        
        --STAGE1------------------------------------------------------------
        dungbox:update()
        print("_update")
        if btn(0) then x = x-3 msg = 1 end
        if btn(1) then x = x+3 msg = 2 end
        if btn(4) then y = y-5 sfx(1) end    
        y += 0.9     
        if(y > 100) then
            y = 100
        end
    end
end

function _draw()
    cls(0)
    if (gamestate == GAMESTATE.LOBBY) then
        --LOBBY-----------------------------------------------------------        
        lobby:draw()
    elseif (gamestate == GAMESTATE.STAGE1) then
        --STAGE1------------------------------------------------------------                                
        map(0,0,0,0,128,32);
        dungbox:draw()
        --print(x);
        for i=x,x+3 do print(i) end;
        --벽 계산
        if(0 >= x) then x=0 end
        if(x >= 118) then x=118 end
        if(0 >= y) then y=0 end
        -- 좌우 움직임
        for i=x,x+3 do print(i) 
            if(x % 2 == 0) then msg=2 end
            if(x % 2 == 1) then msg=1 end
        end        
        spr(msg+16, x, y);
    end
end