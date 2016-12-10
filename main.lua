-- stages
require("stages.StageManager")
require("stages.MenuStage")
require("stages.GameStage")
require("WorldController")
require("WorldRenderer")
-- instant console
io.stdout:setvbuf('no')

local stages = StageManager()
local worldController = WorldController()
local worldRenderer = WorldRenderer()

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