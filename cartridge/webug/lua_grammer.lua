-- LUA_BASIC
-- 이 파일은 PICO-8의 주요 내장 함수를 카테고리별로 객체에 정리한 것입니다.
-- 각 함수에는 자세한 한글 주석이 포함되어 있으며, 자동완성 지원을 위해 구조화되어 있습니다.


function lua_basic()

--변수선언---------------------------------------------------------------
	local number = 3.14
	local text = "Hello, world!"
	local is_valid = false
	local array = {1, 2, 3}  -- 배열
	local dict = {key="value", another_key=42}  -- 딕셔너리

--IF---------------------------------------------------------------	
	local x = 10
	if x > 10 then
		print("x는 10보다 큽니다.")
	elseif x == 10 then
		print("x는 10입니다.")
	else
		print("x는 10보다 작습니다.")
	end

	



	local x = 5
	if x > 0 and x < 10 then
		print("x는 0보다 크고 10보다 작습니다.")
	end
	
	-- `or`와 `not` 사용 예시
	if not (x == 10) then
		print("x는 10이 아닙니다.")
	end

--WHILE---------------------------------------------------------------
	local i = 1
	while i <= 5 do
		print(i)  -- 1부터 5까지 출력
		i = i + 1
	end


--FOR---------------------------------------------------------------
	for i = 1, 5 do
		print(i)  -- 1부터 5까지 출력
	end

	for i = 1, 10 do
		if i == 5 then
			break  -- 5일 때 반복문을 종료
		end
		print(i)
	end

--함수---------------------------------------------------------------
	function greet(name)
		return "Hello, " .. name
	end

	print(greet("World"))  -- "Hello, World"


--배열---------------------------------------------------------------
	local myArray = {1, 2, 3}
	print(myArray[1])  -- 1
	
	local list = {10, 20, 30}
	print(list[1])  -- 10
	list[4] = 40  -- 배열에 값 추가
	print(list[4])  -- 40

--테이블---------------------------------------------------------------
	local myTable = {name="Pico-8", age=10}
	print(myTable.name)  -- Pico-8

	local person = {name="John", age=30}
	print(person["name"])  -- John
	print(person.age)  -- 30

--스트링---------------------------------------------------------------
	local str = "Hello, " .. "World!"
	print(str)  -- "Hello, World!"


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

end






