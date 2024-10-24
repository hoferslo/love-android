BasicTile = BasicObjectImage:extend()

function BasicTile:new (x, y, image)
    BasicTile.super.new(self, x, y, image)
    self.collisionGroups = {}
    self.collection = "tiles"
    self.display = true
end

function BasicTile:update()
    BasicTile.super.update(self)
    self.display = false
end

function BasicTile:draw()
    if self.display == true then
    BasicTile.super.draw(self)
    end
end

function BasicTile:hit(object)
    self.display = true
    --do something to object
end