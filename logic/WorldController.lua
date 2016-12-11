require("logic.TileMap")
require("logic.Pathfinder")
require("logic.PuppetPlayer")
require("logic.UnitController")

function WorldController(data)
	local self = {
		data = data,
		tilemap = TileMap(data, 24, 15),
		pathfinder = nil,
		puppetPlayer = nil,
		unitcontroller = nil
	}

	self.data.factory = require("logic.Factory")

	function self.checkPath()
		return self.pathfinder.getPath(self.data.startPoint.x,self.data.startPoint.y,self.data.endPoint.x,self.data.endPoint.y)
	end
	function self.pathUpdate()
		self.data["path"] = self.checkPath()
		if self.unitcontroller then
			self.unitcontroller.pathUpdate()
		end
	end

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
		self.pathUpdate()
		-------------------------
		-- Puppenspieler
		-------------------------
		self.puppetPlayer = PuppetPlayer(self.data)
		self.puppetPlayer.load()
		-------------------------
		-- UnitController
		-------------------------
		self.unitcontroller = UnitController(self.data)
		-------------------------
	end

	function self.update(dt)
		self.puppetPlayer.update(dt)
		self.unitcontroller.update(dt)
	end
	function self.draw()
	end

	return self
end

return WorldController