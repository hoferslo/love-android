function InitializeArrays()

  Collections = {
    players={},
    buttons={},
    objects={},
    enemies={},
    enemyProj={},
    playerProj={},
    particles={},
    storage={},
    strings={},
    gores={},
    particlesBackground={},
    objectsBackground={},
    enemiesDead={},
    hud={},
    borders={},
    tiles = {},
    enviorment = {},
    enviormentCollide = {},
    itemsOnGround = {}
  }

end

function InitializeVariables()
  SettingsInfo["OS"] = love.system.getOS()
  Canvas = love.graphics.newCanvas( love.graphics.getWidth()/SettingsScale["x"], love.graphics.getHeight()/SettingsScale["y"], SettingsCanvas)
  Screen = BasicObject(0,0,Canvas:getWidth(), Canvas:getHeight())
  if SettingsInfo["OS"] == "Windows" then
    love.window.updateMode( love.graphics.getWidth(), love.graphics.getHeight(), {fullscreen=false, vsync=SettingsDisplay["vsync"]})
  else
    love.window.updateMode( love.graphics.getWidth(), love.graphics.getHeight(), {fullscreen=SettingsDisplay["fullscreen"], vsync=SettingsDisplay["vsync"]})--, usedpiscale=false
  end
  HasSomeTimePassed = false
  HasSomeTimePassedCounter = 0

end