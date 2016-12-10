function TileMap(data, w,h)
	local self = {
		data = data
	}

	function self.load()
		-- fill array
		for x = 0, w do
			self.data.map[x] = {}

			for y = 0, h do
				self.data.map[x][y] = {
					sprite = 1,
					-- pathfinding need coords
					x = x, 
					y = y,
					-- if no object on tile -> nil
					obj = nil,
					dirty = true,
					blocked = false,
					orientation = 0, -- 0 = west, 1 = north, 2 = east, 3 = south
					useBy = 0 -- obj on this tile is currently used by X clients
				}
			end
		end
	end

	return self
end

return TileMap