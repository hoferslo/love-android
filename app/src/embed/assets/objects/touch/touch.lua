BasicTouch = BasicObject:extend()

function BasicTouch:new (x, y, id)
    BasicTouch.super.new(self, x, y, 1, 1)
    self.bind = nil
    self.id = id
    self.xDraw = self.x
    self.yDraw = self.y
    self.collisionGroups = { "hud" }
    self:calcScale()
    self.light = BasicLight(self.x, self.y, 0.3, {math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(0,100)*0.01, 0.75})
    self.light:follow(self)
    LM:insertObject(self.light)
end

function BasicTouch:update()
    
end

function BasicTouch:calcScale()
    self.xDraw = self.x
    self.yDraw = self.y
    self.x = self.x / SettingsScale["x"]
    self.y = self.y / SettingsScale["y"]
end