local function DrawBackgroundSystem(r, g, b)
    return tiny.system(
        function(dt)
            local r1, g1, b1, a = love.graphics.getColor()
            love.graphics.setColor(r, g, b, 255)
            love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
            love.graphics.setColor(r1, g1, b1, a)
        end
    )
end

return DrawBackgroundSystem