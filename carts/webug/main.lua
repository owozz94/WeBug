dungbox = new_dungbox()

function _init()
    -- Initialize the game
    cls(0)
    x = 64
    y = 100
    g = 0.8
    print("Game initialized") --print(text,x,y,color : PICO-8의 팔레트 색상))
end

msg = 1
function _update()    
    -- Update game logic
    dungbox:update()

    print("_update")
    if btn(0) then x = x-3 msg = 1 end
    if btn(1) then x = x+3 msg = 2 end
    if btn(4) then y = y-5 end
    y += 0.9     
    if(y > 100) then
        y = 100
    end

end

function _draw()
    -- Draw the screen
    cls(0)
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
 
        
    spr(msg, x, y);
     
end