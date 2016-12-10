require("ui.GeldAnzeige")
require("ui.BauMenu")

-- laedt verwaltet und blendet menu elemente ein
function UiManager(aM)

	local self = {
		menuList = {}
	}
	
	local assetManager = aM
	local geldAnzeige = GeldAnzeige()
	local bauMenu = BauMenu()

	function self.load()
		self.menuList[geldAnzeige.name] = geldAnzeige
		self.menuList[bauMenu.name] = bauMenu
	end

	function self.update()
	end

	function self.draw()
		for k, v in pairs(self.menuList) do
			if v.visible == true then
			v.draw(assetManager.get("font"))
			end
		end
	end

	function self.open(menuId)
		if menuList[name]~= nil and menuList[name].visible == false then
		menuList[name].visible = true
		end
	end

	function self.close(menuId)
		if menuList[name]~= nil and menuList[name].visible == true then
		menuList[name].visible = false
		end
	end

	return self
end

return UiManager