function InputController(data, ui, worldController)
	local self = {
		data = data,
		factory = nil,
		build = nil
	}

	local img = love.graphics.newImage("assets/objects.png")

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
			self.factory = v
		end
		ui.add(k.."-btn", b)
		ui.open(k.."-btn")
		pos = pos+b.getSize(text)
	end

	function self.update(dt)
		if self.build ~= nil then
			self.data.money = math.max(0,self.data.money-self.factory.buildcosts)
			self.data.map[self.build.x][self.build.y].obj = self.factory
			self.data.map[self.build.x][self.build.y].blocked = true
			self.data.map[self.build.x][self.build.y].dirty = true
			worldController.pathUpdate()
			self.factory = nil
			self.build = nil
		end
	end

	function self.draw()
		if self.factory ~= nil then
			love.graphics.setColor({255,255,255,60})
			local x, y = love.mouse.getPosition()
			local quad = love.graphics.newQuad(0, math.floor(self.factory.sprite/4)*(self.data.tileSize*2), self.data.tileSize, self.data.tileSize*2, img:getWidth(), img:getHeight())
			love.graphics.draw(img, quad, x, y-self.data.tileSize)
		end
	end

	function self.mousereleased( x, y, button, istouch )
		if button == 2 and self.factory ~= nil then
			self.factory = nil
		elseif self.factory ~= nil then
			local tx = math.floor(x/self.data.tileSize)
			local ty = math.floor(y/self.data.tileSize)

			if tx <= self.data.mapSize.w and ty <= self.data.mapSize.h and self.factory.buildcosts <= self.data.money then
				self.build = {x = tx,y = ty}
			end
		end
	end

	return self
end

return InputController