BasicTouch = BasicObject:extend()

function BasicTouch:new (x, y, id)
    BasicTouch.super.new(self, x, y, 1, 1)
    self.bind = nil
    self.id = id
    self.xDraw = self.x
    self.yDraw = self.y
    self.collisionGroups = { "hud" }
    self:calcScale()
    self.light = BasicLight(self.x, self.y, 100, {math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(0,100)*0.01, 0.75})
end

function BasicTouch:update()
    self.light.x = self.x
    self.light.y = self.y
end

function BasicTouch:calcScale()
    self.xDraw = self.x
    self.yDraw = self.y
    self.x = self.x / SettingsScale["x"]
    self.y = self.y / SettingsScale["y"]
end