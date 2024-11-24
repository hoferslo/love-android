local className = "BasicMc"
ImagesData[className] = { "1.png"}
local path = "objects/mc/!BasicMc/images/"
Get_images(className, path)

BasicMc = BasicObjectImage:extend()

function BasicMc:new (x, y)
    BasicMc.super.new(self, x, y, className)
    self.posOfPress = { x = 0, y = 0 }
    self.movementType = "joystick"  --joystick
    self.hp = 1
    self.shootCooldown = 0
    self.shootCooldownMax = 10
    self.collection = "players"
    self.speed = 0.2 * SettingsScale["x_images"]
    self.friction = 0.75
    self.light = BasicLight(self.x, self.y, 0.3, {0.5,1,0.1,0.5})
    self.light:follow(self)
    LM:insertObject(self.light)
end

function BasicMc:update()
    BasicMc.super.update(self)
    self.shootCooldown = self.shootCooldown - 1
end

function BasicMc:shoot(angle)
    angle = angle or -90
    local proj = BouncyProjectile(self.x + self.width * 0.5, self.y + self.height * 0.5, angle)
    proj.x = proj.x - proj.width*0.5
    proj.y = proj.y - proj.height*0.5
    LM:insertObject(proj, "playerProj")
end
