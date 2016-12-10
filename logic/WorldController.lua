require("logic.TileMap")

function WorldController()
	local self = {
		tilemap = TileMap(20,20,16,16),
		factory = require("logic.Factory")
	}

	function self.load()
		print("worldController")
		self.tilemap.load()
	end
	function self.update()
	end
	function self.draw()
	end

	return self
end

return WorldController