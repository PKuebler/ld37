require("logic.WorldController")
require("renderer.WorldRenderer")
require("ui.UiManager")
function GameStage()

	-----------------------
	-- Von aussen erreichbar
	-----------------------
	local self = {
		data = {
			units = {}
		}--,
		--renderer = nil,
		--unitController = nil
	}

	-----------------------
	-- Lokal
	-----------------------
	local worldController = WorldController()
	local worldRenderer = WorldRenderer(worldController)
	local uiManager = UiManager()

	-----------------------
	-- Test Daten
	-----------------------
	self.data.units[#self.data.units+1] = {
		x = 10,
		y = 10
	}

	function self.start()
		--self.renderer = Renderer()
		--self.unitController = UnitController()
		print("Game Start")
		worldController.load()
		uiManager.load()
	end

	function self.update(dt)
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