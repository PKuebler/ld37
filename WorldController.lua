require("TileMap")
function WorldController()
	local tilemap = TileMap()
	function load()
		print("worldController")
		tilemap.load()
	end
	function update()
	end
	function draw()
	end
end