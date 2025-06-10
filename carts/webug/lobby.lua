function new_lobby()

    local lobby = {}
    lobby.state = GAMESTATE.LOBBY -- Initial state of the lobby

    function lobby:update()
        if btn(BTN.LEFT) then
        end
        if btn(BTN.RIGHT) then
        end
        if btn(BTN.LEFT) then
        end
        if btn(BTN.LEFT) then
        end
        if btn(BTN.JUMP) then
            return GAMESTATE.STAGE1
        end
        if btn(BTN.FIRE) then
            return GAMESTATE.STAGE1
        end
        return GAMESTATE.LOBBY
    end    

    function lobby:getGameState()
        return self.state
    end
    
    function lobby:draw()
        cls(2)

        local start_x = 6
        local top_y = 29
        local char_w = 20
        local char_h = 30
        local gap = 4          -- 문자간격

        local x = start_x
        color(COLOR.ORANGE)
        -- W
        line(x, top_y, x + 3, top_y + char_h)
        line(x + 3, top_y + char_h, x + 10, top_y + char_h / 2)
        line(x + 10, top_y + char_h / 2, x + 17, top_y + char_h)
        line(x + 17, top_y + char_h, x + 20, top_y)

        x = x + char_w + gap

        -- E
        line(x, top_y, x, top_y + char_h)
        line(x, top_y, x + char_w, top_y)
        line(x, top_y + char_h / 2, x + char_w * 0.7, top_y + char_h / 2)
        line(x, top_y + char_h, x + char_w, top_y + char_h)

        x = x + char_w + gap

        -- B
        line(x, top_y, x, top_y + char_h)
        line(x, top_y, x + char_w * 0.7, top_y)
        line(x + char_w * 0.7, top_y, x + char_w, top_y + char_h * 0.25)
        line(x + char_w, top_y + char_h * 0.25, x + char_w * 0.7, top_y + char_h * 0.5)
        line(x, top_y + char_h * 0.5, x + char_w * 0.7, top_y + char_h * 0.5)
        line(x + char_w * 0.7, top_y + char_h * 0.5, x + char_w, top_y + char_h * 0.75)
        line(x + char_w, top_y + char_h * 0.75, x + char_w * 0.7, top_y + char_h)
        line(x + char_w * 0.7, top_y + char_h, x, top_y + char_h)

        x = x + char_w + gap

        -- U
        line(x, top_y, x, top_y + char_h * 0.9)
        line(x + char_w, top_y, x + char_w, top_y + char_h * 0.9)
        line(x, top_y + char_h, x + char_w, top_y + char_h)

        x = x + char_w + gap

        -- G
        line(x + 5, top_y, x + char_w, top_y)
        line(x, top_y + 5, x, top_y + char_h - 5)
        line(x + 5, top_y + char_h, x + char_w, top_y + char_h)
        line(x + char_w, top_y + char_h * 0.6, x + char_w, top_y + char_h)
        line(x + char_w * 0.6, top_y + char_h * 0.6, x + char_w, top_y + char_h * 0.6)

        --cuties
        spr(0x00, 32, 127-106);
        spr(0x10, 108, 127-76);
        spr(0x06, 64, 127-50)

        print("Press [JUMP] to start", 24, 127-10, COLOR.LIGHT_GRAY)
    end
    return lobby
    
end



function new_game()
    
    local game = {}

    game.state = "Lobby"

    function game:setLobby()
    end

    function game:setStage1()
    end
end

