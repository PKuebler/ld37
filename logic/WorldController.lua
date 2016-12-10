require("logic.TileMap")
require("logic.Pathfinder")
require("logic.PuppetPlayer")
require("logic.UnitController")

function WorldController(data)
	local self = {
		data = data,
		tilemap = TileMap(data, 30, 30),
		factory = require("logic.Factory"),
		pathfinder = nil,
		puppetPlayer = nil,
		unitcontroller = nil
	}

	function self.load()
		-------------------------
		-- Init Tilemap
		-- - Fill self.data.map Array
		-------------------------
		self.tilemap.load()
		-- DEBUG
		self.data.map[6][self.data.startPoint.y].obj = self.factory.oneArmedBandit
		self.data.map[6][self.data.startPoint.y].blocked = true
		self.data.map[7][self.data.startPoint.y].obj = self.factory.bench
		self.data.map[7][self.data.startPoint.y].blocked = true
		self.data.map[6][self.data.startPoint.y-1].obj = self.factory.easycash
		self.data.map[6][self.data.startPoint.y-1].blocked = true
		self.data.map[6][self.data.startPoint.y-2].obj = self.factory.digitalBandit
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
		-- - Start Game
		-- - Start Wave
		-- - End Wave
		-- - End Game
		-------------------------
		-- UnitController
		-------------------------
		self.unitcontroller = UnitController(self.data)
		-- - Move Unit on path
		-- - Check Automates
		-- - Use Automates
		-- - Get Money
		-- - Wait
		-- - Go Out
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