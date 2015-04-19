local function TileMapRenderSystem(camera, tileMap)
    return tiny.system(
        function(dt)
            camera:draw(function(l, t, w, h)
                tileMap:update(dt)
                tileMap:setDrawRange(-l, -t, w, h)
                tileMap:draw()
            end)
        end
    )
end

return TileMapRenderSystem