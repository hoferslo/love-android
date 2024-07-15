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

require "math"
require "GLOBALS"

Dkjson = require "initialization-engine/libraries/dkjson"
Net = require "initialization-engine/libraries/net"
Serialize = require "initialization-engine/libraries/ser"
Serpent = require "initialization-engine/libraries/serpent"
Object = require "initialization-engine/libraries/classic"
require "initialization-engine/settings"









Require_all_lua_files("functions")
Require_all_lua_files("objects")
Require_all_lua_files("main")


