function TileMap(xSize,ySize,tileHeight,tileWidth)
	local xTiles = xSize
	local yTiles = ySize
	local height = tileHeight
	local width = tileWidth
	local idmap = {}
	local mapData = {}

	function load()

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

	function update()
	end

	function draw()
	end

	function getIdMap()
		return idmap
	end 

	function getMapData()
		return mapData
	end 


end

return TileMap