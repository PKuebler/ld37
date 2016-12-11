-- stages
require("stages.StageManager")
require("stages.MenuStage")
require("stages.GameStage")
require("stages.CreditsStage")

-- instant console
io.stdout:setvbuf('no')

local stages = StageManager({})


function love.load()
	love.window.setMode(25*32, 19*32, {})
	love.graphics.setBackgroundColor( 5, 8, 25 )
	stages.add("menu",MenuStage)
	stages.add("game",GameStage)
	stages.add("credits",CreditsStage)

	stages.toggle("menu")
end

function love.update(dt)
	stages.update(dt)
end

function love.draw()
	stages.draw()
end

function love.mousereleased( x, y, button, istouch )
	stages.mousereleased( x, y, button, istouch )
end

function love.wheelmoved(x, y)
	stages.wheelmoved(x,y)
end