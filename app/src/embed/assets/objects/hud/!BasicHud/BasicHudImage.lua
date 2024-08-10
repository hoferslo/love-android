BasicHudImage = BasicObjectImage:extend()

function BasicHudImage:new (x, y, image)
    BasicHudImage.super.new(self, x, y, image)
    self.angleToTouch = 0
    self.collisionGroups = { }
    self.collection = "hud"
    self.isBeingPressed = false
    self.active = true
    self.lastTouchX = 0
    self.lastTouchY = 0
end

function BasicHudImage:update()
    BasicHudImage.super.update(self)
    self.isBeingPressed = false
    if self.active then
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
end

function BasicHudImage:Touch(x, y)
    self.isBeingPressed = true
    self.lastTouchX = x
    self.lastTouchY = y
end

function BasicHudImage:OnLetGo()

end

