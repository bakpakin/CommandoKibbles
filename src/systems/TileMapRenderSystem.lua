local beholder = require 'lib.beholder'
local TileMapRenderSystem = tiny.system(class "TileMapRenderSystem")
TileMapRenderSystem.isDrawSystem = true

local lgw, lgh, stale

beholder.observe('resize', function(w, h)
    stale = true
    lgw = w
    lgh = h
end)

function TileMapRenderSystem:init(camera, tileMap)
	self.camera = camera
	self.tileMap = tileMap
end

function TileMapRenderSystem:update(dt)
    local c = self.camera
    local tm = self.tileMap
    local s = c:getScale()
    local tx, ty = c:getVisibleCorners()
    if stale then
        stale = nil
        tm:resize(lgw, lgh)
    end
    tm:update(dt)
    tm:draw(-tx, -ty + 16, s)
end

return TileMapRenderSystem
