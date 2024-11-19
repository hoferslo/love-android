
TestEnemy=BasicEnemy:extend()

function TestEnemy:new (x, y)
    TestEnemy.super.new(self, x, y, 10, 10)
    self.hp = 20
    self.light = LM:getLighter():addLight(self.x, self.y, 50, 0.5,0.5,0.1,0.5)
end


function TestEnemy:update()
    LM:getLighter():updateLight(self.light, self.x , self.y)
    return TestEnemy.super.update(self)
end

