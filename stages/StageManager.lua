function StageManager(data)
	local self = {
		stages = {},
		current = nil
	}
	function self.add(name, stage)
		self.stages[name] = stage
	end

	function self.toggle(name)
		print("toggle to "..name)
		if self.current ~= nil then
			local lastStage = self.current
			self.current = nil
			lastStage.stop()
		end
		if self.stages[name] ~= nil then
			local nextStage = self.stages[name](self, data)
			nextStage.start()
			self.current = nextStage
		end
	end

	function self.update(dt)
		if self.current ~= nil then
			self.current.update(dt)
		end
	end
	function self.draw()
		if self.current ~= nil then
			self.current.draw()
		end
	end

	function self.mousereleased( x, y, button, istouch )
		if self.current ~= nil then
			self.current.mousereleased( x, y, button, istouch )
		end
	end

	function self.wheelmoved(x,y)
		if self.current ~= nil and self.current.wheelmoved ~= nil then
			self.current.wheelmoved(x,y)
		end
	end

	return self
end

return StageManager