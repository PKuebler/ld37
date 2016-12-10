

function GameStage()
	local self = {
		data = {
			units = {}
		}--,
		--renderer = nil,
		--unitController = nil
	}

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
	end

	function self.update(dt)
		--self.unitController.update(dt, self.data)
	end

	function self.draw()
		self.renderer.render(self.data)
	end

	function self.stop()
		print("Game Stop")
	end

	return self
end

return GameStage