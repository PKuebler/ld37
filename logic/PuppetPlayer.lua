function PuppetPlayer(data)
	local self = {
		data = data
	}

	function self.load()
		self.data.wave = 0
		self.data.isWave = false
		self.data.nextWave = 10
		self.data.nextUnit = 0
		self.data.sendUnits = 0
		self.data.finishedUnits = 0
	end

	function self.update(dt)
		-- finish?
		if self.data.finishedUnits == 10 then
			self.data.isWave = false
		end

		if self.data.isWave == false then
			self.data.nextWave = math.max(0, self.data.nextWave-dt)

			if self.data.nextWave == 0 then
				self.data.isWave = true

				-- start Wave
				self.data.sendUnits = 0
				self.data.nextUnit = 0
				self.data.finishedUnits = 0
				self.data.nextWave = 10
			end
		elseif self.data.sendUnits < 10 and self.data.nextUnit > 1 then
			self.data.sendUnits = self.data.sendUnits+1
			self.data.nextUnit = 0
	
			self.data.dynamicObjects[#self.data.dynamicObjects+1] = {
				x = self.data.startPoint.x*self.data.tileSize,
				y = self.data.startPoint.y*self.data.tileSize,
				tween = nil,
				pathStep = 1,
				money = 100
			}
		elseif self.data.sendUnits < 10 and self.data.nextUnit <= 1 then
			self.data.nextUnit = self.data.nextUnit+dt
		end
	end

	return self
end

return PuppetPlayer