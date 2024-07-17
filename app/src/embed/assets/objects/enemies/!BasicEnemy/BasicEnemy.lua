
BasicEnemy=BasicObject:extend()

function BasicEnemy:new (x, y, xhit, yhit)
    BasicEnemy.super.new(self, x, y, xhit, yhit)
    self.vel = 0.02
    self.velSubtract = 0.01
    self.hp = 1
end


function BasicEnemy:fun()
    BasicEnemy.super.fun(self)
    if self.hp <= 0 then
        return true
    end
end

function BasicEnemy:hit(proj)
    self.hp = self.hp - proj.dmg
end
