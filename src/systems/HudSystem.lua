local HudSystem = tiny.processingSystem(class "HudSystem")
HudSystem.isDrawSystem = true

function HudSystem:init(layerFlag)
	self.filter = tiny.requireAll("drawHud", layerFlag)
end

function HudSystem:process(e, dt)
	e:drawHud(dt)
end

return HudSystem
