local TimerEvent = require "src.entities.TimerEvent"

local function SpawnSystem(levelState)

	local time = 0

	return tiny.system(
		function(dt)
			time = time + dt
		end,
		tiny.requireAll("isSpawner"),
		nil,
		function(e)
			levelState.spawners[e] = true
			levelState.spawnerCount = levelState.spawnerCount + 1
		end,
		function(e)
			levelState.spawners[e] = false
			levelState.spawnerCount = levelState.spawnerCount - 1
		end,
		function(dt)
			if levelState.isSpawning and levelState.enemiesSpawned < levelState.totalEnemiesToKill and time >= levelState.spawnInterval then
				local choice = math.ceil(math.random() * levelState.spawnerCount)
				for spnr in pairs(levelState.spawners) do
					choice = choice - 1
					if choice == 0 then
						spnr:spawn()
					end
				end
				time = 0
			end
		end
	)
end

return SpawnSystem