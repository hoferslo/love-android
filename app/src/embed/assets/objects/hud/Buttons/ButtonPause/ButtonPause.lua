local className = "ButtonPause"
ImagesData[className] = { "1.png" }
local path = "objects/hud/Buttons/ButtonPause/images/"
Get_images(className, path)

ButtonPause = Button:extend()

function ButtonPause:new (x, y)
    ButtonPause.super.new(self, x, y, className)
    self.timeHeld = 0

end

function ButtonPause:update()
    ButtonPause.super.update(self)

end


function ButtonPause:OnLetGo()
    ButtonPause.super.OnLetGo(self)
    LM:addLayer(PauseLayer())
end
