local className = "LevelManager"
ImagesData[className] = { "level_test.png" }
local path = "levels/levelsData/"
Get_images(className, path)

LevelManager = Object:extend()

function LevelManager:new()
    -- maybe implement layers for image based levels, use layers even in aseprite, first layer - blocks, second layer - static entities (houses, ...), third layer - ???
    self.image = className

    self.itemDictionary = {
        ["099199077"] = GrassTile,
        --["000000000"] = startingPoint --make a class starting point, and then implement it into layer manager, then have that be the starting point for the mc
    }

end

function LevelManager:generateLevel(selectedLevel, layer)

    local sizeOfTile = GrassTile(1, 1).width
    
    for y = 0, ImagesData[self.image][selectedLevel]:getHeight() - 1 do
        for x = 0, ImagesData[self.image][selectedLevel]:getWidth() - 1 do
            local r, g, b, a = ImagesData[self.image][selectedLevel]:getPixel(x, y) -- Get the color of the pixel

            -- Convert the color to a unique key (can be a string)
            local colorKey = string.format("%03d%03d%03d", r * 255, g * 255, b * 255)

            -- Check if the key does not exist in the dictionary
            if a > 0 then
                if self.itemDictionary[colorKey] ~= nil then
                    layer:insertObject(self.itemDictionary[colorKey](x * sizeOfTile, y * sizeOfTile))
                else 
                    --print("Object is nil in generate level, of colorKey: " .. colorKey)
                end
            end
        end
    end

    --add tiles to chunks here
    local chunkSize = 8

    for y = 0, math.floor(ImagesData[self.image][selectedLevel]:getHeight() / chunkSize) + 1, 1 do
        for x = 0, math.floor(ImagesData[self.image][selectedLevel]:getWidth() / chunkSize) + 1, 1 do
            local chunk = BasicChunk(x * chunkSize * sizeOfTile, y * chunkSize * sizeOfTile, chunkSize * sizeOfTile, chunkSize * sizeOfTile)
            for index, value in ipairs(layer.collections["tiles"]) do
                if checkCollision(chunk, layer.collections["tiles"][index]) then
                    table.insert(chunk.tiles, layer.collections["tiles"][index])
                    --table.remove(layer.collections["tiles"], index)
                else
                    if (layer.collections["tiles"][index].x > chunk.x + chunk.width and layer.collections["tiles"][index].y > chunk.y + chunk.height) then
                        break
                    end
                end
                
            end
            if #chunk.tiles ~= 0 then
                layer:insertObject(chunk)
            end
        end
    end
end