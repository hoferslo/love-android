LevelSelectionLayer = Layer:extend()

function LevelSelectionLayer:new()
    LevelSelectionLayer.super.new(self)
    self.mc = nil
end

function LevelSelectionLayer:load()
    
    self:insertObject(ButtonPlay(Screen.x + Screen.width*0.5, Screen.y + Screen.height*0.5))
end

function LevelSelectionLayer:update()
    LevelSelectionLayer.super.update(self)
end

