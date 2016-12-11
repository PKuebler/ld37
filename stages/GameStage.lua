require("logic.WorldController")
require("renderer.WorldRenderer")
require("ui.UiManager")

function GameStage(StageManager, data)

	-----------------------
	-- Von aussen erreichbar
	-----------------------
	local self = {
		data = data
	}
	self.data.money = 0
	self.data.tileSize = 32
	self.data.dynamicObjects = {}
	self.data.map = {}
	self.data.startPoint = {x = 0, y = 5}
	self.data.endPoint = {x = 24, y = 15}

	-----------------------
	-- Lokal
	-----------------------

	local worldController = WorldController(self.data)
	local worldRenderer = WorldRenderer(self.data, 24, 18)
	local uiManager = nil

	function self.start()
		print("Game Start")
		worldRenderer.load()
		worldController.load()
		--uiManager = UiManager(self.data)
		--uiManager.load()
	end

	function self.update(dt)
		worldController.update(dt)
		worldRenderer.update(dt)
	end

	function self.draw()
		worldRenderer.draw()
		--uiManager.draw()
	end

	function self.stop()
		print("Game Stop")
	end

	return self
end

return GameStage