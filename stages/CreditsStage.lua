require("ui.UiManager")
require("ui.ButtonUI")
require("ui.ScrollTextUI")

function CreditsStage(StageManager, data)
	local self = {
		data = data
	}

	local uiManager = nil

	function self.start()
		uiManager = UiManager(self.data)

		----------------------------------
		-- Zurück
		----------------------------------
		local g = ButtonUI()
		g.y = love.graphics.getHeight()-80
		g.x = 100
		g.text = "Back"
		g.func = function()
			StageManager.toggle("menu")
		end
		uiManager.add("menu", g)
		uiManager.open("menu")
		----------------------------------
		-- Credits
		----------------------------------
		local text = ""
		for line in love.filesystem.lines("assets/credits.txt") do
			text = text..line.."\n"
		end
		local s = ScrollTextUI(text)
		s.y = 150
		s.x = 100
		s.w = love.graphics.getWidth()-150
		s.h = love.graphics.getHeight()-250
		uiManager.add("scroll", s)
		uiManager.open("scroll")
	end

	function self.update(dt)
		uiManager.update(dt)
	end

	function self.draw()
		love.graphics.push()
		love.graphics.setFont(self.data.assets.font40)
		love.graphics.setColor(255,255,255,255)
		love.graphics.print("Credits", 100,50)
		
		love.graphics.rectangle("fill", 100, 110, 50, 5)
		love.graphics.pop()
		
		uiManager.draw()
	end

	function self.stop()
		uiManager = nil
	end

	function self.mousereleased( x, y, button, istouch )
		uiManager.mousereleased( x, y, button, istouch )
	end

	function self.wheelmoved(x,y)
		uiManager.wheelmoved(x,y)
	end

	return self
end

return CreditsStage
