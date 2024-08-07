function printl(list)
    local var = "{"
    for c, i in pairs(list) do
        var = var .. tostring(i) .. ","
    end
    var = var:sub(1, -2) -- Remove the last character (comma)
    var = var .. "}"
    print(var)
end

function round(x)
    return math.floor(x+0.5)
end


function ForLoop(something)
    for i=#something,1,-1 do
        if something[i]:update() then
            table.remove(something, i)
        end
    end
end


function ForLoopDict(something)
    for key, value in pairs(something) do
        if value:update() then
            table.remove(something, key)
          end
    end
end

function ForDraw(something)
    for i=1, #something, 1 do
        if checkCollision(Screen, something[i]) then
            something[i]:draw()
        end
    end
    love.graphics.setColor(1,1,1,1)
end

function ForDrawDict(something)
    for key, value in pairs(something) do
        if checkCollision(Screen, value) then
            value:draw()
        end
    end
    love.graphics.setColor(1,1,1,1)
end