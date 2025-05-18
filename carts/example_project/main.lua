ground = init_ground()
player = init_player(ground)


function _init()    
    player:init()
    ground:init()
end


function _update()
    player:update()
    ground:update()
end


function _draw()
    cls(COLOR.INDIGO)
    player:draw()
    ground:draw()
end