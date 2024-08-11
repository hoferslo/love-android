CampaignSelectionLayer = Layer:extend()

function CampaignSelectionLayer:new()
    CampaignSelectionLayer.super.new(self)
    self.mc = nil
end

function CampaignSelectionLayer:load()
    
    --local campaigns = {SomeCampaignHud(0,0), ...}
    local campaigns = {}
    
    for i = 3, 10 do
        table.insert(campaigns, ButtonPlay(50 * i,25 + math.random(0, 50)))
    end

    table.insert(campaigns, ObjectScrollerY(50 * 11,Screen.height * 0.1, 100, Screen.height * 0.6, {ButtonPlay(25,0), ButtonPlay(25,50), ButtonPlay(25,100), ButtonPlay(25,150), ButtonPlay(25,200), ButtonPlay(25,250)})) --create padding instead of setting x values to objects that will be added to the scroller

    for i = 13, 23 do
        table.insert(campaigns, ButtonPlay(50 * i,25 + math.random(0, 50)))
    end

    self:insertObject(ObjectScrollerX(Screen.width * 0.1, Screen.height * 0.1, Screen.width * 0.8, Screen.height * 0.8, campaigns))
end

function CampaignSelectionLayer:update()
    CampaignSelectionLayer.super.update(self)
end

