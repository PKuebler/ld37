function ButtonUI(func)
	local self = {
		data = nil,
		x = 0,
		y = 0,
		w = 30,
		h = 34,
		func = func,
		text = "B",
		bgcolor = {255,255,255},
		hoverbgcolor = {200,200,200},
		color = {0,0,0},
		hovercolor = {0,0,0}
	}

	function self.load(data)
		self.data = data
	end

	function self.mousereleased( x, y, button, istouch )
		if self.func ~= nil then
			self.func()
		end
	end

	function self.getSize(text)
		return love.graphics.getFont():getWidth(text)+30
	end

	function self.update(dt)
		self.w = love.graphics.getFont():getWidth(self.text)+30
	end

	function self.draw()
		love.graphics.push()
		love.graphics.setColor(self.bgcolor)
		if self.hover then
			love.graphics.setColor(self.hoverbgcolor)
		end
		love.graphics.rectangle("fill", 0, 0, self.w, self.h)

		love.graphics.setColor(self.color)
		if self.hover then
			love.graphics.setColor(self.hovercolor)
		end
		local h = 8
		if self.borderTop ~= nil then
			h = h+5
		end
		love.graphics.setFont(self.data.assets.font16)
		love.graphics.print(self.text, 15,h)

		if self.borderTop ~= nil and self.hover then
			love.graphics.setColor(self.borderTop)
			love.graphics.rectangle("fill", 0, 0, self.w, 4)
		end
		love.graphics.pop()
	end

	return self
end

return StatusUI