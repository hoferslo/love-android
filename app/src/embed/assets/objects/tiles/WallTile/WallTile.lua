local className = "WallTile"
ImagesData[className] = { "1.png"}
local path = "objects/tiles/WallTile/images/"
Get_images(className, path)

WallTile = BasicTile:extend()

function WallTile:new (x, y)
    WallTile.super.new(self, x, y, className)
    

end

function WallTile:update()
    WallTile.super.update(self)
end

function WallTile:hit(object)
    return true
    --self.display = true
    --do something to object
end



