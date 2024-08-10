CampaignSelectionLayer = Layer:extend()

function CampaignSelectionLayer:new()
    CampaignSelectionLayer.super.new(self)
    self.mc = nil
end

function CampaignSelectionLayer:load()
    
    --local campaigns = {SomeCampaignHud(0,0), ...}
    local campaigns = {}
    for i = 0, 10 do
        table.insert(campaigns, ButtonPlay(50 * i,25 + math.random(0, 50)))
    end
    --LM:insertObjects(campaigns)
    self:insertObject(ObjectScrollerX(Screen.width * 0.1, Screen.height * 0.1, Screen.width * 0.8, Screen.height * 0.8, campaigns))
end

function CampaignSelectionLayer:update()
    CampaignSelectionLayer.super.update(self)
end

