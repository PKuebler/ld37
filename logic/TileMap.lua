function TileMap(data, w,h)
	local self = {
		data = data
	}

	function self.load()
		self.data.mapSize = { w = w, h = h }

		-- fill array
		for x = 0, w do
			self.data.map[x] = {}

			for y = 0, h do
				local sprite = 1
				local blocked = false

				if y == self.data.startPoint.y and x == self.data.startPoint.x then
					sprite = 2
				elseif y == self.data.endPoint.y and x == self.data.endPoint.x then
					sprite = 3
				elseif y == 0 and x == 0 then
					sprite = 7
					blocked = true
				elseif y == 0 and x == w then
					sprite = 6
					blocked = true
				elseif y == h and x == w then
					sprite = 5
					blocked = true
				elseif y == h and x == 0 then
					sprite = 4
					blocked = true
				elseif x == 0 then
					sprite = 8
					blocked = true
				elseif x == w then
					sprite = 9
					blocked = true
				elseif y == 0 then
					sprite = 10
					blocked = true
				elseif y == h then
					sprite = 11
					blocked = true
				end

				self.data.map[x][y] = {
					sprite = sprite,
					-- pathfinding need coords
					x = x, 
					y = y,
					-- if no object on tile -> nil
					obj = nil,
					dirty = true,
					blocked = blocked,
					orientation = 0, -- 0 = west, 1 = north, 2 = east, 3 = south
					useBy = 0 -- obj on this tile is currently used by X clients
				}
			end
		end
	end

	return self
end

return TileMap