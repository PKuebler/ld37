
function StageManager()
	local self = {
		stages = {},
		current = nil
	}

	function self.add(name, stage)
		self.stages[name] = stage
	end

	function self.toggle(name)
		if self.current ~= nil then
			self.current.stop()
		end
		if self.stages[name] ~= nil then
			self.current = self.stages[name]()
			self.current.start()
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

	return self
end

return StageManager