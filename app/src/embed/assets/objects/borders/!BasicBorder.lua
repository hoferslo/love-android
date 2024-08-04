
BasicBorder=BasicObject:extend()

function BasicBorder:new (x, y, width, height, destroyOnTouch)
    BasicBorder.super.new(self, x, y, width, height)
    self.destroyOnTouch = destroyOnTouch
    self.collection = "borders"
end 

function BasicBorder:draw()
    --love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end
