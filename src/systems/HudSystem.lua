local assets = require "src.assets"

local function HudSystem(levelState)
	return tiny.processingSystem(
		tiny.requireAll("drawHud"),
		function(e, dt)
			e:drawHud(dt)
		end, 
		nil, nil,
		function(dt)
			local n = levelState.totalEnemiesToKill - levelState.enemiesKilled
			local d = levelState.totalEnemiesToKill
			love.graphics.setFont(assets.fnt_hud)
			love.graphics.printf("Wave " .. levelState.wave, 20, 20, 300, "left")			
			love.graphics.setFont(assets.fnt_smallhud)
			love.graphics.printf(n .. "/" .. d .. " Pigs Remaining", 20, 60, 500, "left")
		end
	)
end

return HudSystem