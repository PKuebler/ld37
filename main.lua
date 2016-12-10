-- stages
require("stages.StageManager")
require("stages.MenuStage")
require("stages.GameStage")

-- instant console
io.stdout:setvbuf('no')

local stages = StageManager()


function love.load()
	stages.add("menu",MenuStage)
	stages.add("game",GameStage)
	--stages.add("game",GameStage)

	stages.toggle("game")
end

function love.update(dt)
	--stages.update(dt)
end

function love.draw()
	--stages.draw()
end