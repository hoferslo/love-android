BasicTouch = BasicObject:extend()

function BasicTouch:new (x, y, id)
    BasicTouch.super.new(self, x, y, 1, 1)
    self.bind = nil
    self.id = id
    self.xDraw = self.x
    self.yDraw = self.y
    self.collisionGroups = { "hud" }
    self:calcScale()
    self.light = BasicLight(self.x, self.y, 0.3, {math.random(0,70)*0.01,math.random(0,70)*0.01,math.random(0,70)*0.01, 0.75})
    self.light:follow(self)
    LM:insertObject(self.light)
end

function BasicTouch:update()
    LM:insertObject(RadiusLight(self.x, self.y, math.random(200, 300) * 0.0003, math.random(20,150) * 0.01,{self.light.color[1] + (math.random(0,40)-20)*0.01,self.light.color[2] + (math.random(0,40)-20)*0.01,self.light.color[3] + (math.random(0,40)-20)*0.01, 0.75}))
end

function BasicTouch:calcScale()
    self.xDraw = self.x
    self.yDraw = self.y
    self.x = self.x / SettingsScale["x"]
    self.y = self.y / SettingsScale["y"]
end