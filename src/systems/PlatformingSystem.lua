local assets = require "src.assets"

local function PlatformingSystem()
    return tiny.processingSystem(
        tiny.requireAll("pos", "vel", "platforming"),
        function(e, dt)
            local pos = e.pos
            local vel = e.vel
            local platforming = e.platforming
            local acceleration = platforming.acceleration
            local friction = platforming.friction
            local speed = platforming.speed
            local direction = platforming.direction
            e.flippedH = direction == 'l'

            if platforming.moving then
                if direction == 'l' then
                    vel.x = math.max(-speed, vel.x - acceleration * dt)
                elseif direction == 'r' then
                    vel.x = math.min(speed, vel.x + acceleration * dt)
                end
            elseif e.grounded then
                if vel.x > 0 then
                    vel.x = math.max(0, vel.x - friction * dt)
                elseif vel.x < 0 then
                    vel.x = math.min(0, vel.x + friction * dt)
                end
            end

            if platforming.jumping and e.grounded then
                vel.y = -platforming.jump
                e.grounded = false
                assets.snd_catjump:play()
            end

            e.animation = platforming.moving and e.animation_walk or e.animation_stand
        end
    )
end

return PlatformingSystem