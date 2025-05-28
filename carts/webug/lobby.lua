function new_lobby()
    local lobby = {}

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
        end
        if btn(BTN.FIRE) then
            return "lobby"
        end
    end    

    function lobby:draw()
        cls(0)
        print("Welcome to the Lobby!", 32, 64, 7) -- Print welcome message
        print("Press [FIRE] to start", 32, 72, 7) -- Instructions for starting
        -- Draw any additional lobby elements here
    end
end



function new_game()
    
    local game = {}

    game.state = "Lobby"

    function game:setLobby()
    end

    function game:setStage1()
    end
end

