function ButtonManager()
	local self = {
		buttons = {}
	}

	function self.add(name, x, y, w, h)
		self.buttons[name] = {x=x,y=y,w=w,h=h}
	end

	function self.update()
	end

	function self.draw()

		for k, v in pairs(self.buttons) do
			love.graphics.rectangle("line",v.x,v.y,v.w,v.h)
		end

		-- love.graphics.rectangle("fill", x, y, w, h )
	end
	return self
end

return ButtonManager



