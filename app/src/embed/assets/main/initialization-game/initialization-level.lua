


function FillOutArrays()

    --table.insert(Collections["players"], BasicMc(1,1))
    --mc = Collections["players"][1]
    PlayableArea = {
        x = Screen.x+Screen.xhit*0.05,
        y = Screen.y + 1,
        xhitmin = Screen.xhit*0.05,
        xhit = Screen.xhit*0.95,
        yhit = Screen.yhit
    }
    --MakeBoundaires() --remove this
    --tileGeneratorInst = TileGenerator(PlayableArea["x"], PlayableArea["y"], PlayableArea["xhit"], PlayableArea["yhit"])
    

  end

function MakeBoundaires()
    --Collections["borders"]["left"] = ForceBorderXLeft(Screen.x, Screen.y, PlayableArea["xhitmin"], Screen.yhit, true) --rewrite to use angle
    Collections["borders"]["left"] = BasicBorder(Screen.x-Screen.xhit, Screen.y-Screen.yhit, Screen.xhit, Screen.yhit*3) 
    --Collections["borders"]["right"] = ForceBorderXRight(Screen.x + PlayableArea["xhit"], Screen.y, PlayableArea["xhitmin"], Screen.yhit, true) 
    Collections["borders"]["right"] = BasicBorder(Screen.x + Screen.xhit, Screen.y-Screen.yhit, Screen.xhit, Screen.yhit*3) 
    Collections["borders"]["up"] = ForceBorderYDown(Screen.x, Screen.y, Screen.xhit, Screen.yhit*0.3) 
    Collections["borders"]["up_outside"] = BasicBorder(Screen.x-Screen.xhit, Screen.y-Screen.yhit, Screen.xhit+Screen.xhit*3, Screen.yhit) 
    Collections["borders"]["down"] = BasicBorder(Screen.x-Screen.xhit, Screen.y+Screen.yhit, Screen.xhit+Screen.xhit*3, Screen.yhit) 
    print(Collections["borders"]["down"].x, Collections["borders"]["down"].y)
end