
DUNGSTATE ={
    IDLE={sprite=0x20,time=1},
    FALL={sprite=0x20,time=1},
    SPLASH1={sprite=0x21,time=5},
    SPLASH2={sprite=0x22,time=5},
    SPLASH3={sprite=0x23,time=10},
    GONE={sprite=0x20,time=1},
}


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
    

    dung.x = flr(rnd(127))
    dung.y = 137
    dung.spd = 0
    dung.gravity = -0.1 -(rnd(2.0))
    dung.maxspd = -6
    dung.size = 3--rnd(4.0)
    dung.state = DUNGSTATE.FALL
    dung.ground = 30

    function dung:update()
        self.spd+= self.gravity
        self.y += self.spd
        if(self.spd < self.maxspd) then
            self.spd = self.maxspd
        end

        if self.y <= self.ground then
            dung.state = DUNGSTATE.SPLASH1
            self.y = self.ground
        end
    end
    function dung:draw()
        if self.state == DUNGSTATE.FALL then            
            spr(32, self.x, 128-self.y)
        elseif self.state == DUNGSTATE.SPLASH1 then
            spr(33, self.x, 128-self.y)
            self.state = DUNGSTATE.SPLASH2
        elseif self.state == DUNGSTATE.SPLASH2 then
            spr(34, self.x, 128-self.y)
            self.state = DUNGSTATE.SPLASH3
        elseif self.state == DUNGSTATE.SPLASH3 then
            spr(35, self.x, 128-self.y)
            self.state = DUNGSTATE.GONE
        end
    end
    ---------------------------
    function dung:get_x_y_r()
        return self.x, self.y, self.size
    end
    return dung
end