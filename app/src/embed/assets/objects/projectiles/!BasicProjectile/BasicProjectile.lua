BasicProjectile = BasicObject:extend()

function BasicProjectile:new (x, y, xhit, yhit, angle, vel, velSubtract)
    BasicProjectile.super.new(self, x, y, xhit, yhit)
    self.angle = angle or 0
    self.vel = vel or 0.02
    self.velSubtract = velSubtract or 0
    self.type = "normal"
    self.dmg = 1
    self:addForce()
    self.collisionData = {}
end

function BasicProjectile:fun()
    BasicProjectile.super.fun(self)
    if self:isOutsideScreen() then
        return true
    end
end

function BasicProjectile:hit(enemy)
    return enemy:hit(self)
end
