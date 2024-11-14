
BouncyProjectile=BasicProjectile:extend()
-- doont use yet, not finished
function BouncyProjectile:new (x, y, width, height, angle, speed, friction)
    BouncyProjectile.super.new(self, x, y, width, height, angle, speed, friction)
    self.numOfBouncesLeft = 20
    self.lifeTime = 5 * SettingsDt["game_tick"]
end


function BouncyProjectile:update()
    BouncyProjectile.super.update(self)
    self.lifeTime = self.lifeTime - 1
    if self.lifeTime < 0 then
        --return true
    end
end

function BouncyProjectile:hit(enemy)
    if BouncyProjectile.super.hit(self, enemy) then
        if self.numOfBouncesLeft > 0 then
            self:snapOutOfWalls(enemy)
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
            
            -- Update angle to new reflected angle
            self.angle = math.deg(angleRad)

            -- Reset velocities and apply force in the new direction
            self.velocityX = 0
            self.velocityY = 0
            self:applyForce(self.angle)

            -- Snap out of wall tiles if overlapping
            

            return false -- Projectile is still active after bounce
        else
            return true -- No bounces left, projectile is finished
        end
    end
end

-- Define the snapOutOfWalls function
function BouncyProjectile:snapOutOfWalls(object)
    -- Small increment for moving out of walls, adjust as needed
    local snapDistance = 1
    local maxAttempts = 20 -- Limit attempts to avoid infinite loops

    local attempt = 0
    while self:checkCollision(object) and attempt < maxAttempts do
        -- Move the bullet slightly in the opposite direction of its angle
        local angleRad = math.rad(self.angle)
        self.x = self.x - math.cos(angleRad) * snapDistance
        self.y = self.y - math.sin(angleRad) * snapDistance

        attempt = attempt + 1
    end
end
