local TimerEvent = require "src.entities.TimerEvent"

local function WaveSystem(levelState)

	local time = 0

	return tiny.system(
		function(dt)
			time = time + dt
		end,
		tiny.requireOne("isEnemy"),
		function(e, dt)

		end,
		function(e) -- on add
			levelState.enemiesSpawned = levelState.enemiesSpawned + 1
		end,
		function(e) -- on remove
			levelState.enemiesKilled = levelState.enemiesKilled + 1
			if levelState.enemiesKilled >= levelState.totalEnemiesToKill then
				world:add(TimerEvent(1, function()
				 levelState:nextWave()
				end))
			end
		end
	)
end

return WaveSystem