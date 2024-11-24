local className = "BasicProjectile"
ImagesData[className] = { "1.png", "2.png"}
local path = "objects/projectiles/!BasicProjectile/images/"
Get_images(className, path)


BasicProjectile = BasicObjectImage:extend()

function BasicProjectile:new (x, y, angle, speed, friction, image)
    local img = image or className
    BasicProjectile.super.new(self, x, y, img)
    self.angle = angle or 0
    self.speed = speed or 2
    self.speed = self.speed * SettingsScale["x_images"]
    self.friction = friction or 1
    self.type = "normal"
    self.dmg = 1
    self.collisionGroups = { }
    self:applyForce(nil)
    self.collection = "enemyProj"
    self.imageIndex = 1

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

function BasicProjectile:updatePosition()
    -- Update the object's position based on the current velocity
    self.x = self.x + self.velocityX
    self.y = self.y + self.velocityY
    self:applyFriction()
end
