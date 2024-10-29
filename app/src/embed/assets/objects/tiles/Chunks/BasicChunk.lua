BasicChunk = BasicObject:extend()

function BasicChunk:new (x, y, width, height)
    BasicChunk.super.new(self, x, y, width, height)
    self.collisionGroups = {}
    self.collection = "chunks"
    self.tiles = {}
    self.hasStandardCollision = false
end

function BasicChunk:update()
    --BasicChunk.super.update(self)
    if checkCollision(Screen, self) then
        ForLoop(self.tiles)
    end
end

function BasicChunk:followObject(diffX, diffY)
    for index, value in ipairs(self.tiles) do
        value:followObject(diffX, diffY)
    end
    self.x = self.x + diffX
    self.y = self.y + diffY
end

--[[
function BasicChunk:customCollideX(object)
    for _, obstacle in pairs(self.tiles) do
        object:handleCollisionX(obstacle)
    end
end

function BasicChunk:customCollideY(object)
    for _, obstacle in pairs(self.tiles) do
        object:handleCollisionY(obstacle)
    end
end ]]

function BasicChunk:draw()
    --BasicChunk.super.draw(self)
    ForDraw(self.tiles)
    --BasicChunk.super.draw(self)
end

function BasicChunk:hit(object)
    for index, value in ipairs(self.tiles) do
        if checkCollision(object, value) then
            
            if object:hit(value) then
                
                return true
            end
            return value:hit(object)
        end
    end
end