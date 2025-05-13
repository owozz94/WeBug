-- 📌 PICO-8 API
-- 이 파일은 PICO-8의 주요 내장 함수를 카테고리별로 객체에 정리한 것입니다.
-- 각 함수에는 자세한 한글 주석이 포함되어 있으며, 자동완성 지원을 위해 구조화되어 있습니다.


function basic()

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

	for i = 1, 5 do
		print(i)  -- 1부터 5까지 출력
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








--------------------------------------------------------------------------------
-- ✨ Graphics 관련 함수
gfx = {}

-- 화면을 특정 색상으로 지움
-- col: 색상 번호 (기본값: 0)
gfx.cls = function(col)
	cls(col)
end

-- 선 그리기
-- x0, y0: 시작 좌표 / x1, y1: 끝 좌표 / col: 색상 (선택)
gfx.line = function(x0, y0, x1, y1, col)
	line(x0, y0, x1, y1, col)
end

-- 문자열 출력
-- str: 출력할 문자열 / x, y: 위치 / col: 색상 (선택)
gfx.print = function(str, x, y, col)
	print(str, x, y, col)
end

-- 사각형 그리기 (테두리만)
-- x0, y0, x1, y1: 꼭지점 좌표 / col: 색상 (선택)
gfx.rect = function(x0, y0, x1, y1, col)
	rect(x0, y0, x1, y1, col)
end

-- 사각형 채우기
gfx.rectfill = function(x0, y0, x1, y1, col)
	rectfill(x0, y0, x1, y1, col)    
end




--------------------------------------------------------------------------------
-- ✨ Input 관련 함수
input = {}

-- 특정 버튼이 눌려져 있는지 확인
-- i: 버튼 인덱스 (0~5) / p: 플레이어 번호 (기본: 0)
input.btn = function(i, p)
	return btn(i, p)
end

-- 버튼의 트리거 입력 감지
input.btnp = function(i, p)
	return btnp(i, p)
end


--------------------------------------------------------------------------------
-- ✨ Math 관련 함수
mathx = {}

-- 내림
mathx.flr = function(x)
	return flr(x)
end

-- 올림
mathx.ceil = function(x)
	return ceil(x)
end

-- 절댓값
mathx.abs = function(x)
	return abs(x)
end

-- 최대값
mathx.max = function(a, b)
	return max(a, b)
end

-- 최소값
mathx.min = function(a, b)
	return min(a, b)
end

-- 중간값 반환
mathx.mid = function(x, y, z)
	return mid(x, y, z)
end

-- 사인
mathx.sin = function(x)
	return sin(x)
end

-- 코사인
mathx.cos = function(x)
	return cos(x)
end

-- 랜덤값
mathx.rnd = function(x)
	return rnd(x)
end

-- 랜덤 시드 설정
mathx.srand = function(seed)
	srand(seed)
end


--------------------------------------------------------------------------------
-- ✨ Memory 관련 함수
mem = {}

-- 8비트 메모리 읽기
mem.peek = function(addr)
	return peek(addr)
end

-- 8비트 메모리 쓰기
mem.poke = function(addr, val)
	poke(addr, val)
end

-- 메모리 블록 복사
mem.memcpy = function(dest, source, len)
	memcpy(dest, source, len)
end

-- 메모리 초기화
mem.memset = function(dest, val, len)
	memset(dest, val, len)
end


--------------------------------------------------------------------------------
-- ✨ 시스템 관련 함수
sys = {}

-- 프로그램 종료
sys.stop = function(msg)
	stop(msg)
end

-- 카트리지 로드
sys.load = function(filename, breadcrumb, param_str)
	load(filename, breadcrumb, param_str)
end

-- 콘솔 재부팅
sys.reboot = function()
	reboot()
end

-- 프로그램 실행
sys.run = function(param_str)
	run(param_str)
end

-- 디렉토리 목록 출력
sys.ls = function(dir)
	ls(dir)
end

-- 도움말 출력
sys.help = function()
	help()
end
--------------------------------------------------------------------------------