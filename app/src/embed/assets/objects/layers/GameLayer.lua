GameLayer = Layer:extend()

function GameLayer:new()
    GameLayer.super.new(self)

end

function GameLayer:load()
    GameLayer.super.load(self)
    self:insertObject(BasicMc(1, 1, 10, 10), "players")
    self.mc = self.collections["players"][1]

    local sizeOfTile = GrassTile(1, 1).width
    self.mc.x, self.mc.y = sizeOfTile * 26, sizeOfTile * 26

    local waste = ArrowJoystick(Screen.x, Screen.y + Screen.height, self.mc)
    waste.x = waste.x + Screen.width * 0.075
    waste.y = waste.y - waste.height - Screen.height * 0.1
    self:insertObject(waste, "hud")

    local waste = ShootJoystick(Screen.x + Screen.width, Screen.y + Screen.height, self.mc)
    waste.x = waste.x - waste.width - Screen.width * 0.075
    waste.y = waste.y - waste.height - Screen.height * 0.1
    self:insertObject(waste, "hud")

    local waste = ButtonPause(0, 0)
    waste.x = Screen.width*0.01
    waste.y = Screen.height*0.01
    self:insertObject(waste)

    
    LevelM:generateLevel(1, self)
end

function GameLayer:update()
    GameLayer.super.update(self)
    DM:add(#self.collections["playerProj"])
    --if math.random(1, 120) == 1 then
    --    local enemy = TestEnemy(math.random(Screen.x + Screen.width * 0.1, Screen.x + Screen.width * 0.1 + Screen.width * 0.9), 1)
    --
    --    self:insertObject(enemy)
    --end
end

