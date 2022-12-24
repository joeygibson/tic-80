function init()
	lives=3
	score=0
	tank=0
	x=120
	bx=x;by=-9
	ex=x;ey=144
	dx=0;dy=0;dc=0
	shrapnel={}
	started=false
	stars={}
	for i=1,300 do
		star={
			x=math.random(238),
			y=math.random(134)
		}
		table.insert(stars,star)
	end
end

function game_over()
	cls(15)
	rectb(0,0,240,136,2)
	local text="Game Over"
	local text2="Press [X] to restart"
	local w=get_width(text)

	print(text,(240-w)//2+1,(136-8)//2+1,14)
	print(text,(240-w)//2,(136-8)//2,4)

	local w=get_width(text2)
	print(text2,(240-w)//2+1,(136-8)//2+11,14)
	print(text2,(240-w)//2,(136-8)//2+10,4)

	rectb(0,0,240,136,2)
	if btnp(5) then init() end
	started=true
end

function get_width(t)
	local width=print(t,0,-6)
	return width
end

function start_screen()
	cls(15)
	text="Tank Battle"
	text2="Press [X] to play"
	local w=get_width(text)

	print(text,(240-w)//2+1,(136-8)//2+1,14)
	print(text,(240-w)//2,(136-8)//2,4)

	local w=get_width(text2)
	print(text2,(240-w)//2+1,(136-8)//2+11,14)
	print(text2,(240-w)//2,(136-8)//2+10,4)

	spr(0,(240-w)//2,48,0)
	spr(2,240-(240-w)//2-8,48,0)
	rectb(0,0,240,136,2)

	if btnp(5) then started=true end
end

init()

function hit_shrapnel()
	for _, s in pairs(shrapnel) do
		if math.abs(ex-s.x)<4 and
			math.abs(ey-s.y)<8 then
			return true
		end
	end

	return false
end

function TIC()
	if not started then
		start_screen(); return
	end
	
	if lives==0 then
			game_over(); return
	end
	
	-- create enemy
	if ey>143 then
		ex=math.random(240);ey=-8
		dc=8;dx=0;dy=1
	end
	
	-- check if enemy has hit shrapnel
	if hit_shrapnel() then
		ey=144
		score=score+1
	end
	
	-- move enemy
	if ey<144 then
		if dc>0 then
			ex=ex+dx;ey=ey+dy;dc=dc-1
			if ex<0 or ex>239 then dx=-dx end
		else
			dc=math.random(48)+32
			dx=math.random(3)-2;dy=0
			if dx==0 then dx=8;dy=1 end
		end
	end
	
	-- move tank
	if btn(2) and x>4 then x=x-1 end
	if btn(3) and x<236 then x=x+1 end
	
	-- shoot
	if btnp(4) and by<-7 then bx=x;by=124 end
	if by>-8 then by=by-3 end
	
	-- collision (enemy + shot)
	if math.abs(ex-bx)<4 and
		math.abs(ey-by)<8 then
		s={x=ex, y=ey}
		table.insert(shrapnel,s)
		by=-9;ey=144
		score=score+1
	end
	
	-- collision (enemy + tank)
	if math.abs(ex-x)<8 and
		math.abs(ey-124)<8 then
		lives=lives-1
		tank=tank+16
		ey=144
	end
	
	cls()
	
	for _,star in pairs(stars) do
		pix(star.x,star.y,12)
	end
	
	rectb(0,0,240,136,2)
	
	print("Score:",5,5,12)
	print(score,40,5,4)
	print("Lives:",195,5,12)
	print(lives,227,5,4)
	-- shrapnel
	for _,s in pairs(shrapnel) do
		spr(3,s.x,s.y)
	end
	
	-- enemy
	spr(2,ex,ey,0)
	-- tank
	spr(tank,x-4,124,0)
	-- bullet
	spr(1,bx-4,by-4,0)
end
-- <TILES>
-- 000:000cc00000cccc0000c22c000cc22cc0c222222cc222222cc222222ccccccccc
-- 001:0000000000004000000340000003400000034000000340000000400000000000
-- 002:000cc00000c22c000c2222c0c2f22f2cc222222c0c2222c0cd0000dc0c3003c0
-- 003:000000443300c0400333c4400cc344cc00c443c00044c3300440c03344000003
-- 016:000cc00000eccc0000ce2c000cc2ecc0c22e2e2cc2222e2cc222222ccccccccc
-- 032:000cc00000eccc0000ce2c000cc2ecc0c2fe2e2cc22ffe2ccff2ff2ccfcccfff
-- </TILES>

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

