local tween = require("utils.tween")

function UnitController(data)
	local self = {
		data = data
	}

	function self.update(dt)
		for i, obj in ipairs(self.data.dynamicObjects) do
			-- if finish and no playtime -> get next pathStep
				-- automat
				-- path
			if (obj.tween == nil or obj.tween:update(dt)) and obj.playtime == nil then
				-- reset movement
				obj.tween = nil

				-- if finish on object or path
				local currentPath = self.data.path[obj.pathStep]
				if currentPath == nil then
					-- finish
				elseif currentPath.x*self.data.tileSize == obj.x and currentPath.y*self.data.tileSize == obj.y then
					-- finish move to path

					-- get free automat, bank, ...
					local neighbor = self.getFreeNeighborObject(obj)
					if neighbor ~= nil then
						-- block neighbor
						neighbor.useBy = neighbor.useBy+1
						-- set tween
						obj.tween = tween.new(0.5, obj, {x = neighbor.x*self.data.tileSize, y = neighbor.y*self.data.tileSize})
						-- set last use
						obj.lastUse = neighbor
					else
						-- no neighbor
						-- go to next path step
						obj.pathStep = obj.pathStep+1
						local pathStep = self.data.path[obj.pathStep]
						if pathStep ~= nil then
							-- set tween
							obj.tween = tween.new(0.5, obj, {x = pathStep.x*self.data.tileSize, y = pathStep.y*self.data.tileSize})
						end
					end
				else
					-- finish move to object
					-- start playtime
					obj.playtime = obj.lastUse.obj.usetime
				end
			end

			if obj.playtime == 0 then
				-- go back to path
				local pathStep = self.data.path[obj.pathStep]
				-- set tween
				obj.tween = tween.new(0.5, obj, {x = pathStep.x*self.data.tileSize, y = pathStep.y*self.data.tileSize})
				-- unblock
				obj.lastUse.useBy = obj.lastUse.useBy-1
				-- remove playtime
				obj.playtime = nil
			elseif obj.playtime ~= nil then
				obj.playtime = math.max(0,obj.playtime - dt)
			end
		end
	end

	function self.getFreeNeighborObject(obj)
		local x = math.floor(obj.x/self.data.tileSize)
		local y = math.floor(obj.y/self.data.tileSize)

		function check(bX,bY)
			bX = x+bX
			bY = y+bY

			-- if no obj
			if self.data.map[bX] == nil or self.data.map[bX][bY] == nil or self.data.map[bX][bY].obj == nil then
				return
			end

			-- if neighbor not last use
			if obj.lastUse ~= nil and obj.lastUse == self.data.map[bX][bY] then
				return
			end

			-- space?
			if self.data.map[bX][bY].useBy == nil or self.data.map[bX][bY].useBy < self.data.map[bX][bY].obj.space then
				return self.data.map[bX][bY]
			end

			return nil
		end

		local tile = nil
		tile = check(0,-1)
		if tile == nil then
			tile = check(0,1)
		end
		if tile == nil then
			tile = check(-1,0)
		end
		if tile == nil then
			tile = check(1,0)
		end

		return tile
	end

	return self
end

return UnitController