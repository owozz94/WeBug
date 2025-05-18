

function init_ground()
    local ground = 
    {
        x = 0,
        y = 100,
        w = 128,
        h = 28,
        sprX = 0,
        sprY = 0,
    }
    function ground:init()
    end

    function ground:update()
    end

    function ground:draw()
        map(psrX, sprY, self.x, self.y + 8, self.w/8, self.y/8)
    end
    return ground
end


function init_player(ground)
    CAT_SPR = {
        SIT = 0,
        WALK1 = 1,
        WALK2 = 2,    
        JUMP = 3,
        DROP = 4,
    }

    local player = 
    {
        old_x = 0,
        old_y = 0,
        x = 64,
        y = ground.y,
        dy = 0,
        jump_power = -3.5,
        gravity = 0.2,
        on_ground = true,
        speed = 2,
        gaze = XDIR.RIGHT,
        state = CAT_SPR.SIT,
        walkcnt = 0
    }
    function player:init()
    end

    function player:update()
        self.old_x = self.x
        self.old_y = self.y

        if btn(BTN.LEFT) then 
            self.x -= self.speed 
        end
        if btn(BTN.RIGHT) then 
            self.x += self.speed 
        end
        if btn(BTN.DOWN) then             
            self.state = CAT_SPR.SIT
        end
        if btn(BTN.UP) and (self.on_ground == true) then
            self.dy = -1.2
            self.on_ground = false
        end
        if btn(BTN.JUMP) then 
            if(self.on_ground == true) then
                self.dy = self.jump_power
                self.on_ground = false
            end
        end        
        if btn(BTN.FIRE) then 
        end

        -- 중력 적용
        self.dy += self.gravity
        self.y += self.dy
    
        -- 바닥에 닿으면 멈춤
        if (ground.y <= self.y) then
            self.y = ground.y
            self.dy = 0
            self.on_ground = true
        end
    end

    function player:draw()        
        
        if (self.old_x > self.x) then
            self.gaze = XDIR.LEFT
        elseif (self.old_x < self.x) then
            self.gaze = XDIR.RIGHT
        end

        if (self.old_y == self.y) then
            if  (self.old_x != self.x) then
                self.walkcnt += 1
                if (self.walkcnt % 4 == 0) then
                    if(self.state == CAT_SPR.WALK1) then
                        self.state = CAT_SPR.WALK2
                    else
                        self.state = CAT_SPR.WALK1
                    end
                end
            end            
        elseif (self.old_y > self.y) then
            self.state = CAT_SPR.JUMP
        elseif (self.old_y < self.y) then
            self.state = CAT_SPR.DROP
            if(self.on_ground == true) then
                self.state = CAT_SPR.WALK1
            end
        end

        spr(self.state, self.x,self.y, 1,1, self.gaze, false)        
    end

    return player
end