function BauMenu()
	local self ={
		name = "bau",
		visible = true
	}

	local x = 68
	local y = 496
	local width = 128
	local height = 32
	
	function self.load()
	end

	function self.update()
	end

	function self.draw()
		love.graphics.rectangle("fill", x, y, width, height )
	end
	return self
end
return BauMenu