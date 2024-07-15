
BasicHud=BasicObjectImage:extend()

function BasicHud:new (x, y, image)
    BasicHud.super.new(self, x, y, image)
    self.x = self.x - self.xhit * 0.5
    self.y = self.y - self.yhit * 0.5
    self.angleToTouch = 0
    self.collisionData = {}
end


function BasicHud:fun()
    BasicHud.super.fun(self)
    self.collisionData = {}
    for _, touch in pairs(Touches) do
        if touch.bind == self then
            self.angleToTouch = self:CalcAngle(touch)
            self:Touch(touch.x, touch.y)
        elseif touch.bind == nil and self:hasCollided(touch) then
            touch.bind = self
            
            break
        end
    end
end

function BasicHud:Touch(x, y)

end

function BasicHud:OnLetGo()
    
end

