local loader = require '.utils.love-loader'

function SplashStage(StageManager, data)
	local self = {}

	function self.start()
		self.finishedLoading = false

		data.assets = {
			font40 = love.graphics.newFont(40),
			font16 = love.graphics.newFont(16),
			font12 = love.graphics.newFont(12),
			font8 = love.graphics.newFont(8)
		}

		loader.newImage(data.assets, 'ground', 'assets/ground.png')
		loader.newImage(data.assets, 'objects', 'assets/objects.png')
		loader.start(function()
			self.finishedLoading = true
		end)
	end

	function self.update(dt)
		if not self.finishedLoading then
			loader.update()
		else
			StageManager.toggle('menu')
		end
	end

	function self.draw()
		love.graphics.setFont(data.assets.font40)
		love.graphics.setColor(255,255,255,255)
		love.graphics.print("Loading", 100,50)
		
		love.graphics.rectangle("fill", 100, 110, 50, 5)
		-- render btnmnger
		love.graphics.setFont(data.assets.font16)
		local percent = 0
		if loader.resourceCount ~= 0 then percent = loader.loadedCount / loader.resourceCount end
		love.graphics.print(("Loading .. %d%%"):format(percent*100), 100, 150)
	end

	function self.stop()
	end

	function self.mousereleased( x, y, button, istouch )
	end

	return self
end

return SplashStage
