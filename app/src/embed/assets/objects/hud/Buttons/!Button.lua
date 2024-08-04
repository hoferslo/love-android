local className = "Button"
ImagesData[className] = { "1.png" }
local path = "objects/hud/Buttons/images/"
Get_images(className, path)

Button = BasicHud:extend()

function Button:new (x, y)
    Button.super.new(self, x, y, className)
    self.timeHeld = 0

end

function Button:update()
    Button.super.update(self)

end

function Button:Touch(x, y)
    self.timeHeld = self.timeHeld + 1
end

function Button:OnLetGo()
    LM:addLayer(GameLayer())
end


function Button:draw()
    
    Button.super.draw(self)
end
