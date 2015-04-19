local function UpdateSystem()
    return tiny.processingSystem(
        tiny.requireAll("update"),
        function(e, dt)
            e:update(dt)
        end
    )
end

return UpdateSystem