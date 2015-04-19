local function round(x)
    return math.floor(x * 32 + 16) / 32
end

local function CameraTrackingSystem(camera)
    return tiny.processingSystem(
        tiny.requireAll("cameraTrack", "pos"),
        function(e, dt)
            local xo, yo = e.cameraTrack.xoffset, e.cameraTrack.yoffset
            local x, y = e.pos.x + xo, e.pos.y + yo
            local xp, yp = camera:getPosition()
            local lerp = 0.1
            camera:setPosition(round(xp + (x - xp) * lerp), round(yp + (y - yp) * lerp))
        end, 
        function(e)
            local xo, yo = e.cameraTrack.xoffset, e.cameraTrack.yoffset
            local x, y = e.pos.x + xo, e.pos.y + yo
            camera:setPosition(round(x), round(y))
        end
    )
end

return CameraTrackingSystem