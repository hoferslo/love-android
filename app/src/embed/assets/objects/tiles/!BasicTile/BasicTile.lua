BasicTile = BasicObjectImage:extend()

function BasicTile:new (x, y, image)
    BasicTile.super.new(self, x, y, image)
    self.collisionGroups = {}
    self.collection = "tiles"
    --self.display = true
    --self.light = LM:getLighter():addLight(self.x, self.y, 200, 1,1,1)
end

function BasicTile:update()
    --BasicTile.super.update(self)
    self.display = false
    --LM:getLighter():updateLight(self.light, self.x, self.y)
end

function BasicTile:draw()
    --if self.display == true then
    BasicTile.super.draw(self)
    --end
    --love.graphics.circle("fill", self.x, self.y, 2)
end

function BasicTile:hit(object)
    --self.display = true
    --do something to object
end