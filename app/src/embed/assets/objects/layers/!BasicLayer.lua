Layer = Object:extend()

function Layer:new()
    self.collections = {
        particlesBackground = {},
        objectsBackground = {},
        tiles = {},
        chunks = {},
        enviorment = {},
        enviormentCollide = {},
        gores = {},
        itemsOnGround = {},
        players = {},
        objects = {},
        enemies = {},
        enemyProj = {},
        playerProj = {},
        particles = {},
        storage = {},
        strings = {},
        enemiesDead = {},
        hud = {},
        borders = {},
        buttons = {}
    }

    self.mc = nil

    if LM ~= nil then 
        self:load()
    end
end

function Layer:insertObject(object, collection) --maybe make automatic insertions, have each object have a string variable, collection, that is the same string as the index in BasicLayer class in collections
    collection = collection or object.collection
    table.insert(self.collections[collection], object)
end

function Layer:setMC(character)
    self.mc = character
end

function Layer:getMC()
    return self.mc
end

function Layer:load()

end

function Layer:update()
    ForLoop(self.collections["tiles"]) --maybe comment out
    ForLoop(self.collections["chunks"])
    ForLoop(self.collections["buttons"])
    ForLoop(self.collections["enemies"])
    
    for i = #self.collections["playerProj"], 1, -1 do
        if self.collections["playerProj"][i]:update() then
            table.remove(self.collections["playerProj"], i)
        else
            for c = #self.collections["enemies"], 1, -1 do
                if self.collections["playerProj"][i]:checkCollision(self.collections["enemies"][c]) then
                    if self.collections["playerProj"][i]:hit(self.collections["enemies"][c]) then
                        table.remove(self.collections["playerProj"], i)
                        break
                    end
                end
            end
        end
    end

    ForLoop(self.collections["enemyProj"])
    ForLoop(self.collections["strings"])
    ForLoop(self.collections["gores"])
    ForLoop(self.collections["enemiesDead"])
    ForLoop(self.collections["hud"])
    ForLoop(self.collections["borders"])
    ForLoop(self.collections["enviorment"])
    ForLoop(self.collections["enviormentCollide"])
    ForLoop(self.collections["itemsOnGround"])
    if self.mc then
        ForLoop({ self.mc })
        followObject(self.mc, { ["hud"] = true })
    end
end

function Layer:draw() --Don't overwrite this function
    -- Draw logic for the layer
    ForDraw(self.collections["particlesBackground"])
    ForDraw(self.collections["objectsBackground"])
    ForDraw(self.collections["tiles"]) --maybe comment out
    ForDraw(self.collections["chunks"])
    ForDraw(self.collections["enviorment"])
    ForDraw(self.collections["enviormentCollide"])
    ForDraw(self.collections["gores"])
    ForDraw(self.collections["itemsOnGround"])
    ForDraw(self.collections["players"])
    ForDraw(self.collections["objects"])
    ForDraw(self.collections["enemies"])
    ForDraw(self.collections["enemyProj"])
    ForDraw(self.collections["playerProj"])
    ForDraw(self.collections["particles"])
    ForDraw(self.collections["storage"])
    ForDraw(self.collections["strings"])
    ForDraw(self.collections["enemiesDead"])
    ForDraw(self.collections["hud"])
    ForDraw(self.collections["borders"])
    ForDraw(self.collections["buttons"])

    ForDraw(self.collections["playerProj"])
    if self.mc then
        self.mc:draw()
    end
end