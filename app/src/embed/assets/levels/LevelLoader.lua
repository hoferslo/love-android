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

    local sizeOfTile = GrassTile(1, 1)
    sizeOfTile = Images[sizeOfTile.image][sizeOfTile.imageIndex]:getWidth()
    for y = 0, ImagesData[self.image][selectedLevel]:getHeight() - 1 do
        for x = 0, ImagesData[self.image][selectedLevel]:getWidth() - 1 do
            local r, g, b, a = ImagesData[self.image][selectedLevel]:getPixel(x, y) -- Get the color of the pixel

            -- Convert the color to a unique key (can be a string)
            local colorKey = string.format("%03d%03d%03d", r * 255, g * 255, b * 255)

            -- Check if the key does not exist in the dictionary
            if a > 0 then

                layer:insertObject(self.itemDictionary[colorKey](x * sizeOfTile, y * sizeOfTile))
            end
        end
    end
    local XMax = layer.collections["tiles"][#layer.tiles].x + sizeOfTile
    local YMax = layer.collections["tiles"][#layer.tiles].y + sizeOfTile

    --add tiles to chunks here
end