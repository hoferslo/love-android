
Button = BasicHud:extend()

function Button:new (x, y, image)
    Button.super.new(self, x, y, image)
    self.timeHeld = 0

end

function Button:update()
    Button.super.update(self)

end

function Button:Touch(x, y)
    Button.super.Touch(self)
    self.timeHeld = self.timeHeld + 1
end

function Button:OnLetGo()
    self.timeHeld = 0
end


function Button:draw()
    Button.super.draw(self)
    local var = self.timeHeld
    if var > 30 then
        var = 30
    end
    self:drawSilhouette({1, 1, 1, 0.15 * var / 30})
end
