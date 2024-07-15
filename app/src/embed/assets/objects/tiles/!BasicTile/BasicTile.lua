ImagesData["BasicTile"] = {"1.png"}
local path = "objects/tiles/!BasicTile/images/"
Get_images("BasicTile", path)

BasicTile=BasicObjectImage:extend()

function BasicTile:new (x, y)
    BasicTile.super.new(self, x, y, "BasicTile")
    self.collisionData = {}
    self.vel = 0.1
    self.angle = 0
end


function BasicTile:fun()
    BasicTile.super.fun(self)
    if self.y > Screen.y + Screen.yhit then
        return true
    end
    self:addForce(nil, 90)
end

function BasicTile:draw()
    BasicTile.super.draw(self)


end