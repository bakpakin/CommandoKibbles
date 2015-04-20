local assets = require "src.assets"

local function HudSystem(levelState, layerFlag)
	return tiny.processingSystem(
		tiny.requireAll("drawHud", layerFlag),
		function(e, dt)
			e:drawHud(dt)
		end
	)
end

return HudSystem