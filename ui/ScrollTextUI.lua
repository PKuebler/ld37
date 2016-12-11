function ScrollTextUI(text)
	local self = {
		x = 0,
		y = 0,
		w = 200,
		h = 200,
		func = func,
		text = "",
		scroll = 1,
		fontSize = 12,
		lineHeight = 18
	}

	function self.load(data)
		self.addText(text)
	end

	function self.addText(text)
		local _, t = love.graphics.getFont():getWrap(text, self.w-10)
		self.text = t
	end

	function self.mousereleased( x, y, button, istouch )
		if self.func ~= nil then
			self.func()
		end
	end

	function self.draw()
		love.graphics.push()
		love.graphics.setFont(love.graphics.newFont(self.fontSize))

		local lines = math.floor(self.h/self.lineHeight)

		love.graphics.setColor(22,28,44,255)
		love.graphics.rectangle("fill", self.w-5, 0, 5, self.h)
		love.graphics.setColor(149,168,72,255)
		local steps = self.h/table.getn(self.text)
		local start = (self.scroll-1)*steps
		love.graphics.rectangle("fill", self.w-5, start, 5, steps*lines)

		love.graphics.setColor(255,255,255,255)
		for i=1,lines do
			local line = self.text[i+self.scroll]
			if line ~= nil then
				love.graphics.print(line, 0,(i-1)*self.lineHeight)
			end
		end

	--	love.graphics.printf({{255,255,255},t}, 0, 0, self.w)

		love.graphics.pop()
	end

	function self.wheelmoved(x,y)
		if self.hover then
			local rows = math.floor(self.h/self.lineHeight)
			self.scroll = math.min(math.max(1, self.scroll-y),math.max(table.getn(self.text)-rows, rows))
		end
	end

	return self
end

return ScrollTextUI