-- LUA_BASIC
-- 이 파일은 PICO-8에서 사용하는 LUA 언어의 주요 내용을 정리한 것입니다.

global_number_a = 3 --전역변수.

function lua_basic()	
	--변수선언---------------------------------------------------------------
	global_number_b = 8 --전역변수. 함수안에서 선언했지만 함수밖에서도 접근가능
	local number_var = 3.14
	local string_var = "Hello, world!"
	local bool_var = false
	local array_var = {1, 2, 3}  -- 배열
	local table_var = {key="value", value=42}  -- 딕셔너리


	--배열---------------------------------------------------------------
	local myArray = {10, 20, 30}
	print(myArray[1])  -- lua 배열의 인덱스는 1부터 시작하므로 10이 출력됩니다.
	myArray[4] = 40  -- 배열에 값 추가
	print(myArray[4])  -- 40


	--테이블---------------------------------------------------------------
	local myTable = {name="Pico-8", age=10}
	print(myTable.name)  -- Pico-8
	print(myTable["name"])  -- Pico-8
	print(myTable.age)  -- 10


	--스트링---------------------------------------------------------------
	local str = "Hello, " .. "World! " .. myTable["name"] .. "_" .. x
	print(str)  -- "Hello, World! Pico-8_10"

		
	--IF---------------------------------------------------------------	
	local x = 10
	if x > 10 then
		print("x는 10보다 큽니다.")
	elseif x == 10 then
		print("x는 10입니다.")	
	elseif x > 0 and x < 10 then
		print("x는 0보다 크고 10보다 작습니다.")
	elseif not (x == 10) then
		print("x는 10이 아닙니다.")
	else
		print("x는 10보다 작습니다.")	
	end

	
	--FOR---------------------------------------------------------------
	local i = 1
	for i = 1, 10 do
		if i == 5 then
			break  -- 5일 때 반복문을 종료
		end
		print(i)
	end


	--WHILE---------------------------------------------------------------	
	while i <= 5 do
		i = i + 1
	end


	--주석---------------------------------------------------------------

	--한줄 주석은 이렇게 작성합니다.

	--[[
		여러 줄 주석은 이렇게 작성합니다.
		여러 줄 주석은 이렇게 작성합니다.
	]]--


	--함수---------------------------------------------------------------
	function greet(name)
		return "Hello, " .. name
	end
	print(greet("World"))  -- "Hello, World"


	--객체2---------------------------------------------------------------
	local Car = {}
	Car.__index = Car

	function Car.new(model, year)
		local self = setmetatable({}, Car)
		self.model = model
		self.year = year
		return self
	end

	function Car:display()
		print("Car Model: " .. self.model .. ", Year: " .. self.year)
	end

	local myCar = Car.new("Toyota", 2020)
	myCar:display()  -- Car Model: Toyota, Year: 2020




	-----------------------------------------------------------------
	-- Player 클래스 정의
	local Player = {}	--클래스 역할의 테이블
	Player.__index = Player  -- self 메서드 위임을 위한 메타테이블 설정
	-- 	__index는 Lua의 메타테이블 특수 키입니다.
	-- "객체에서 함수를 찾을 수 없을 때 어디를 뒤질지" 정하는 규칙입니다.
	-- 즉, obj:draw()를 호출하면,
	-- obj에는 draw()가 없음 → 그럼 obj.__index 에서 찾아봄
	-- obj.__index = Player → 결국 Player.draw() 사용

	-- 생성자
	function Player:new(x, y)
		local obj = {
			x = x or 64,
			y = y or 64,
			speed = 2
		}
		setmetatable(obj, self) --인스턴스에 메서드 연결
		-- setmetatable(tbl, mt)는 tbl에 "메타테이블" 이라는 특수 룰북을 붙여주는 함수입니다.
		-- 여기에 Player를 붙이면:
		-- obj는 Player의 규칙(__index = Player)을 따르게 됩니다.
		-- 즉, obj:draw() 하면 Player.draw(self) 호출됨
		return obj
	end

	-- update 메서드 (움직임)
	function Player:update() --player:update()	: 문법으로 self 자동 전달
		if btn(0) then self.x -= self.speed end  -- ←
		if btn(1) then self.x += self.speed end  -- →
		if btn(2) then self.y -= self.speed end  -- ↑
		if btn(3) then self.y += self.speed end  -- ↓
	end

	-- draw 메서드
	function Player:draw()
		spr(1, self.x, self.y)
	end

	-----------------------------------------------------------------
end




