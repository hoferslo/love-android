local className = "BasicJoystick"
ImagesData[className] = {"1.png", "2.png"}
local path = "objects/hud/Joystick/images/"
Get_images(className, path)

BasicJoystick=BasicHud:extend()

function BasicJoystick:new (x, y, controlledObject)
    BasicJoystick.super.new(self, x, y, className)
    self.widthTouch = Images[self.image][2]:getWidth()*SettingsScale["x"]
    self.heightTouch = Images[self.image][2]:getHeight()*SettingsScale["y"]
    self.xTouch = 0
    self.yTouch = 0
    self.controlledObject = controlledObject
end


function BasicJoystick:update()
    self:ResetJoystick()
    BasicJoystick.super.update(self)
    
end

function BasicJoystick:ResetJoystick()
    self.xTouch = self.x + self.width - self.widthTouch * 0.5
    self.yTouch = self.y + self.width - self.heightTouch * 0.5
end

function BasicJoystick:SetJoystick(x, y)
    self.xTouch = x + self.width * 0.5 - self.widthTouch * 0.5
    self.yTouch = y + self.height * 0.5 - self.heightTouch * 0.5
end

function BasicJoystick:Touch(x, y)
    BasicJoystick.super.Touch(self)
    self:SetJoystick(x, y)
    
    self.controlledObject:applyForce(self.angleToTouch, nil)
end

function BasicJoystick:draw()
    love.graphics.setColor(self.color)

    love.graphics.draw(Images[self.image][1], self.x + self.width*0.5, self.y + self.height*0.5, 0, SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf/SettingsScale["x_images"], self.heightHalf/SettingsScale["y_images"])
    love.graphics.draw(Images[self.image][2], self.xTouch, self.yTouch, 0, SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf/SettingsScale["x_images"], self.heightHalf/SettingsScale["y_images"])
    love.graphics.line(self.x + self.width*0.5 , self.y + self.height*0.5 , self.xTouch - self.width*0.5 + self.widthTouch*0.5, self.yTouch - self.height*0.5 + self.heightTouch*0.5)
end

function BasicJoystick:OnLetGo()
    
    
end