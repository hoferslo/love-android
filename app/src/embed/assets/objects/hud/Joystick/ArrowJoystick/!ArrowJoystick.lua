local className = "ArrowJoystick"
ImagesData[className] = {"1.png", "2.png", "3.png"}
local path = "objects/hud/Joystick/ArrowJoystick/images/"
Get_images(className, path)

ArrowJoystick=BasicHudImage:extend()

function ArrowJoystick:new (x, y, controlledObject)
    ArrowJoystick.super.new(self, x, y, className)
    self.widthTouch = Images[self.image][2]:getWidth()*SettingsScale["x"]*SettingsScale["x_images"]
    self.heightTouch = Images[self.image][2]:getHeight()*SettingsScale["y"]*SettingsScale["y_images"]
    self.xTouch = 0
    self.yTouch = 0
    self.controlledObject = controlledObject
    self.simplifiedAngle = self.angle
end


function ArrowJoystick:update()

    ArrowJoystick.super.update(self)
    
end



function ArrowJoystick:SetJoystick(x, y)
    self.xTouch = x + self.width * 0.5 - self.widthTouch * 0.5
    self.yTouch = y + self.height * 0.5 - self.heightTouch * 0.5
end

function ArrowJoystick:Touch(x, y)
    ArrowJoystick.super.Touch(self, x, y)
    self.simplifiedAngle = self:simplifyAngle(self.angleToTouch)
    
    self.controlledObject:applyForce(self.simplifiedAngle, nil)
end

function ArrowJoystick:simplifyAngle(angle)
    for i = -180, 180, 45 do
        if angle > i - 22.5 and angle < i + 45 - 22.5 then
            return i
        end
    end
end

function ArrowJoystick:draw()
    love.graphics.setColor(self.color)
    love.graphics.draw(Images[self.image][1], self.x + self.width*0.5, self.y + self.height*0.5, 0, SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf/SettingsScale["x_images"], self.heightHalf/SettingsScale["y_images"])
    
    for i = 0, 360, 45 do
        love.graphics.draw(Images[self.image][3], self.x + self.width*0.5, self.y + self.height*0.5, math.rad(i), SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf/SettingsScale["x_images"]*0.85, self.heightHalf/SettingsScale["y_images"]*0.85)
    end
    
    if self.isBeingPressed then
        love.graphics.setColor(0.7, 0.6, 0.1, 0.5)
        love.graphics.draw(Images[self.image_silhouette][3], self.x + self.width*0.5, self.y + self.height*0.5, math.rad(self.simplifiedAngle + 135), SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf/SettingsScale["x_images"]*0.85, self.heightHalf/SettingsScale["y_images"]*0.85)
    end
end

function ArrowJoystick:OnLetGo()

end
