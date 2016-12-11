-- laedt verwaltet und blendet menu elemente ein
function UiManager(data)

	local self = {
		data = data,
		uiList = {}
	}

	function self.add(name, ui)
		ui.load(self.data)
		self.uiList[name] = ui
		self.uiList[name].visible = false
	end

	function self.get(name)
		return self.uiList[name]
	end

	function self.update(dt)
		local x, y = love.mouse.getPosition()
		for k, v in pairs(self.uiList) do
			if v.visible == true and v.x < x and v.y < y and v.x+v.w > x and v.y+v.h > y then
				v.hover = true
			else
				v.hover = false
			end

			if v.visible == true and v.update ~= nil then
				v.update(dt)
			end
		end
	end

	function self.draw()
		for k, v in pairs(self.uiList) do
			if v.visible == true then
				love.graphics.push()
				love.graphics.translate(v.x, v.y)
				v.draw()
				love.graphics.pop()
			end
		end
	end

	function self.open(name)
		if self.uiList[name]~= nil and self.uiList[name].visible == false then
			self.uiList[name].visible = true
		end
	end

	function self.close(name)
		if self.uiList[name]~= nil and self.uiList[name].visible == true then
			self.uiList[name].visible = false
		end
	end

	function self.mousereleased( x, y, button, istouch )
		for k, v in pairs(self.uiList) do
			if v.mousereleased ~= nil and v.visible == true and v.hover then
				v.mousereleased( x, y, button, istouch )
			end
		end
	end

	function self.wheelmoved(x,y)
		for k, v in pairs(self.uiList) do
			if v.wheelmoved ~= nil and v.visible == true then
				v.wheelmoved( x, y)
			end
		end
	end

	return self
end

return UiManager