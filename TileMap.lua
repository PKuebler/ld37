function TileMap(xSize,ySize,tileHeight,tileWidth)

	local self = { 
		idmap = {},
		mapData = {}
	}

	local xTiles = xSize
	local yTiles = ySize
	local height = tileHeight
	local width = tileWidth




	function self.load()

		print("tilemapLoad")
		-- fill tilemap array
	    for x = 1, xTiles do
	    	self.idmap[x] = {}
	    	self.mapData[x] = {}
	    	for y = 1, yTiles do

			self.mapData[x][y] = {
				sprite = 5,
				dirty = true,
				---------------
				-- orientation
				-- a = west, w = north, d = east, s = south
				---------------
				orientation = 's'
			}
	    	--idmap[x][y] = spriteBatch:add(quads[5],x*tilesize,y*tilesize)

	    	end
	    end 
	end

	function self.update()
	end

	function self.draw()
		for i = 1, xTiles do
			for j = 1, yTiles do
				love.graphics.rectangle("line", i*xSize, j*ySize, tileWidth, tileHeight )
			end

		end
	end


	return self
end

return TileMap