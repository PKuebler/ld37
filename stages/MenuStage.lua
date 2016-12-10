require("utils.Buttons")


function MenuStage(StageManager, data)
	local self = {}
	local buttons = ButtonManager()


	function self.start()
		print("alive")
		-- add btn schmeisst error
		buttons.add("Play",150,150,150,50)
	end

	function self.update(dt)
		-- updatemnger
	end

	function self.draw()
		-- render btnmnger
		buttons.draw()
	end

	function self.stop()
	end

	return self
end

return MenuStage