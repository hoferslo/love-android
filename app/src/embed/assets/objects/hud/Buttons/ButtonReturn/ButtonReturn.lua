local className = "ButtonReturn"
ImagesData[className] = { "1.png" }
local path = "objects/hud/Buttons/ButtonReturn/images/"
Get_images(className, path)

ButtonReturn = Button:extend()

function ButtonReturn:new (x, y)
    ButtonReturn.super.new(self, x, y, className)
    self.timeHeld = 0

end

function ButtonReturn:update()
    ButtonReturn.super.update(self)

end


function ButtonReturn:OnLetGo()
    ButtonReturn.super.OnLetGo(self)
    LM:removeLayer()
end
