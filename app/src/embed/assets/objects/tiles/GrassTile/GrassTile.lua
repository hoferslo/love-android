local className = "GrassTile"
ImagesData[className] = { "1.png", "2.png", "3.png", "4.png", "5.png" }
local path = "objects/tiles/GrassTile/images/"
Get_images(className, path)

GrassTile = BasicTile:extend()

function GrassTile:new (x, y)
    GrassTile.super.new(self, x, y, className)
    self.hasStandardCollision = false
    self.imageIndex = math.random(1, #ImagesData[self.image])

end

function GrassTile:update()
    GrassTile.super.update(self)
    if (#LM:getCollection("enemies") < 50) then
        if math.random(1, 100000) == 1 then
            local enemy = TestEnemy(math.random(self.x, self.x + self.width), math.random(self.y, self.y + self.height))
    
            LM:insertObject(enemy)
        end
    end
end




