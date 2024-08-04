BasicProjectile = BasicObject:extend()

function BasicProjectile:new (x, y, width, height, angle, speed, friction)
    BasicProjectile.super.new(self, x, y, width, height)
    self.angle = angle or 0
    self.speed = speed or 2
    self.friction = friction or 1
    self.type = "normal"
    self.dmg = 1
    self.collisionGroups = { }
    self:applyForce(nil)
    self.collection = "enemyProj"

end

function BasicProjectile:update()
    BasicProjectile.super.update(self)
    if self:isOutsideBounds() then
        return true
    end

end

function BasicProjectile:hit(enemy)
    return enemy:hit(self)
end
