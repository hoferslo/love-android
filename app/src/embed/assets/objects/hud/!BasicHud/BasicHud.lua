BasicHud = BasicObjectImage:extend()

function BasicHud:new (x, y, image)
    BasicHud.super.new(self, x, y, image)
    self.x = self.x - self.width * 0.5
    self.y = self.y - self.height * 0.5
    self.angleToTouch = 0
    self.collisionGroups = { }
    self.collection = "hud"
    self.isBeingPressed = false
end

function BasicHud:update()
    BasicHud.super.update(self)
    self.isBeingPressed = false
    for _, touch in pairs(Touches) do
        if touch.bind == self then
            self.angleToTouch = self:calcAngle(touch)
            self:Touch(touch.x, touch.y)
        elseif touch.bind == nil and self:checkCollision(touch) then
            touch.bind = self

            break
        end
    end
end

function BasicHud:Touch(x, y)
    self.isBeingPressed = true
end

function BasicHud:OnLetGo()

end

