function GeldAnzeige(theMenuId,font)
	local self ={
		cash = 100,
		menuId = theMenuId,
		visible = true
	}

	local x = 0
	local y = 496
	local width = 64
	local height = 32
	local font = font

	function self.load()
		self.visible = true

		print(font)
	end

	function self.update()
	end

	function self.draw()
		love.graphics.rectangle("fill", x, y, width, height )
		love.graphics.setFont(font)
		love.graphics.setColor(0,0,0,255)

		love.graphics.print(tostring(self.cash).. " $", x+16,y+8)
			love.graphics.setColor(255,255,255,255)
	end

return self
end return GeldAnzeige