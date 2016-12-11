function Audio(data)
	local self = {
		sound = nil
	}

	function self.start()
		sound = data.assets.bgmusic
		sound:setLooping(true)
		sound:setVolume(0.5)
		sound:play()
	end

	return self
end

return Audio