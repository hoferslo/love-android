local className = "ButtonPlay"
ImagesData[className] = { "1.png" }
local path = "objects/hud/Buttons/ButtonPlay/images/"
Get_images(className, path)

ButtonPlay = Button:extend()

function ButtonPlay:new (x, y)
    ButtonPlay.super.new(self, x, y, className)
    self.timeHeld = 0

end

function ButtonPlay:update()
    ButtonPlay.super.update(self)

end


function ButtonPlay:OnLetGo()
    ButtonPlay.super.OnLetGo(self)
    LM:addLayer(GameLayer())
end