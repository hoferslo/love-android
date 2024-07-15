
BasicBorder=BasicObject:extend()

function BasicBorder:new (x, y, xhit, yhit, destroyOnTouch)
    BasicBorder.super.new(self, x, y, xhit, yhit)
    self.destroyOnTouch = destroyOnTouch

end 

function BasicBorder:draw()
    --love.graphics.rectangle("line", self.x, self.y, self.xhit, self.yhit)
end
