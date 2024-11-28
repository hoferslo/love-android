LevelSelectionLayer = Layer:extend()

function LevelSelectionLayer:new()
    LevelSelectionLayer.super.new(self)
    self.mc = nil
end

function LevelSelectionLayer:load()
    
    local campaigns = {}
    table.insert(campaigns, ObjectScrollerY(0,10, 150, 100, {ButtonPlay(25,0), ButtonPlay(25,50)}))
    for i = 3, 10 do
        table.insert(campaigns, ButtonPlay(25 + math.random(0, 50), 50 * i))
    end
    
    self:insertObject(ObjectScrollerY(Screen.width * 0.1, Screen.height * 0.1, Screen.width * 0.3, Screen.height * 0.8, campaigns))
end

function LevelSelectionLayer:update()
    LevelSelectionLayer.super.update(self)
end

