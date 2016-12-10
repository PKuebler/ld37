function SpriteBatch(tileW,tileH,mapW,mapH,tileset)
	local self = {
		tileSize = {w = tileW, h = tileH},
		size = {w = mapW, h = mapH },
		spritebatch = nil,
		idmap = {}, -- tile spritebatch ids
		quads = {}
	}

	function self.load()
		self.spritebatch = love.graphics.newSpriteBatch(tileset, (self.size.w+1)*(self.size.h+1), "stream")

		self.spritebatch:clear()
		----------------------------------
		-- Create Quads
		----------------------------------
        for i = 0, (tileset:getWidth()/self.tileSize.w)*(tileset:getHeight()/self.tileSize.h) do
            local x,y = (i%self.tileSize.h), math.floor(i/self.tileSize.h)
            self.quads[i] = love.graphics.newQuad(x*self.tileSize.w, y*self.tileSize.h, self.tileSize.w, self.tileSize.h, tileset:getWidth(), tileset:getHeight())
        end
        ----------------------------------
		-- Fill first one
		----------------------------------
		local i = 0
		for x=0,self.size.w do
            self.idmap[x] = {}
            for y=0,self.size.h do
            	i = i+1
                self.spritebatch:setColor({0,0,0})
                self.idmap[x][y] = self.spritebatch:add(self.quads[0], x*self.tileSize.w, y*self.tileSize.h)
            end 
        end
        print(i)
        self.spritebatch:flush()
	end

	function self.update(x,y,sprite,color)
        self.spritebatch:setColor({255,255,255})
		self.spritebatch:set(self.idmap[x][y], self.quads[sprite], x*self.tileSize.w, y*self.tileSize.h)
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