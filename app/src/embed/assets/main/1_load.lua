
function love.load()

    InitializeVariables()
    InitializeArrays()
    FillOutArrays()
    
    --mc.x, mc.y = Screen.x + Screen.xhit*0.5 - mc.yhit*0.5, Screen.y + Screen.yhit*0.7
    
    --table.insert(Collections["hud"], (BasicJoystick(Screen.x + Screen.xhit*0.5,Screen.y + Screen.yhit*0.9, mc)))
    

end
