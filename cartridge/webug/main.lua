function _init()
    -- Initialize the game
    cls(0)
    print("Game initialized") --print(text,x,y,color : PICO-8의 팔레트 색상))
end

msg = 0
function _update()
    -- Update game logic
    print("_update")
    if btn(0) then
        msg=1
       end
end
function _draw()
    -- Draw the screen
    cls(0)
    print("Hello, draw!", 10, 10, 7)

    if msg==1 then
    print("0번(왼쪽) 눌렀당!")
    end
     
end