function SpriteBatch(tileW,tileH,doubleHight,mapW,mapH,tileset)
	local self = {
		tileSize = {w = tileW, h = tileH},
		imgTileH = tileH,
		size = {w = mapW, h = mapH },
		spritebatch = nil,
		idmap = {}, -- tile spritebatch ids
		quads = {}
	}

	if doubleHight == true then
		self.imgTileH = tileH*2
	end

	function self.load()
		self.spritebatch = love.graphics.newSpriteBatch(tileset, (self.size.w+1)*(self.size.h+1), "stream")

		self.spritebatch:clear()
		----------------------------------
		-- Create Quads
		----------------------------------
		local i = 0
		for y = 0, (tileset:getHeight()/self.imgTileH)-1 do
			for x = 0, (tileset:getWidth()/self.tileSize.w)-1 do
				self.quads[i] = love.graphics.newQuad(x*self.tileSize.w, y*self.imgTileH, self.tileSize.w, self.imgTileH, tileset:getWidth(), tileset:getHeight())
				i = i+1
			end
		end
        ----------------------------------
		-- Fill first one
		----------------------------------
		local i = 0

		local padding = 0
		if doubleHight == true then
			padding = -self.tileSize.h
		end

		for x=0,self.size.w do
            self.idmap[x] = {}
            for y=0,self.size.h do
            	i = i+1
                self.spritebatch:setColor({0,0,0})
                self.idmap[x][y] = self.spritebatch:add(self.quads[0], x*self.tileSize.w, y*self.tileSize.h+padding)
            end 
        end
        self.spritebatch:flush()
	end

	function self.update(x,y,sprite,color)
		local padding = 0
		if doubleHight == true then
			padding = -self.tileSize.h
		end

        self.spritebatch:setColor({255,255,255})
		self.spritebatch:set(self.idmap[x][y], self.quads[sprite], x*self.tileSize.w, y*self.tileSize.h+padding)
	end

	function self.flush()
		self.spritebatch:flush()
	end

	function self.draw()
		love.graphics.draw(self.spritebatch)
	end

	return self
end
return SpriteBatch