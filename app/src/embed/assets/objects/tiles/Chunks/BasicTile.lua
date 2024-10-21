BasicChunk = BasicObject:extend()

function BasicChunk:new (x, y, image)
    BasicChunk.super.new(self, x, y, image)
    self.collisionGroups = {}
    self.collection = "chunks"
    self.tiles = {}
end

function BasicChunk:update()
    BasicChunk.super.update(self)
    ForLoop(self.tiles)
end

function BasicChunk:draw()
    BasicChunk.super.draw(self)
    ForDraw(self.tiles)
end

function BasicChunk:effect(object)
    for index, value in ipairs(self.tiles) do
        value:effect(object)
    end
end