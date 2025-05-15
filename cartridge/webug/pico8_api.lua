-- PICO-8 API
-- 이 파일은 PICO-8의 주요 내장 함수를 카테고리별로 객체에 정리한 것입니다.
-- 각 함수에는 자세한 한글 주석이 포함되어 있으며, 자동완성 지원을 위해 구조화되어 있습니다.


function pico8_api_gfx()
	col = COLOR.BLUE
	x0 = 10
	y0 = 10
	x1 = 100
	x2 = 100


	--그리기세팅---------------------------------------------------------------

	-- 화면을 특정 색상으로 지움
	-- cls([col]) 
	-- [col]: 색상 번호 (기본값: 0)		
	cls()	--기본색으로 화면지움
	cls(COLOR.BLUE)	--화면을 파란색으로 지움

	-- 카메라 오프셋 설정
	-- 모든 그리기 함수에 x, y의 오프셋을 지정
	-- camera()로 호출해서 리셋
	-- x, y: 기준점으로 설정할 좌표. 
	-- 이좌표가 앞으로 0,0 이 된다.
	camera(x, y)

	-- 클리핑 영역 설정
	-- 해당 영역에만 draw를 하는 기능
	-- 파라미터없이 clip()으로 호출해서 리셋
	-- x, y, w, h: 클리핑 사각형 정의
	clip(x, y, w, h)
	




	--컬러 세팅---------------------------------------------------------------

	--그리기 함수가 기본으로 사용할 색을 설정
	color()		--검정색(0)으로 리셋
	color(col)

	-- 색상 팔레트 매핑
	-- 호출 시점 이후부터 모든 그리기 함수에서 c0 색 대신 c1 색을 사용 (컬러 리매핑)
	-- pal()로 호출하여 투명값을 포함해 시스템 기본값으로 리셋
	-- c0, c1: 색상 번호
	-- p: 팔레트 타입 (0: 새로그릴색들에적용 , 1: 보이는색들에적용)
	--pal c0 c1 [p]
	pal(c0, c1, p)

	-- 색상 투명 설정
	-- 컬러 인덱스의 투명여부를 t(불 대수 값)로 적용
	-- 투명도의 적용 상태는 spr(), sspr(), map() 에서 확인 가능
	-- e.g. palt(8, true) -- 빨간 색을 그리지 않음
	-- palt()로 호출하여 기본값으로 리셋: 0번 색을 제외한 모든 색을 불투명하게
	-- c: 색상 번호 (0~15)
	-- [t]: true/false (기본: true)
	palt(c, t)

	-- 패턴 설정
	-- pattern: 16비트 패턴 값 0x0000~0xFFFF
	fillp(pattern)






	--도형그리기---------------------------------------------------------------
	
	-- 스프라이트시트상 좌표 색상 가져오기
	-- x, y: 좌표
	-- return: 해당 위치의 색상 번호
	value = pget(x, y)

	-- 스프라이트시트 상의 x, y 지점 픽셀의 색깔을 변경
	-- x, y: 좌표
	-- [col]: 색상 (선택)
	sset(x, y, col)

	-- 픽셀 찍기
	-- x, y: 좌표
	-- [col]: 색상 (선택)
	pset(x, y, col)

	-- 픽셀 색상 가져오기
	-- x, y: 좌표
	-- return: 해당 위치의 색상 번호
	value = pget(x, y)

	-- 선 그리기
	-- line(x0, y0, x1, y1, [col])	
	-- x0, y0: 시작 좌표 
	-- x1, y1: 끝 좌표 
	-- [col]: 색상 (선택)
	line(10, 10, 100, 100) --기본컬러로 선 그리기
	line(12, 10, 102, 100, COLOR.RED) --빨간색으로 선 그리기

	-- 사각형 그리기 (테두리만)
	-- x0, y0: 좌상 꼭지점 좌표
	-- x1, y1: 우하 꼭지점 좌표 
	-- [col]: 색상 (선택)
	rect(14, 14, 114, 114, COLOR.INDIGO)

	-- 사각형 채우기
	-- x0, y0: 좌상 꼭지점 좌표
	-- x1, y1: 우하 꼭지점 좌표 
	-- [col]: 색상 (선택)
	rectfill(30, 30, 90, 90, COLOR.LIGHT_GRAY)

	-- 원 채우기
	-- x, y: 원 중심 좌표
	-- r: 반지름
	-- [col]: 색상 번호 (선택)
	circ(64, 64, 8, COLOR.ORANGE)
	circfill(64, 64, 3, COLOR.ORANGE)





	--스프라이트---------------------------------------------------------------
	
	-- 스프라이트 출력
	-- n: 스프라이트 번호 (0~255)
	-- x, y: 출력할 좌표
	-- [w, h]: 스프라이트 시트의 이웃하는 몇 칸까지 통째로 그릴 것인지를 결정 (기본값 1)
	-- [flip_x, flip_y]: 좌우/상하 반전 여부 (기본값 false)
	spr(n, x, y, w, h, flip_x, flip_y)

	-- 스프라이트 일부 출력
	-- 스프라이트 시트의 (sx, sy)에서 가로 세로 (sw, sh)까지의 영역을 가져와서
	-- 화면의 (dx, dy)에서 가로 세로 (dw, dh)까지 늘려서 그리기 // 수치는 픽셀 단위
	-- dw, dh는 명시되지 않았을 경우 sw, sh와 동일한 값
	-- sx, sy, sw, sh: 시트에서 가져올 부분의 위치 및 크기
	-- dx, dy, dw, dh: 출력 위치 및 크기
	-- [flip_x, flip_y]: 좌우/상하 반전 여부 (선택)
	sspr(sx, sy, sw, sh, dx, dy, dw, dh, flip_x, flip_y)
	
	--스프라이트의 플래그값을 v로 설정
	--플래그의 초기 상태는 스프라이트 편집기의 여러 개의 작은 알록달록한 버튼 한 줄에서 설정할 수 있습니다.
	--스프라이트 플래그의 의미는 사용자의 의도에 따라 달라질 수 있습니다. 이를테면 어떤 그룹('레이어')의 
	--스프라이트가 맵에 그려져야 하는지 등을 지시하기 위해 쓸 수 있을 것입니다.
	--플래그 인덱스가 생략되었을 경우, 모든 플래그는 비트필드의 형태로 전달/설정됩니다.
	--fset(2, 1+2+8)   -- 비트 0,1,3을 설정
	--fset(2, 4, true) -- 비트 4를 설정
	--n 스프라이트 번호 (0~255)
	--f 플래그 인덱스 0..7
	--v 불 대수 값으로서 true 혹은 false
	fset(n, f, v)

	--스프라이트의 플래그 값을 가져옴
	--print(fget(2))   -- 27 (1+2+8+16)
	--n 스프라이트 번호 (0~255)
	--f 플래그 인덱스 0..7
	value = fget(n, f)

	



	--텍스트---------------------------------------------------------------
	
	-- 텍스트 출력
	-- 문자열만 인자로 입력했을 경우, 커서가 화면 끝에 다다르면 자동으로 캐리지 리턴을 적용하고 
	-- 화면을 아래로 스크롤합니다. (터미널처럼 반응)
	-- str: 출력할 문자열
	-- x, y: 출력 위치 (생략 시 자동 위치)
	-- [col]: 색상 번호 (선택)
	print(str, x, y, col)

	--커서 위치와 캐리지 리턴 여백을 설정
	cursor(x, y)


end




function pico8_api_input()
	--버튼---------------------------------------------------------------
	-- 특정 버튼이 눌려져 있는지 확인
	-- i: 버튼 인덱스 (0~5) / p: 플레이어 번호 (기본: 0)	
	pressed = btn(1, 3)

	-- 버튼의 트리거 입력 감지	
	pressed = btnp(3, 2)
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

-- 랜덤값. 소숫점까지 리턴
-- x: 랜덤으로나올수있는 최댓값
mathx.rnd = function(x)
	return rnd(x)
end

-- 랜덤 시드 설정
-- seed: 랜덤 seed
mathx.srand = function(seed)
	srand(seed)
end


-- 각도 계산 함수
-- dx, dy: 대상까지의 x, y 거리 (dy는 위가 -)
-- return: 두 점 사이의 각도 (0.0~1.0 = 0~360도)
--         예: atan2(1, 0) → 0.25 (90도)
mathx.atan2 = function(dx, dy)
    return atan2(dx, dy)
end

-- 제곱근 함수
-- x: 양수 값 (예: 4)
-- return: x의 제곱근 (예: sqrt(4) = 2)
mathx.sqrt = function(x)
    return sqrt(x)
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