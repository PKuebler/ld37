function GeldAnzeige(theMenuId)
	local self ={
		cash = 100,
		menuId = theMenuId,
		visible = true
	}

	local x = 0
	local y = 496
	local width = 32
	local height = 32

	function self.load()
		self.visible = true
		print(cash)
	end

	function self.update()
	end

	function self.draw()
		love.graphics.rectangle("fill", x, y, width, height )
	end

return self
end return GeldAnzeige