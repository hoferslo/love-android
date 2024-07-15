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



function Get_images(name, path)
    local waste_table = ImagesData[name]
    ImagesData[name] = {}
    for index, value in ipairs(waste_table) do
        ImagesData[name][index] = love.image.newImageData(path..value)
    end
    Images[name]={}
    Images[name.."_silhouette"]={}
    ImagesData[name.."_silhouette"]={}
    for c, i in pairs(ImagesData[name]) do
        Images[name][c] = love.graphics.newImage(i)
        local imageData = love.image.newImageData(i:getWidth(), i:getHeight())
        for x = 0, i:getWidth() - 1 do
            for y = 0, i:getHeight() - 1 do
                local r, g, b, a = i:getPixel(x, y)
                if a~=0 then
                imageData:setPixel(x, y, 1, 1, 1, a)
                end
            end
        end
        table.insert(ImagesData[name.."_silhouette"], imageData)
        table.insert(Images[name.."_silhouette"], love.graphics.newImage(imageData))
    end
end



function ForLoop(something)
    for i=#something,1,-1 do
        if something[i]:fun() then
            table.remove(something, i)
        end
    end
end


function ForLoopDict(something)
    for key, value in pairs(something) do
        if value:fun() then
            table.remove(something, key)
          end
    end
end

function ForDraw(something)
    for i=1, #something, 1 do
        if CheckCollision(Screen, something[i]) then
            something[i]:draw()
        end
    end
    love.graphics.setColor(1,1,1,1)
end

function ForDrawDict(something)
    for key, value in pairs(something) do
        if CheckCollision(Screen, value) then
            value:draw()
        end
    end
    love.graphics.setColor(1,1,1,1)
end