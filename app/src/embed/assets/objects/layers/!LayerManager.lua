LayerManager = Object:extend()

function LayerManager:new()
    self.layers = {}
    LevelM = LevelManager()
    self.homeLayer = CampaignSelectionLayer() 
    table.insert(self.layers, self.homeLayer)
    
end



function LayerManager:addLayer(layer)
    table.insert(self.layers, layer)
    self.layers[#self.layers]:load()
end

function LayerManager:removeLayer()
    if #self.layers > 1 then
        table.remove(self.layers)
    end
end

function LayerManager:goHome()
    self.layers = {self.homeLayer}
end

function LayerManager:update()
    if #self.layers > 0 then
        self.layers[#self.layers]:update()
    end
end

function LayerManager:insertObject(object, collection) 
    collection = collection or object.collection
    self.layers[#self.layers]:insertObject(object, collection)
end

function LayerManager:insertObjects(objects)
    for _, object in ipairs(objects) do
        self.layers[#self.layers]:insertObject(object)
    end
end


function LayerManager:getCollection(collection)
    return self.layers[#self.layers].collections[collection]
end

function LayerManager:getCollections()
    return self.layers[#self.layers].collections
end

function LayerManager:getLighter()
    return self.layers[#self.layers].lighter
end

function LayerManager:draw()
    if #self.layers > 0 then
        self.layers[#self.layers]:draw()
    end
end

function LayerManager:setMC(character)
    self.layers[#self.layers]:setMC(character)
end

function LayerManager:getMC()
    return self.layers[#self.layers]:getMC()
end