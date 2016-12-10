require("renderer.SpriteBatch")

function WorldRenderer(data,w,h)
	-----------------------
	-- Background Sprite
	-- StaticObject Sprite
	-- DynamicObjects

	local self = {
		backgroundSprite = SpriteBatch(16,16,w,h,love.graphics.newImage("assets/ground.png")),
		staticObjectSprite = SpriteBatch(16,32,w,h,love.graphics.newImage("assets/objects.png")),
		data = data
	}

	function self.load()
		self.backgroundSprite.load()
		self.staticObjectSprite.load()
	end

	function self.update(dt)
		if self.backgroundSprite == nil and self.staticObjectSprite == nil then
			return
		end

		for x = 0, w do
			for y = 0, h do
				local tile = self.data.map[x][y]
				if tile.dirty == true then
					self.backgroundSprite.update(x,y,tile.sprite)
					if tile.obj ~= nil then
						self.staticObjectSprite.update(x,y,tile.obj.sprite)
					end

					tile.dirty = false
				end
			end
		end

		self.backgroundSprite.flush()
		self.staticObjectSprite.flush()
	end

	function self.draw()
		if self.backgroundSprite == nil and self.staticObjectSprite == nil then
			return
		end

		self.backgroundSprite.draw()
		self.staticObjectSprite.draw()

		---------------------
		-- Draw Path
		---------------------
		local lastNode = nil
		for i,node in ipairs(self.data["path"]) do
			if lastNode ~= nil then
				love.graphics.line(lastNode.x*16-8,lastNode.y*16-8,node.x*16-8,node.y*16-8)
			end
			lastNode = node
		end
	end

	return self
end
return WorldRenderer