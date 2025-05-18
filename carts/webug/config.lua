--------------------------------------------------------------------------------
-- Copyright 2025 - 2035 by kolokuz, Inc.  All rights reserved.
-- This document contains information that is proprietary to kolokuz, Inc 
-- and no part of this source code may be used without explicit permission from kolokuz, Inc.
--------------------------------------------------------------------------------
-- 전역에서 사용하는 static 데이터, enum,값 등을 설정하는 모듈입니다.
--------------------------------------------------------------------------------
PLAYER = {
    NO1 = 0,
    NO2 = 1,
    NO3 = 2,
    NO4 = 3,
    NO5 = 4,
    NO6 = 5,
    NO7 = 6,
    NO8 = 7,
}

BTN = {
    LEFT = 0,   --1P(←)     2P(S)
    RIGHT = 1,  --1P(→)     2P(F)
    UP = 2,     --1P(↑)     2P(E)
    DOWN = 3,   --1P(↓)     2P(D)
    JUMP = 4,   --1P(Z,N,C) 2P(TAB)
    FIRE = 5    --1P(X,M,V) 2P(Q,A)
}

MOUSE_BTN = {
    LEFT = 0,   -- 마우스 왼쪽 버튼
    RIGHT = 1,  -- 마우스 오른쪽 버튼
    MIDDLE = 2, -- 마우스 가운데 버튼
}

XDIR={
    LEFT = false,
    RIGHT = true,
}

YDIR={
    UP = false,
    DOWN = true,
}



COLOR = {
    BLACK       = 0,   -- 검정
    DARK_BLUE   = 1,   -- 어두운 파랑
    DARK_PURPLE = 2,   -- 어두운 보라
    DARK_GREEN  = 3,   -- 어두운 초록
    BROWN       = 4,   -- 갈색
    DARK_GRAY   = 5,   -- 어두운 회색
    LIGHT_GRAY  = 6,   -- 밝은 회색
    WHITE       = 7,   -- 흰색
    RED         = 8,   -- 빨강
    ORANGE      = 9,   -- 주황
    YELLOW      = 10,  -- 노랑
    GREEN       = 11,  -- 녹색
    BLUE        = 12,  -- 파랑
    INDIGO      = 13,  -- 남보라 (인디고)
    PINK        = 14,  -- 분홍
    PEACH       = 15   -- 살색
}
