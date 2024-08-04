MainMenuLayer = Layer:extend()

function MainMenuLayer:new()
    MainMenuLayer.super.new(self)
    self.mc = nil
end

function MainMenuLayer:load()
    
    self:insertObject(Button(Screen.x + Screen.width*0.5, Screen.y + Screen.height*0.5), "hud")
end

function MainMenuLayer:update()
    MainMenuLayer.super.update(self)
end

