function TileMap(xSize,ySize,tileHeight,tileWidth)

	local self = { 
	}

	local xTiles = xSize
	local yTiles = ySize
	local height = tileHeight
	local width = tileWidth
	local idmap = {}
	local mapData = {}



	function self.load()

		print("tilemapLoad")
		-- fill tilemap array
	    for x = 1, xTiles do
	    	idmap[x] = {}
	    	mapData[x] = {}
	    	for y = 1, yTiles do

			mapData[x][y] = {
				sprite = 5,
				dirty = true
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

	function self.getIdMap()
		return idmap
	end 

	function self.getMapData()
		return mapData
	end 

	return self
end

return TileMap