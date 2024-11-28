SettingsLayer = Layer:extend()

function SettingsLayer:new()
    SettingsLayer.super.new(self)
end

function SettingsLayer:load()
    local checkbox = Checkbox(Screen.x + Screen.width*0.1, Screen.y + Screen.height*0.2, "text", SettingsInfo["showFps"], function()
        SettingsInfo["showFps"] = not SettingsInfo["showFps"]
        return SettingsInfo["showFps"] 
    end)
    self:insertObject(checkbox)

    self:insertObject(Checkbox(Screen.x + Screen.width*0.1, checkbox.y + checkbox.height * 1.5, "text", SettingsInfo["debug"], function()
        SettingsInfo["debug"] = not SettingsInfo["debug"]
        return SettingsInfo["debug"] 
    end))
end

function SettingsLayer:update()
    SettingsLayer.super.update(self)
end

