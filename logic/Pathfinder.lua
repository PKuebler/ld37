function Pathfinder(mapData)
	local self = {
		mapData = mapData,
		noCache = true
	}

	-----------------------------
	-- Gebe freie Nachbarfelder aus
	-----------------------------
	local get_neighbors = function( theNode, nodes )
		local neighbors = {}

		function check(x,y)
			x = theNode.x+x
			y = theNode.y+y

			if nodes[x] ~= nil and nodes[x][y] ~= nil and theNode ~= nodes[x][y] and nodes[x][y].blocked == false then
				-- todo ist betrettbar
				table.insert ( neighbors, nodes[x][y] )
				print(x,y)
			end
		end

		check(0,	-1)
		check(0,	1)
		check(-1,	0)
		check(1,	0)

		return neighbors
	end

	---------------------------------
	-- Suche Path, return nil if no path
	---------------------------------
	function self.getPath(startX,startY,endX,endY)
		return astar.path(self.mapData[1][1],self.mapData[20][20],self.mapData,self.noCache,get_neighbors)
	end

	return self
end

return Pathfinder