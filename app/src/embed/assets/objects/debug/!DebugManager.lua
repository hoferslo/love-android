DebugManager = Object:extend()

function DebugManager:new()
    self.debugStuff = {}
end


function DebugManager:update()
    for i=#self.debugStuff,1,-1 do
        if self.debugStuff[i]:update() then
            table.remove(self.debugStuff, i)
        end
    end
end

function DebugManager:draw()
    for index, value in ipairs(self.debugStuff) do
        value.x = Screen.width*0.01
        value.y = 10 + 10 * index
        value:draw()
    end
end

function DebugManager:add(text, persist)
    table.insert(self.debugStuff, Debug(text, persist))
end