PauseLayer = Layer:extend()

function PauseLayer:new()
    PauseLayer.super.new(self)

end

function PauseLayer:load()

    self:insertObject(ButtonReturn(Screen.width*0.05, Screen.height*0.05))


    self:insertObject(ButtonHome(Screen.width*0.5, Screen.height*0.5))
    
end

function PauseLayer:update()
    PauseLayer.super.update(self)

end

