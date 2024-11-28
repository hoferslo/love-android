function Require_all_lua_files(directory)
    if directory == "initialization" then
        error("Don't do initialization")
    end
    local items = love.filesystem.getDirectoryItems( directory )
    for k, item in ipairs(items) do
        if item:sub(-4) == ".lua" then
            item = item:sub(1, -5)
            require(directory.."/"..item)
        else
            Require_all_lua_files(directory.."/"..item)
        end
    end
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

if not table.unpack then
    table.unpack = unpack -- For Lua 5.1 and 5.2 compatibility
end

require "math"
require "GLOBALS"

Dkjson = require "initialization-engine/libraries/dkjson"
Net = require "initialization-engine/libraries/net"
Serialize = require "initialization-engine/libraries/ser"
Serpent = require "initialization-engine/libraries/serpent"
Object = require "initialization-engine/libraries/classic"
Lighter = require "initialization-engine/libraries/lighter"
require "initialization-engine/settings"








Require_all_lua_files("functions")
Require_all_lua_files("objects")
Require_all_lua_files("main")
Require_all_lua_files("levels")


