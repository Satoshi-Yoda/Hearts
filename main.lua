hearts = {}
pic1 = love.graphics.newImage("_pic/heart_PNG691.png")
pic2 = love.graphics.newImage("_pic/Transparent Heart_Strips_PNG_Clipart_Picture.png")
t = 0

function love.load()
	love.window.setMode(1280, 720, {resizable=false, vsync=true})
	love.graphics.setBackgroundColor(50, 0, 150)
	math.randomseed(os.time())

	for i = 1, 10 do
		local h = {}
		h.x = math.random(1280 - 400) + 200
		h.y = math.random(720 - 400) + 200
		h.a = (math.random(20) - 10) / 100
		h.stx = math.random(5)
		h.sty = math.random(5)
		h.sta = math.random(5)
		if math.random(2) == 1 then
			h.pic = pic1
		else
			h.pic = pic2
		end
		
		table.insert(hearts, h)
	end
end

function love.update(dt)
	t = t + dt
	for _,h in pairs(hearts) do
		h.x = h.x + math.sin(t + h.stx)
		h.y = h.y + math.sin(t + h.sty)
		-- h.a = h.a + math.sin(t + h.sta)
	end
end

function love.draw()
	for _,h in pairs(hearts) do
		love.graphics.draw(h.pic, h.x, h.y, h.a + 0.2 * math.sin(t + h.sta), 0.5, 0.5)
	end
end
