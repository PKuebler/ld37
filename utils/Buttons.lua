function ButtonManager()
	local self = {
		buttons = {}
	}

	function self.add(name, x, y, w, h)
		print("self")
		self.buttons[name] = {x,y,w,h}
	end

	function self.update()
	end

	function self.draw()

		for k, v in pairs(buttons) do
			print(k,v) 
		end

		-- love.graphics.rectangle("fill", x, y, w, h )
	end

end

return ButtonManager



