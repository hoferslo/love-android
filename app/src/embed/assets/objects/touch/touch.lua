BasicTouch = BasicObject:extend()

function BasicTouch:new (x, y, id)
    BasicTouch.super.new(self, x, y, 1, 1)
    self.bind = nil
    self.id = id
    self.xDraw = self.x
    self.yDraw = self.y
    self.collisionGroups = { "hud" }
    self:calcScale()
end

function BasicTouch:update()
    BasicTouch.super.update(self)
end

function BasicTouch:calcScale()
    self.xDraw = self.x
    self.yDraw = self.y
    self.x = self.x / SettingsScale["x"]
    self.y = self.y / SettingsScale["y"]
end