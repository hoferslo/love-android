BasicTile = BasicObjectImage:extend()

function BasicTile:new (x, y, image)
    BasicTile.super.new(self, x, y, image)
    self.collisionGroups = {}
    self.collection = "tiles"
end

function BasicTile:update()
    BasicTile.super.update(self)
end

function BasicTile:draw()
    BasicTile.super.draw(self)
end

function BasicTile:hit(object)
    print(self.x)
    --do something to object
end