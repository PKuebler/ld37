require("logic.WorldController")
require("renderer.WorldRenderer")

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
	local worldController = WorldController(self.data)
	local worldRenderer = WorldRenderer(self.data, 30, 30)

	function self.start()
		--self.renderer = Renderer()
		--self.unitController = UnitController()
		print("Game Start")
		worldRenderer.load()
		worldController.load()
	end

	function self.update(dt)
		worldRenderer.update(dt)
		--self.unitController.update(dt, self.data)
	end

	function self.draw()
		worldRenderer.draw()
	end

	function self.stop()
		print("Game Stop")
	end

	return self
end

return GameStage