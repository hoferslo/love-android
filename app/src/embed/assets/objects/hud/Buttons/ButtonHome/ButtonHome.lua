local className = "ButtonHome"
ImagesData[className] = { "1.png" }
local path = "objects/hud/Buttons/ButtonHome/images/"
Get_images(className, path)

ButtonHome = Button:extend()

function ButtonHome:new (x, y)
    ButtonHome.super.new(self, x, y, className)
    self.timeHeld = 0

end

function ButtonHome:update()
    ButtonHome.super.update(self)

end


function ButtonHome:OnLetGo()
    ButtonHome.super.OnLetGo(self)
    LM:goHome()
end
