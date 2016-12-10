function GeldAnzeige()
	local self ={
		cash = 100,
		name = "geld",
		visible = true
	}

	local x = 0
	local y = 496
	local width = 64
	local height = 32


	function self.load()
		self.visible = true

	end

	function self.update()
	end

	function self.draw(font)
		love.graphics.rectangle("fill", x, y, width, height )
		love.graphics.setFont(font)
		love.graphics.setColor(0,0,0,255)

		love.graphics.print(tostring(self.cash).. " $", x+16,y+8)
		love.graphics.setColor(255,255,255,255)
	end

return self
end return GeldAnzeige