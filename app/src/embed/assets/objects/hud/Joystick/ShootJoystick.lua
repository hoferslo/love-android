local className = "ShootJoystick"
ImagesData[className] = { "1.png", "2.png" }
local path = "objects/hud/Joystick/images/"
Get_images(className, path)

ShootJoystick = BasicJoystick:extend()

function ShootJoystick:new (x, y, controlledObject)
    ShootJoystick.super.new(self, x, y, className)
    self.widthTouch = Images[self.image][2]:getWidth() * SettingsScale["x"]
    self.heightTouch = Images[self.image][2]:getHeight() * SettingsScale["y"]
    self.xTouch = 0
    self.yTouch = 0
    self.controlledObject = controlledObject
end

function ShootJoystick:update()
    self:ResetJoystick()
    ShootJoystick.super.update(self)

end

function ShootJoystick:Touch(x, y)
    self:SetJoystick(x, y)

    self.controlledObject:shoot(self.angleToTouch)
end

function ShootJoystick:OnLetGo()

end