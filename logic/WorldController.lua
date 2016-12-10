require("logic.TileMap")
require("logic.Pathfinder")

function WorldController(data)
	local self = {
		data = data,
		tilemap = TileMap(data, 30, 30),
		factory = require("logic.Factory"),
		pathfinder = nil,
		startPoint = {x = 0, y = 10},
		endPoint = {x = 30, y = 20}
	}

	function self.load()
		-------------------------
		-- Init Tilemap
		-- - Fill self.data.map Array
		-------------------------
		self.tilemap.load()
		-------------------------
		-- Pathfinder
		-------------------------
		self.pathfinder = Pathfinder(self.data.map)
		self.data["path"] = nil
		-- calc first route
		self.data["path"] = self.pathfinder.getPath(self.startPoint.x,self.startPoint.y,self.endPoint.x,self.endPoint.y)
	end

	function self.update()
	end
	function self.draw()
	end

	return self
end

return WorldController