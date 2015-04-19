local function DrawBackgroundSystem()
    return tiny.system(
        function(dt)
            local r, g, b, a = love.graphics.getColor()
            love.graphics.setColor(140, 205, 255, 255)
            love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
            love.graphics.setColor(r, g, b, a)
        end
    )
end

return DrawBackgroundSystem