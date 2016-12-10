local loader = require '.utils.love-loader'

function SplashStage(StageManager, data)
	local self = {}

	function self.start()
		self.finishedLoading = false

		loader.newImage(data.assets, 'tileset', 'assets/16x16_sm.png')
		loader.start(function()
			self.finishedLoading = true
		end)
	end

	function self.update(dt)
		if not self.finishedLoading then
			loader.update()
		else
			StageManager.toggle('create')
		end
	end

	function self.draw()
		-- render btnmnger
		local percent = 0
		if loader.resourceCount ~= 0 then percent = loader.loadedCount / loader.resourceCount end
		love.graphics.print(("Loading .. %d%%"):format(percent*100), 100, 100)
	end

	function self.stop()
	end

	return self
end

return SplashStage
