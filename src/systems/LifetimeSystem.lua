local function LifetimeSystem()
    return tiny.processingSystem(
        tiny.requireAll("lifetime"),
        function(e, dt)
            e.lifetime = e.lifetime - dt
            if e.lifetime <= 0 then
            	if e.onLifeover then
            		e:onLifeover()
            	end
                world:remove(e)
            end
        end
    )
end

return LifetimeSystem