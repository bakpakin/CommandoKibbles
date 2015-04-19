local gamestate = require "lib.gamestate"
local Level = require "src.states.Level"

local Intro = class "Intro"

function Intro:load()
	self.timer = 0

end

function Intro:update(dt)
	self.timer = self.timer + dt
	if love.keyboard.isDown(" ") then
		self.timer = 100
	end
	if self.timer > 20 then
		gamestate.switch(Level("assets/lvl1"))
	end
end

function Intro:draw()

end

return Intro