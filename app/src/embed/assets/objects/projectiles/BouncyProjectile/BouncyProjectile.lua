
BouncyProjectile=BasicProjectile:extend()
-- doont use yet, not finished
function BouncyProjectile:new (x, y, width, height, angle, speed, friction)
    BouncyProjectile.super.new(self, x, y, width, height, angle, speed, friction)
    self.numOfBouncesLeft = 10
end


function BouncyProjectile:update()
    BouncyProjectile.super.update(self)

end

function BouncyProjectile:hit(enemy)
    if BouncyProjectile.super.hit(self, enemy) then
        if self.numOfBouncesLeft > 0 then
            self.numOfBouncesLeft = self.numOfBouncesLeft - 1
            local dx = (self.x + self.width / 2) - (enemy.x + enemy.width / 2)
            local dy = (self.y + self.height / 2) - (enemy.y + enemy.height / 2)

            local angleRad = math.rad(self.angle)

            -- Adjust angle based on which side the bullet hit
            if math.abs(dx) > math.abs(dy) then
                -- Horizontal bounce (left or right side of enemy)
                angleRad = math.pi - angleRad
            else
                -- Vertical bounce (top or bottom side of enemy)
                angleRad = -angleRad
            end
            
            self.angle = math.deg(angleRad)

            self.velocityX = 0
            self.velocityY = 0
            self:applyForce(self.angle)
            return false
        else
            return true
        end
    end
end