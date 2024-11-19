BasicTouch = BasicObject:extend()

function BasicTouch:new (x, y, id)
    BasicTouch.super.new(self, x, y, 1, 1)
    self.bind = nil
    self.id = id
    self.xDraw = self.x
    self.yDraw = self.y
    self.collisionGroups = { "hud" }
    self:calcScale()
    self.light = LM:getLighter():addLight(self.x, self.y, 200, 1,0,1, 1)
end

function BasicTouch:update()
    LM:getLighter():updateLight(self.light, self.x, self.y)
end

function BasicTouch:OnLetGo()
    LM:getLighter():removeLight(self.light)
end

function BasicTouch:calcScale()
    self.xDraw = self.x
    self.yDraw = self.y
    self.x = self.x / SettingsScale["x"]
    self.y = self.y / SettingsScale["y"]
end