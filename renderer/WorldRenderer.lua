require("renderer.SpriteBatch")

function WorldRenderer(data,w,h)
	-----------------------
	-- Background Sprite
	-- StaticObject Sprite
	-- DynamicObjects

	local self = {
		backgroundSprite = SpriteBatch(data.tileSize,data.tileSize,false,w,h,data.assets.ground),
		staticObjectSprite = SpriteBatch(data.tileSize,data.tileSize,true,w,h,data.assets.objects),
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

		love.graphics.setColor(255,255,255,255)

		self.backgroundSprite.draw()
		self.staticObjectSprite.draw()

		for i,v in ipairs(self.data.dynamicObjects) do
			love.graphics.rectangle("fill", v.x+(self.data.tileSize/2), v.y+(self.data.tileSize/2)-10, 5, 10)
		end

		if self.data.isWave == false then
			love.graphics.setFont(self.data.assets.font40)
			love.graphics.print("Next Wave "..math.floor(self.data.nextWave),love.graphics.getWidth()/3,40)
		end

		---------------------
		-- Draw Debug
		---------------------
		love.graphics.setColor(255,255,255,100)
		love.graphics.setLineWidth( 5 )
		local lastNode = nil
		for i,node in ipairs(self.data["path"]) do
			if lastNode ~= nil then
				love.graphics.line(lastNode.x*self.data.tileSize+(self.data.tileSize/2),lastNode.y*self.data.tileSize+(self.data.tileSize/2),node.x*self.data.tileSize+(self.data.tileSize/2),node.y*self.data.tileSize+(self.data.tileSize/2))
			end
			lastNode = node
		end
	end

	return self
end
return WorldRenderer