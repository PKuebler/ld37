function StatusUI(data)
	local self = {
		data = nil,
		x = 0,
		y = 0,
		w = 120,
		h = 30
	}

	function self.load(data)
		self.data = data
	end

	function self.draw()
		love.graphics.push()
		love.graphics.rectangle("fill", 0, 0, self.w, self.h)
		love.graphics.setColor(0,0,0,255)
		love.graphics.setFont(love.graphics.newFont(12))

		love.graphics.print("Wave "..self.data.waves.." "..self.data.money.. "$", 16,8)
		love.graphics.setColor(255,255,255,255)
		love.graphics.pop()
	end

	return self
end

return StatusUI