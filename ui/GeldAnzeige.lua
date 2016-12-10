function GeldAnzeige(theMenuId)
	self ={
		cash = 100,
		menuId = theMenuId,
		visible = false
	}

	local x = 0
	local y = 0
	local width = 50
	local height = 50

	function self.load()
		self.visible = true
	end

	function self.update()
	end

	function self.draw()
		love.graphics.rectangle("fill", x, y, width, height )
	end

return self
end return GeldAnzeige