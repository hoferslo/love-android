local className = "BasicJoystick"
ImagesData[className] = {"1.png", "2.png"}
local path = "objects/hud/Joystick/images/"
Get_images(className, path)

BasicJoystick=BasicHud:extend()

function BasicJoystick:new (x, y, controlledObject)
    BasicJoystick.super.new(self, x, y, className)
    self.xhitTouch = Images[self.image][2]:getWidth()*SettingsScale["x"]
    self.yhitTouch = Images[self.image][2]:getHeight()*SettingsScale["y"]
    self.xTouch = 0
    self.yTouch = 0
    self.controlledObject = controlledObject
end


function BasicJoystick:fun()
    self:ResetJoystick()
    BasicJoystick.super.fun(self)
    
end

function BasicJoystick:ResetJoystick()
    self.xTouch = self.x + self.xhit - self.xhitTouch * 0.5
    self.yTouch = self.y + self.xhit - self.yhitTouch * 0.5
end

function BasicJoystick:SetJoystick(x, y)
    self.xTouch = x + self.xhit * 0.5 - self.xhitTouch * 0.5
    self.yTouch = y + self.yhit * 0.5 - self.yhitTouch * 0.5
end

function BasicJoystick:Touch(x, y)
    self:SetJoystick(x, y)
    
    self.controlledObject:AddMovement(nil, self.angleToTouch)
end

function BasicJoystick:draw()
    love.graphics.setColor(self.color)

    love.graphics.draw(Images[self.image][1], self.x + self.xhit*0.5, self.y + self.yhit*0.5, 0, SettingsScale["x_images"], SettingsScale["y_images"], self.xhitHalf/SettingsScale["x_images"], self.yhitHalf/SettingsScale["y_images"])
    love.graphics.draw(Images[self.image][2], self.xTouch, self.yTouch, 0, SettingsScale["x_images"], SettingsScale["y_images"], self.xhitHalf/SettingsScale["x_images"], self.yhitHalf/SettingsScale["y_images"])
    love.graphics.line(self.x + self.xhit*0.5 , self.y + self.yhit*0.5 , self.xTouch - self.xhit*0.5 + self.xhitTouch*0.5, self.yTouch - self.yhit*0.5 + self.yhitTouch*0.5)
end

function BasicJoystick:OnLetGo()
    
    
end