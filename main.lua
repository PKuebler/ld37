-- stages
require("stages.StageManager")
require("stages.MenuStage")
require("stages.GameStage")

-- instant console
io.stdout:setvbuf('no')

local stages = StageManager({})


function love.load()
	love.window.setMode(25*32, 19*32, {})
	stages.add("menu",MenuStage)
	stages.add("game",GameStage)
	--stages.add("game",GameStage)

	stages.toggle("game")
end

function love.update(dt)
	stages.update(dt)
end

function love.draw()
	stages.draw()
end