Layer = Object:extend()

function Layer:new()
    self.collections = {
        players = {},
        buttons = {},
        objects = {},
        enemies = {},
        enemyProj = {},
        playerProj = {},
        particles = {},
        storage = {},
        strings = {},
        gores = {},
        particlesBackground = {},
        objectsBackground = {},
        enemiesDead = {},
        hud = {},
        borders = {},
        tiles = {},
        enviorment = {},
        enviormentCollide = {},
        itemsOnGround = {}
    }

    self.mc = nil
end

function Layer:setMC(character)
    self.mc = character
end

function Layer:getMC()
    return self.mc
end

function Layer:update()
    ForLoop(self.collections["tiles"])
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

function Layer:draw()
    -- Draw logic for the layer
    for _, collection in pairs(self.collections) do
        for _, obj in pairs(collection) do
            obj:draw()
        end
    end
    if self.mc then
        self.mc:draw()
    end
end