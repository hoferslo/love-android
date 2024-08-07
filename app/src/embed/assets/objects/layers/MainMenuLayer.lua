MainMenuLayer = Layer:extend()

function MainMenuLayer:new()
    MainMenuLayer.super.new(self)
    self.mc = nil
end

function MainMenuLayer:load()
    
    self:insertObject(ButtonPlay(Screen.x + Screen.width*0.5, Screen.y + Screen.height*0.5))
end

function MainMenuLayer:update()
    MainMenuLayer.super.update(self)
end

