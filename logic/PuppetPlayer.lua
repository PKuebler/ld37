function PuppetPlayer(data)
	local self = {
		data = data
	}

	function self.load()
		self.data.wave = 0
		self.data.isWave = false
		self.data.nextWave = 10

		----------------------------------
		-- Debug Daten
		----------------------------------
		self.data.dynamicObjects[#self.data.dynamicObjects+1] = {
			x = self.data.startPoint.x*self.data.tileSize,
			y = self.data.startPoint.y*self.data.tileSize,
			tween = nil,
			pathStep = 1,
			money = 100
		}

	end

	function self.update(dt)
		if self.data.isWave == false then
			self.data.nextWave = math.max(0, self.data.nextWave-dt)

			if self.data.nextWave == 0 then
				self.data.isWave = true

				-- start Wave
			end
		end
	end

	return self
end

return PuppetPlayer