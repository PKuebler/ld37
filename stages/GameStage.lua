require("logic.WorldController")
require("renderer.WorldRenderer")
require("ui.UiManager")
require("assets.AssetManager")
function GameStage()

	-----------------------
	-- Von aussen erreichbar
	-----------------------
	local self = {
		data = {
			dynamicObjects = {},
			map = {}
		}
	}

	-----------------------
	-- Lokal
	-----------------------

	local assetManager = AssetManager()

	local worldController = WorldController(self.data)
	local worldRenderer = WorldRenderer(self.data, 30, 30)
	local uiManager = nil


	function self.start()
		--self.renderer = Renderer()
		--self.unitController = UnitController()
		print("Game Start")
		worldRenderer.load()
		worldController.load()
		assetManager.load()
		uiManager = UiManager(assetManager)
		uiManager.load()
	end

	function self.update(dt)
		worldRenderer.update(dt)
		--self.unitController.update(dt, self.data)
	end

	function self.draw()
		worldRenderer.draw()
		uiManager.draw()
	end

	function self.stop()
		print("Game Stop")
	end

	return self
end

return GameStage