-------------------------------------------

function new_dungbox()
    local dungbox = {}
    dungbox.dungs = {}
    dungbox.frame = 0
    dungbox.rate = 2
    function dungbox:init()        
    end

    function dungbox:update()
        self.frame += 1
        if (self.frame % (30/self.rate) == 0) then
            self:add_dung()
        end

        for dung in all(self.dungs) do
            dung:update()
            if dung.y < 0 then
                del(self.dungs, dung)
            end
        end
    end

    function dungbox:draw()
        for dung in all(self.dungs) do
            dung:draw()
        end
    end

    function dungbox:add_dung()
        local dung = new_dung()
        add(self.dungs, dung)
    end

    return dungbox
end


---------------------------------------------------

function new_dung()
    local dung = {}
    dung.x = flr(rnd(127))
    dung.y = 137
    dung.spd = 0
    dung.gravity = -0.1 -(rnd(2.0))
    dung.maxspd = -6
    dung.size = 3--rnd(4.0)
    function dung:init()
    end
    function dung:update()
        self.spd+= self.gravity
        self.y += self.spd
        if(self.spd < self.maxspd) then
            self.spd = self.maxspd
        end
    end
    function dung:draw()
        circfill(self.x, 128-self.y, self.size, 3) -- x, y, 반지름, 색상
        -- print(self.spd,self.x, 128-self.y)
    end
--------------------------------------
    return dung
end