function AssetManager()

-- idee ueber name wird asset (font,spriteanimation, etc zurueckgegeben)
	local self = {
		assetList ={}
	}
	local font = nil
	function self.load()

		font = love.graphics.newFont("assets/TruenoBd.ttf",12)
		self.assetList["font"] = font


	end

	function self.get(name)
		return self.assetList[name]
	end

	return self
end
return AssetManager