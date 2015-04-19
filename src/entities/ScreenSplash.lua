local ScreenSplash = class("Screen Splash")
local assets = require "src.assets"

function ScreenSplash:drawHud()
	love.graphics.setFont(self.splash.fnt or assets.fnt_hud)
	local w, h = love.graphics.getWidth() * self.pos.x, love.graphics.getHeight() * self.pos.y
	love.graphics.printf(self.splash.text, w - self.splash.width / 2, h, self.splash.width, "center")
end

function ScreenSplash:init(x, y, text, width, fnt)
	self.pos = {x = x, y = y}
	self.splash = {
		text = text,
		fnt = fnt,
		width = width or 400
	}
end

return ScreenSplash