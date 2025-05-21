pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function new_user(no)
    local user={}
    user.No=no
    user.stick=""
    user.jump=""
    user.shot=""
    return user
end

users={}
function _init()
    for i=0,7 do
        add(users, new_user(i))
    end
end

function _update()
    for user in all(users) do
        user.stick = ""
        user.shot = ""
        user.jump = ""
        if btn(0,user.No) then user.stick=user.stick.."⬅️" end
        if btn(1,user.No) then user.stick=user.stick.."➡️" end
        if btn(2,user.No) then user.stick=user.stick.."⬆️" end
        if btn(3,user.No) then user.stick=user.stick.."⬇️" end
        if btn(4,user.No) then user.jump="🅾️" end
        if btn(5,user.No) then user.shot="❎" end                
    end
end

function _draw()
	cls() --clear screen    
    local pad  = 16
    local x = 0 
    local y = 127
    for user in all(users) do
        print("user:"..user.No,  x,127-(y-user.No*pad),  user.No+3)
        print("stick:"..user.stick,  x+40,127-(y-user.No*pad))
        print("jump:"..user.jump,  x,127-(y-8-user.No*pad)) 
        print("shot:"..user.shot,  x+40,127-(y-8-user.No*pad))
    end
end
