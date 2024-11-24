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
        ["046001001"] = WallTile,
        --["000000000"] = startingPoint --make a class starting point, and then implement it into layer manager, then have that be the starting point for the mc
    }

end

function LevelManager:generateLevel(selectedLevel, layer)

    local sizeOfTile = GrassTile(1, 1).width
    local tiles = {}
    for y = 0, ImagesData[self.image][selectedLevel]:getHeight() - 1 do
        for x = 0, ImagesData[self.image][selectedLevel]:getWidth() - 1 do
            local r, g, b, a = ImagesData[self.image][selectedLevel]:getPixel(x, y) -- Get the color of the pixel

            -- Convert the color to a unique key (can be a string)
            local colorKey = string.format("%03d%03d%03d", r * 255, g * 255, b * 255)

            -- Check if the key does not exist in the dictionary
            if a > 0 then
                if self.itemDictionary[colorKey] ~= nil then
                    table.insert(tiles, self.itemDictionary[colorKey](x * sizeOfTile, y * sizeOfTile))
                else 
                    --print("Object is nil in generate level, of colorKey: " .. colorKey)
                end
            end
        end
    end
    
    local chunkSize = 8

    local height = math.floor(ImagesData[self.image][selectedLevel]:getHeight() / chunkSize) + 1
    local width = math.floor(ImagesData[self.image][selectedLevel]:getHeight() / chunkSize) + 1
    local debugCounter = 0
    local countOfTiles = #tiles

    for y = height, 0, -1 do
        for x = width, 0, -1 do
            local chunk = BasicChunk(x * chunkSize * sizeOfTile, y * chunkSize * sizeOfTile, chunkSize * sizeOfTile, chunkSize * sizeOfTile)
            for i=#tiles,1,-1 do
                if checkCollision(chunk, tiles[i]) then
                    table.insert(chunk.tiles, tiles[i])
                    table.remove(tiles, i)
                    debugCounter = debugCounter + 1
                else
                    if (tiles[i].x + tiles[i].width < chunk.x and tiles[i].y + tiles[i].height < chunk.y) then
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