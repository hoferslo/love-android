local className = "Checkbox"
ImagesData[className] = { "1.png", "2.png"}
local path = "objects/hud/Buttons/Checkbox/images/"
Get_images(className, path)

Checkbox = Button:extend()

function Checkbox:new (x, y, text, checked, code, params)
    Checkbox.super.new(self, x, y, className)
    self.text = text or ""
    self.code = code
    self.checked = checked
    self.params = params or {}
end

function Checkbox:update()
    Checkbox.super.update(self)
    if self.checked then
        self.imageIndex = 2
    else
        self.imageIndex = 1
    end
end


function Checkbox:OnLetGo()
    Checkbox.super.OnLetGo(self)
    if self.code then
        self.checked = self.code(table.unpack(self.params))
    end
end


function Checkbox:draw()
    Checkbox.super.draw(self)
    --love.graphics.print(self.text, self.x + self.width, self.y, 5)
end
--[[
this is how you use this
local checkbox = Checkbox(100, 200, function(param1, param2)
    print("Checkbox released with:", param1, param2)
end, { "Hello", 123 })



--]]