function printl(list)
    local var = "{"
    for c, i in pairs(list) do
        var = var .. tostring(i) .. ","
    end
    var = var:sub(1, -2) -- Remove the last character (comma)
    var = var .. "}"
    print(var)
end

function convertTable(list)
    local var = "{"
    for c, i in pairs(list) do
        var = var .. tostring(i) .. ","
    end
    var = var:sub(1, -2) -- Remove the last character (comma)
    var = var .. "}"
    return var
end

function convertVariableToText(s)
    if type(s) == "table" then return convertTable(s) else return tostring(s) end
end

function round(x)
    return math.floor(x+0.5)
end


function ForLoop(something)
    for i=#something,1,-1 do
        if something[i]:update() then
            something[i]:onDestroy()
            table.remove(something, i)
        end
    end
end

function ForLoopOnScreen(something)
    for i=#something,1,-1 do
        if checkCollision(Screen, something[i]) then
            if something[i]:update() then
                something[i]:onDestroy()
                table.remove(something, i)
            end
        end
    end
end


function ForLoopHit(something, arrayOfTargets)
    for i = #something, 1, -1 do
        if something[i]:update() then
            something[i]:onDestroy()
            table.remove(something, i)
        else
            for j = #arrayOfTargets, 1, -1 do
                for c = #arrayOfTargets[j], 1, -1 do
                    if something[i]:checkCollision(arrayOfTargets[j][c]) then
                        if something[i]:hit(arrayOfTargets[j][c]) then
                            something[i]:onDestroy(i)
                            table.remove(something, i)
                            break
                        end
                    end
                end
            end
        end
    end
end

function ForHitChunks(arrayOfTargets)
    for i = #LM:getCollection("chunks"), 1, -1 do
        for j = #arrayOfTargets, 1, -1 do
            for c = #arrayOfTargets[j], 1, -1 do
                if LM:getCollection("chunks")[i]:checkCollision(arrayOfTargets[j][c]) then
                    for tileCounter = #LM:getCollection("chunks")[i].tiles, 1, -1 do
                        if checkCollision(LM:getCollection("chunks")[i].tiles[tileCounter], (arrayOfTargets[j][c])) then
                            if arrayOfTargets[j][c]:hit(LM:getCollection("chunks")[i].tiles[tileCounter]) then
                                arrayOfTargets[j][c]:onDestroy()
                                table.remove(arrayOfTargets[j], c)
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end



function ForLoopDict(something)
    for key, value in pairs(something) do
        if value:update() then
            value:onDestroy()
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