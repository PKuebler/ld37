require("ui.GeldAnzeige")

-- laedt verwaltet und blendet menu elemente ein
function UiManager()

	local self = {
		menuList = {}
	}

	local geldAnzeige = GeldAnzeige(1)

	function self.load()
		self.menuList[geldAnzeige.menuId] = geldAnzeige
	end

	function self.update()
	end

	function self.draw()
		for k, v in pairs(self.menuList) do
			if v.visible == true then
			v.draw()
			end
		end
	end

	function self.open(menuId)
		if menuList[menuId]~= nil and menuList[menuId].visible == false then
		menuList[menuId].visible = true
		end
	end

	function self.close(menuId)
		if menuList[menuId]~= nil and menuList[menuId].visible == true then
		menuList[menuId].visible = false
		end
	end

	return self
end

return UiManager