require("logic.TileMap")
require("logic.Pathfinder")
require("logic.PuppetPlayer")
require("logic.UnitController")

function WorldController(data)
	local self = {
		data = data,
		tilemap = TileMap(data, 30, 30),
		pathfinder = nil,
		puppetPlayer = nil,
		unitcontroller = nil
	}

	self.data.factory = require("logic.Factory")

	function self.load()
		-------------------------
		-- Init Tilemap
		-- - Fill self.data.map Array
		-------------------------
		self.tilemap.load()
		-- DEBUG
		self.data.map[6][self.data.startPoint.y].obj = self.data.factory.oneArmedBandit
		self.data.map[6][self.data.startPoint.y].blocked = true
		self.data.map[7][self.data.startPoint.y].obj = self.data.factory.bench
		self.data.map[7][self.data.startPoint.y].blocked = true
		self.data.map[6][self.data.startPoint.y-1].obj = self.data.factory.easycash
		self.data.map[6][self.data.startPoint.y-1].blocked = true
		self.data.map[6][self.data.startPoint.y-2].obj = self.data.factory.digitalBandit
		self.data.map[6][self.data.startPoint.y-2].blocked = true

		-------------------------
		-- Pathfinder
		-------------------------
		self.pathfinder = Pathfinder(self.data.map)
		self.data["path"] = nil
		-- calc first route
		self.data["path"] = self.pathfinder.getPath(self.data.startPoint.x,self.data.startPoint.y,self.data.endPoint.x,self.data.endPoint.y)
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