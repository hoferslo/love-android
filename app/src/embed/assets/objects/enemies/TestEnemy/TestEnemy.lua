
TestEnemy=BasicEnemy:extend()

function TestEnemy:new (x, y)
    TestEnemy.super.new(self, x, y, 10, 10)
    self.hp = 20
end


function TestEnemy:update()

    return TestEnemy.super.update(self)
end

