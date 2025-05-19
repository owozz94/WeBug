function new_dungbox()
    local dungbox = {}
    dungbox.dungs = {new_dung()}

    function dungbox:init()
        for i = 1, 5 do
            self:add_dung()
        end
    end

    function dungbox:update()
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
--------------------------------------
    function dungbox:add_dung()
        local dung = new_dung()
        add(self.dungs, dung)
    end

end


function new_dung()
    local dung = {}
    dung.x = flr(rnd(127))
    dung.y = 128
    dung.spd = -(rnd(6.0))
    dung.gravity = -0.6
    dung.maxspd = -2
    function dung:init()
    end
    function dung:update()
        self.spd+= self.gravity
        self.y += self.spd
    end
    function dung:draw()
        circfill(self.x, 128-self.y, 2, 8) -- x, y, 반지름, 색상
    end
--------------------------------------
    return dung
end