BasicMc = BasicObject:extend()

function BasicMc:new (x, y, width, height)
    BasicMc.super.new(self, x, y, width, height)
    self.posOfPress = { x = 0, y = 0 }
    self.movementType = "joystick"  --joystick
    self.hp = 1
    self.shootCooldown = 0
    self.shootCooldownMax = 10
    self.collection = "players"
    self.speed = 0.4
    self.friction = 0.75
    self.lightWidthMax = 900
    self.lightWidthMin = 100
    self.lightWidth = 300
    self.lightDir = 1
    self.light = LM:getLighter():addLight(self.x, self.y, self.lightWidth, 0.5,1,0.1,0.5)
end

function BasicMc:update()
    BasicMc.super.update(self)
    self.shootCooldown = self.shootCooldown - 1
    --[[if self.lightDir == 1 then 
        self.lightWidth = self.lightWidth +10
        if self.lightWidth > self.lightWidthMax then
            self.lightDir = 0
        end
    else   
        self.lightWidth = self.lightWidth -10
        if self.lightWidth < self.lightWidthMin then
            self.lightDir = 1
        end
    end]]--
    print(self.lightWidth)
    LM:getLighter():updateLight(self.light, self.x + self.width * 0.5 , self.y + self.height * 0.5, self.lightWidth)
end

function BasicMc:shoot(angle)
    angle = angle or -90
    local proj = BouncyProjectile(self.x + self.width * 0.5, self.y + self.height * 0.5, 0.1, 0.1, angle)
    proj.x = proj.x - proj.width*0.5
    proj.y = proj.y - proj.height*0.5
    LM:insertObject(proj, "playerProj")
end
