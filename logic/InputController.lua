function InputController(data, ui)
	local self = {
		data = data
	}

	--------------------
	-- Status
	--------------------
	ui.add("status", require("ui.StatusUI")())
	ui.open("status")

	--------------------
	-- Build Menu
	--------------------
	local pos = 0
	for k,v in pairs(self.data.factory) do
		local text = v.name.."\nCost: "..v.buildcosts.."$\n"
		if v.money < 0 then
			text = text.."Give: "..v.money*(-1).."$\n"
		end
		local b = ButtonUI()
		b.y = love.graphics.getHeight()-(data.tileSize*3)
		b.x = pos
		b.h = data.tileSize*3
		b.text = text
		b.bgcolor = {19,24,39}
		b.hoverbgcolor = {22,28,44}
		b.hovercolor = {255,255,255}
		b.color = {85,96,110}
		b.borderTop = {233,212,120}
		b.func = function()
			print("klick")
		end
		ui.add(k.."-btn", b)
		ui.open(k.."-btn")
		pos = pos+b.getSize(text)
	end

	function self.update(dt)
	end

	return self
end

return InputController