-- stages
require("stages.StageManager")
require("stages.MenuStage")
require("stages.GameStage")
require("stages.SplashStage")
require("stages.CreditsStage")
require("renderer.Audio")

-- instant console
io.stdout:setvbuf('no')

local data = {assets = {}}
data.audio = Audio(data)
local stages = StageManager(data)
local debug = false


function love.load()
	love.window.setMode(25*32, 19*32, {})
	love.graphics.setBackgroundColor( 5, 8, 25 )
	stages.add("menu",MenuStage)
	stages.add("game",GameStage)
	stages.add("splash",SplashStage)
	stages.add("credits",CreditsStage)

	stages.toggle("splash")
end

function love.update(dt)
	stages.update(dt)
end

function love.draw()
	stages.draw()

	if debug then
		local stats = love.graphics.getStats()
		love.graphics.setFont(data.assets.font12)
		love.graphics.printf("draw calls "..stats.drawcalls, love.graphics.getWidth()-205, 10, 200, "right")
		love.graphics.printf("canvas switches "..stats.canvasswitches, love.graphics.getWidth()-205, 30, 200, "right")
		love.graphics.printf("texture memory "..stats.texturememory, love.graphics.getWidth()-205, 50, 200, "right")
		love.graphics.printf("images "..stats.images, love.graphics.getWidth()-205, 70, 200, "right")
		love.graphics.printf("canvases "..stats.canvases, love.graphics.getWidth()-205, 90, 200, "right")
		love.graphics.printf("fonts "..stats.fonts, love.graphics.getWidth()-205, 110, 200, "right")
		love.graphics.printf("units "..table.getn(data.dynamicObjects), love.graphics.getWidth()-205, 130, 200, "right")
	end
end

function love.keyreleased(key)
   if key == "escape" then
   		if stages.current.name == "game" then
   			stages.toggle("menu")
   		else
	    	love.event.quit()
	    end
   elseif key == "space" then
		if debug == true then
			debug = false
		else
			debug = true
		end
	end
end

function love.mousereleased( x, y, button, istouch )
	stages.mousereleased( x, y, button, istouch )
end

function love.wheelmoved(x, y)
	stages.wheelmoved(x,y)
end