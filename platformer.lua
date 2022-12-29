-- title:   Sample platform game
-- author:  Joey Gibson - joey@joeygibson.com
-- desc:    Sample platformer
-- site:    https://www.youtube.com/playlist?list=PLOUbntoMeucFBoxH6-AkpyHA2DJ5oBSPB
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

blobby={
	x=0,
	y=0,
	speed=1,
	vx=0,
	vy=0
}

slime={
	x=0,
	y=0,
	active=false,
	vx=0
}

gravity=0.2

function moveBlobby()
	if btn(2) then 
		blobby.vx=-1*blobby.speed 
	elseif btn(3) then 
		blobby.vx=blobby.speed 
	else
		blobby.vx=0
	end

	if btnp(0) and blobby.vy == 0 then
		blobby.vy=-2.5
	elseif blobby.y > 120 then
		blobby.vy=0
	else
		blobby.vy = blobby.vy + gravity
	end

	blobby.x = blobby.x+blobby.vx
	blobby.y = blobby.y+blobby.vy
end

function checkLimits()
	if blobby.x<0 then blobby.x=0 end
	if blobby.x>231 then blobby.x=231 end
	if blobby.y<0 then blobby.y=0 end
	if blobby.y>128 then blobby.y=128 end
end

function throwSlime()
	if slime.active then
		slime.x=slime.x+slime.vx*1.5

		if slime.x<0 or slime.x>232 then
			slime.active=false
		else
			spr(320,slime.x,slime.y)
		end
	elseif btnp(4) then
		slime.active=true
		slime.vx=blobby.vx

		if blobby.vx>0 then
			slime.x = blobby.x+9
		else
			slime.x = blobby.x-9
		end

		slime.y=blobby.y
	end
end

function TIC()
	cls()
	moveBlobby()
	checkLimits()

	throwSlime()
	
	spr(256,blobby.x,blobby.y)
end

-- <SPRITES>
-- 000:00f00f0000f00f00003cc30022e33e222e2332e2e224422e0004400000f00f00
-- 064:0000000000000000000500000055500000050000000000000000000000000000
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

