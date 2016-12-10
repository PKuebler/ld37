function ButtonManager()
	local self = {
		buttons = {},
		current = nil
	}

	function self.add(name, x, y, w, h)
		self.buttons[name] = {x,y,w,h}
	end

	function self.update()
	end

	function self.draw()
	end

end





