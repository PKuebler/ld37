require("TileMap")

function WorldController()
	local self = {
		tilemap = TileMap()
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