PauseLayer = Layer:extend()

function PauseLayer:new()
    PauseLayer.super.new(self)

end

function PauseLayer:load()

    local waste = ButtonReturn(0, 0)
    waste.x = Screen.width*0.01
    waste.y = Screen.height*0.01
    self:insertObject(waste)

    self:insertObject(ButtonHome(Screen.width*0.5, Screen.height*0.5))
    
end

function PauseLayer:update()
    PauseLayer.super.update(self)

end

