
BasicMc=BasicObject:extend()

function BasicMc:new (x, y, xhit, yhit)
    BasicMc.super.new(self, x, y, xhit, yhit)
    self.vel = 0.07--0.1
    self.velSubtract = 0.01
    self.posOfPress = {x = 0, y = 0}
    self.movementType = "joystick"  --joystick
    self.hp = 1
    self.shootCooldown = 0
    self.shootCooldownMax = 10
end


function BasicMc:fun()
    BasicMc.super.fun(self)
    self.shootCooldown = self.shootCooldown - 1
    if self.shootCooldown <= 0 then
        self:shoot()
        self.shootCooldown = self.shootCooldownMax
    end
end

function BasicMc:shoot()
    local proj = BasicProjectile(self.x + self.xhit*0.5,self.y + self.yhit*0.5,1,1, -90, 1)
    table.insert(Collections["playerProj"], proj)
end
