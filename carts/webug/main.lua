function _init()
    -- Initialize the game
    cls(0)
    x = 64
    y = 100
    g = 0.8
    print("Game initialized") --print(text,x,y,color : PICO-8의 팔레트 색상))
end

msg = 0
function _update()
    -- Update game logic
    print("_update")
    if btn(0) then x = x-2 end
    if btn(1) then x = x+2 end
    if btn(4) then y = y-4 end
    y += 0.8     
    if(y > 100) then
        y = 100
    end
end

function _draw()
    -- Draw the screen
    cls(0)

    if msg==1 then
        
    end
    spr(1, x, y)
     
end