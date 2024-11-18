local className = "WallTile"
ImagesData[className] = { "1.png", "2.png"}
local path = "objects/tiles/WallTile/images/"
Get_images(className, path)

WallTile = BasicTile:extend()

function WallTile:new (x, y)
    WallTile.super.new(self, x, y, className)
    self.imageIndex = math.random(1, #ImagesData[self.image])
    --self.polygon = {self.x, self.y, self.x + self.width, self.y, self.x + self.width, self.y + self.height, self.x, self.y + self.height}
    --LM:getLighter():addPolygon(self.polygon)
end

function WallTile:update()
    WallTile.super.update(self)
    --local polygon = {self.x, self.y, self.x + self.width, self.y, self.x + self.width, self.y + self.height, self.x, self.y + self.height}
    --LM:getLighter():updatePolygon(self.polygon, polygon)
    self.polygon = polygon
end

function WallTile:hit(object)
    return true
    --self.display = true
    --do something to object
end



