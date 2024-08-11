
Debug=BasicObject:extend() -- make this inherit textObject instead of BasicObject

function Debug:new(debugText, persist)
    Debug.super.new(self, 0, 0, 10, 10)
    self.hp = 20
    self.text = convertVariableToText(debugText)
    self.persist = persist or false
end


function Debug:update()
    if self.persist == false then return true end
    return Debug.super.update(self)
end

function Debug:draw()
    love.graphics.print(self.text, self.x, self.y)
end


