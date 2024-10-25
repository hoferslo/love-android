BasicChunk = BasicObject:extend()

function BasicChunk:new (x, y, width, height)
    BasicChunk.super.new(self, x, y, width, height)
    self.collisionGroups = {}
    self.collection = "chunks"
    self.tiles = {}
end

function BasicChunk:update()
    BasicChunk.super.update(self)
    if checkCollision(Screen, self) then
        ForLoop(self.tiles)
    end
end

function BasicChunk:draw()
    --BasicChunk.super.draw(self)
    ForDraw(self.tiles)
    --BasicChunk.super.draw(self)
end

function BasicChunk:hit(object)
    for index, value in ipairs(self.tiles) do
        if checkCollision(object, value) then
            value:hit(object)
        end
    end
end