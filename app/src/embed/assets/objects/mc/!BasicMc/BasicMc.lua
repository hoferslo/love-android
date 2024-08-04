BasicMc = BasicObject:extend()

function BasicMc:new (x, y, width, height)
    BasicMc.super.new(self, x, y, width, height)
    self.posOfPress = { x = 0, y = 0 }
    self.movementType = "joystick"  --joystick
    self.hp = 1
    self.shootCooldown = 0
    self.shootCooldownMax = 10
    self.collection = "players"
end

function BasicMc:update()
    BasicMc.super.update(self)
    self.shootCooldown = self.shootCooldown - 1
    if self.shootCooldown <= 0 then
        for i = 1, 36 do
            self:shoot(i * 10)
        end

        self.shootCooldown = self.shootCooldownMax
    end
end

function BasicMc:shoot(angle)
    angle = angle or -90
    local proj = BasicProjectile(self.x + self.width * 0.5, self.y + self.height * 0.5, 1, 1, angle)
    LM:insertObject(proj, "playerProj")
end
