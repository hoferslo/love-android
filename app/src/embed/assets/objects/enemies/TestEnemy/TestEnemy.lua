
TestEnemy=BasicEnemy:extend()

function TestEnemy:new (x, y)
    TestEnemy.super.new(self, x, y, 8, 8)
    self.hp = 20
    self.light = BasicLight(self.x, self.y, math.random(100,300)*0.001, {math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(30,70)*0.01})
    self.light:follow(self)
    LM:insertObject(self.light)
end


function TestEnemy:update()
    self:applyForce(nil)
    self.angle = self.angle + math.random(0,40) - 20
    return TestEnemy.super.update(self)
end

