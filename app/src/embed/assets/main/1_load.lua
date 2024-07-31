function love.load()
    LM = LayerManager()

    SettingsInfo["OS"] = love.system.getOS()

    if SettingsInfo["OS"] == "Windows" then
        love.window.updateMode(love.graphics.getWidth(), love.graphics.getHeight(), { fullscreen = false, vsync = SettingsDisplay["vsync"] })
    else
        love.window.updateMode(love.graphics.getWidth(), love.graphics.getHeight(), { fullscreen = SettingsDisplay["fullscreen"], vsync = SettingsDisplay["vsync"] })--, usedpiscale=false
    end

    Canvas = love.graphics.newCanvas(love.graphics.getWidth() / SettingsScale["x"], love.graphics.getHeight() / SettingsScale["y"], SettingsCanvas)
    Screen = BasicObject(0, 0, Canvas:getWidth(), Canvas:getHeight())

    HasSomeTimePassed = false
    HasSomeTimePassedCounter = 0

    LM:insertObject(BasicMc(1, 1, 10, 10), "players")
    LM:setMC(LM:getCollection("players")[1])
    PlayableArea = {
        x = Screen.x + Screen.width * 0.05,
        y = Screen.y + 1,
        widthmin = Screen.width * 0.05,
        width = Screen.width * 0.95,
        height = Screen.height
    }
    --MakeBoundaires() --remove this
    --tileGeneratorInst = TileGenerator(PlayableArea["x"], PlayableArea["y"], PlayableArea["width"], PlayableArea["height"])


    local mc = LM:getMC()
    mc.x, mc.y = Screen.x + Screen.width * 0.5 - mc.height * 0.5, Screen.y + Screen.height * 0.5

    waste = BasicJoystick(Screen.x, Screen.y + Screen.height, mc)
    waste.x = waste.x + waste.width
    waste.y = waste.y - waste.height
    LM:insertObject(waste, "hud")

    local waste = ShootJoystick(Screen.x + Screen.width, Screen.y + Screen.height, mc)
    waste.x = waste.x - waste.width
    waste.y = waste.y - waste.height
    LM:insertObject(waste, "hud")


end
