local function AISystem(target)
    local ret
    ret = tiny.processingSystem(
        tiny.requireAll("ai", "pos", "platforming"),
        function(e, dt)
            if not ret.target then return end
            local targetx = ret.target.pos.x
            local pos = e.pos
            local p = e.platforming
            p.moving = ret.target.isAlive
            if targetx > pos.x then
                p.direction = 'r'
            end
            if targetx < pos.x then
                p.direction = 'l'
            end
            p.jumping = math.random() < 0.5 * dt
        end
    )
    ret.target = target
    return ret
end 

return AISystem