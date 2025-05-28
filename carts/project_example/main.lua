ground = init_ground()
player1 = init_player(0)
player2 = init_player(1)


function _init()    
    player1:init()
    player2:init()
    ground:init()
end


function _update()
    player1:update()
    player2:update()
    ground:update()
end


function _draw()
    cls(COLOR.INDIGO)
    player1:draw()
    player2:draw()
    ground:draw()
end