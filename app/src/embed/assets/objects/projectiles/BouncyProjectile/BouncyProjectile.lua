local className = "BouncyProjectile"
ImagesData[className] = { "1.png"}
local path = "objects/projectiles/BouncyProjectile/images/"
Get_images(className, path)


BouncyProjectile=BasicProjectile:extend()
-- doont use yet, not finished
function BouncyProjectile:new (x, y, angle, speed, friction)
    BouncyProjectile.super.new(self, x, y, angle, speed, friction)--, className) --make a custom image for this proj
    self.numOfBouncesLeft = 20
    self.lifeTime = 5 * SettingsDt["game_tick"]
    self.light = BasicLight(self.x, self.y, math.random(20,60)*0.001, {math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(0,100)*0.01,math.random(30,70)*0.01})
    self.light:follow(self)
    LM:insertObject(self.light)
end


function BouncyProjectile:update()
    BouncyProjectile.super.update(self)
    self.lifeTime = self.lifeTime - 1
    if self.lifeTime < 0 then
        --return true
    end
    if math.random(1, 10) == 1 then
        local light = RadiusLight(self.x, self.y, self.light.radius * 0.75, nil, {self.light.color[1],self.light.color[2],self.light.color[3],self.light.color[4]}, self.angle + math.random(0,20)-10)
        light.speed = self.speed * 0.5
        LM:insertObject(light)
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
