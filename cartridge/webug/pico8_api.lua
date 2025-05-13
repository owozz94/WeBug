-- 📌 PICO-8 API
-- 이 파일은 PICO-8의 주요 내장 함수를 카테고리별로 객체에 정리한 것입니다.
-- 각 함수에는 자세한 한글 주석이 포함되어 있으며, 자동완성 지원을 위해 구조화되어 있습니다.


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