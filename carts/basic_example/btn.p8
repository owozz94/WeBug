pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

user0 = {No=0, stick="-", shot="", jump=""}
user1 = {No=1, stick="-", shot="", jump=""}
x = 64
y = 64

function _update()
    user = user0
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

function _draw()
	cls() --clear screen    
    user = user0
    print("user:"..user.No.."    stick:"..user.stick,34,127-100)
    print("jump:"..user.jump,34,127-70) print("shot:"..user.shot,74,127-70)
end
