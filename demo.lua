-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

t=0
x=96
y=24
snowflakes = {}

function init()
	for i=0,75 do
		snowflake = {
			x = math.floor(math.random(240)),
			y = math.floor(math.random(130))
		}

		table.insert(snowflakes, snowflake)
	end
end

init()

function TIC()
	if btn(0) then
		if y > 0 then
			y=y-1 
		end
	end
	
	if btn(1) then 
		if y < 87 then
			y=y+1 
		end
	end
	
	if btn(2) then 
		if x > 0 then
			x=x-1 
		end
	end
	
	if btn(3) then
		if x < 192 then
			x=x+1 
		end
	end

	cls(13)

	for _, snowflake in ipairs(snowflakes) do
		-- spr(5, snowflake.x, snowflake.y)
		pset(snowflake.x, snowflake.y, 3)
	end

	print("HELLO WORLD!",84,84)
	spr(1+t%60//30*2,x,y,14,3,0,0,2,2)
	print("("..x..","..y..")", 0, 0)

	t=t+1
end

