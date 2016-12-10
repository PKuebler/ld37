function WorldRenderer(controller)
	local self = {
	}
	-- local spritebatch = nil
	local worldController = controller
	function self.load()
	end

	function self.update()
	end
	
	function self.draw()
		worldController.tilemap.draw()
	end

	return self
end
return WorldRenderer