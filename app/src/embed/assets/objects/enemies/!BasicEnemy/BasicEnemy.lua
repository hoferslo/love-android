BasicEnemy = BasicObject:extend()

function BasicEnemy:new (x, y, width, height)
    BasicEnemy.super.new(self, x, y, width, height)
    self.vel = 0.02
    self.velSubtract = 0.01
    self.hp = 1
end

function BasicEnemy:update()
    BasicEnemy.super.update(self)
    if self.hp <= 0 then
        return true
    end
end

function BasicEnemy:hit(proj)
    self.hp = self.hp - proj.dmg
    return true
end
