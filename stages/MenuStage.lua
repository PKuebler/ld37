require("ui.UiManager")
require("ui.ButtonUI")

function MenuStage(StageManager, data)
	local self = {
		data = data
	}

	local uiManager = nil

	function self.start()
		uiManager = UiManager(self.data)

		----------------------------------
		-- Start Game
		----------------------------------
		local g = ButtonUI()
		g.y = 200
		g.x = 100
		g.text = "Start"
		g.func = function()
			StageManager.toggle("game")
		end
		uiManager.add("start", g)
		uiManager.open("start")
		----------------------------------
		-- Credits
		----------------------------------
		local c = ButtonUI()
		c.y = 250
		c.x = 100
		c.text = "Credits"
		c.func = function()
			StageManager.toggle("credits")
		end
		uiManager.add("credits", c)
		uiManager.open("credits")
		----------------------------------
		-- Options?
		----------------------------------
		local o = ButtonUI()
		o.y = 300
		o.x = 100
		o.func = function()
			StageManager.toggle("options")
		end
		uiManager.add("options", o)
--		uiManager.open("options")

	end

	function self.update(dt)
		-- updatemnger
		uiManager.update(dt)
	end

	function self.draw()
		love.graphics.setFont(self.data.assets.font40)
		love.graphics.setColor(255,255,255,255)
		love.graphics.print("Menu", 100,50)
		
		love.graphics.rectangle("fill", 100, 110, 50, 5)

		-- render btnmnger
		uiManager.draw()
	end

	function self.stop()
		uiManager = nil
	end

	function self.mousereleased( x, y, button, istouch )
		uiManager.mousereleased( x, y, button, istouch )
	end

	return self
end

return MenuStage