require("logic.WorldController")
require("renderer.WorldRenderer")
require("ui.UiManager")
require("ui.ButtonUI")
require("logic.InputController")

function GameStage(StageManager, data)

	-----------------------
	-- Von aussen erreichbar
	-----------------------
	local self = {
		data = data
	}
	self.data.money = 50
	self.data.tileSize = 32
	self.data.dynamicObjects = {}
	self.data.map = {}
	self.data.startPoint = {x = 0, y = 5}
	self.data.endPoint = {x = 24, y = 15}
	self.data.play = true

	-----------------------
	-- Lokal
	-----------------------

	local worldController = WorldController(self.data)
	local worldRenderer = WorldRenderer(self.data, 24, 15)
	local uiManager = nil
	local inputController = nil

	function self.start()
		print("Game Start")
		worldRenderer.load()
		worldController.load()

		----------------------
		-- UI
		----------------------
		uiManager = UiManager(self.data)
		inputController = InputController(self.data, uiManager, worldController)
	end

	function self.update(dt)
		if self.data.play == true then
			worldController.update(dt)
			worldRenderer.update(dt)
			uiManager.update(dt)
			inputController.update(dt)
		end
	end

	function self.draw()
		if self.data.play == true then
			love.graphics.setFont(self.data.assets.font40)
			love.graphics.setColor(19,24,39,255)
			love.graphics.rectangle("fill", 0, love.graphics.getHeight()-(self.data.tileSize*3), love.graphics.getWidth(), self.data.tileSize*3)

			worldRenderer.draw()
			uiManager.draw()
			inputController.draw()
			love.graphics.setFont(self.data.assets.font12)
			love.graphics.printf("units "..table.getn(self.data.dynamicObjects), love.graphics.getWidth()-205, 130, 200, "right")
		else

		end
	end

	function self.stop()
		print("Game Stop")
		uiManager = nil
	end

	function self.mousereleased( x, y, button, istouch )
		uiManager.mousereleased( x, y, button, istouch )
		inputController.mousereleased( x, y, button, istouch )
	end

	return self
end

return GameStage