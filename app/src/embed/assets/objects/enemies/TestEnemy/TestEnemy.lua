
TestEnemy=BasicEnemy:extend()

function TestEnemy:new (x, y)
    TestEnemy.super.new(self, x, y, 10, 10)
    self.hp = 20
    self.light = BasicLight(self.x, self.y, math.random(100,300), {math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(30,70)*0.01})
    self.light:follow(self)
end


function TestEnemy:update()
    self:applyForce(nil)
    self.angle = self.angle + math.random(0,40) - 20
    return TestEnemy.super.update(self)
end

