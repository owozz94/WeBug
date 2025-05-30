

--==================[dungbox]===================--
function new_dungbox()
    local dungbox = {}
    dungbox.dungs = {}
    dungbox.frame = 0
    dungbox.rate = 2
    function dungbox:update()
        self.frame += 1
        if (self.frame % (30/self.rate) == 0) then
            self:add_dung()
        end
        for dung in all(self.dungs) do
            dung:update()
            if (dung.state == DUNGSTATE.GONE) then
                del(self.dungs, dung)
            end
        end
    end
    function dungbox:draw()
        for dung in all(self.dungs) do
            dung:draw()
        end
    end
    ---------------------------
    function dungbox:add_dung()
        local dung = new_dung()
        add(self.dungs, dung)
    end
    
    return dungbox
end



--==================[dung]===================--
function new_dung()
    local dung = {}    
    
    DUNGSTATE ={        
        {sprite=0x20,time=1}, --splash1
        {sprite=0x21,time=8}, --splash2
        {sprite=0x22,time=8}, --splash3
        {sprite=0x23,time=16}, --splash4                
        {sprite=0x24,time=8}, --splash5                
        {sprite=0x25,time=16}, --delete
    }

    dung.x = flr(rnd(127))
    dung.y = 137
    dung.spd = 0
    dung.gravity = -0.1 -(rnd(2.0))
    dung.maxspd = -6
    dung.size = 3--rnd(4.0)
    dung.state_num = 1
    dung.state = DUNGSTATE[1]
    
    dung.ground = 18

    function dung:update()
        self.spd+= self.gravity
        self.y += self.spd
        if(self.spd < self.maxspd) then
            self.spd = self.maxspd
        end

        if self.y <= self.ground then--땅에닿으면
            self.y = self.ground
            self.state.time -= 1
            if self.state_num == 1 then
                sfx(0)
            end
            if self.state.time <= 0 then
                self.state_num += 1
                self.state = DUNGSTATE[self.state_num] or DUNGSTATE[6]
            end
            
        end

    end
    function dung:draw()        
            spr(self.state.sprite, self.x, 128-self.y)
            -- print(self.state.time, self.x, 128-self.y, 3) -- Debugging: print the time left for the current state
    end
    ---------------------------
    function dung:get_x_y_r()
        return self.x, self.y, self.size
    end
    return dung
end