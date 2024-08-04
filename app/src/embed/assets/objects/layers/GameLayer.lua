GameLayer = Layer:extend()

function GameLayer:new()
    GameLayer.super.new(self)

end

function GameLayer:load()

    self:insertObject(BasicMc(1, 1, 10, 10), "players")
    self.mc = self.collections["players"][1]

    self.mc.x, self.mc.y = Screen.x + Screen.width * 0.5 - self.mc.height * 0.5, Screen.y + Screen.height * 0.5

    local waste = BasicJoystick(Screen.x, Screen.y + Screen.height, self.mc)
    waste.x = waste.x + waste.width
    waste.y = waste.y - waste.height
    self:insertObject(waste, "hud")

    local waste = ShootJoystick(Screen.x + Screen.width, Screen.y + Screen.height, self.mc)
    waste.x = waste.x - waste.width
    waste.y = waste.y - waste.height
    self:insertObject(waste, "hud")

    
end

function GameLayer:update()
    GameLayer.super.update(self)

    if math.random(1, 120) == 1 then
        local enemy = TestEnemy(math.random(Screen.x + Screen.width * 0.1, Screen.x + Screen.width * 0.1 + Screen.width * 0.9), 1)

        self:insertObject(enemy)
    end
end

