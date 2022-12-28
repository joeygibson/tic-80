-- title:   Sample platform game
-- author:  Joey Gibson - joey@joeygibson.com
-- desc:    Sample platformer
-- site:    https://www.youtube.com/playlist?list=PLOUbntoMeucFBoxH6-AkpyHA2DJ5oBSPB
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

x=0;y=0;speed=1

function TIC()
	cls()
	
	if btn(0) then y=y-speed end
	if btn(1) then y=y+speed end
	if btn(2) then x=x-speed end
	if btn(3) then x=x+speed end
	
	spr(256,x,y)
end

-- <SPRITES>
-- 000:00f00f0000f00f00003cc30022e33e222e2332e2e224422e0004400000f00f00
-- </SPRITES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

