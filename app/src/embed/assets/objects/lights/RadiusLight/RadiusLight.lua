local className = "RadiusLight"
ImagesData[className] = { "1.png"}
local path = "objects/lights/RadiusLight/images/"
Get_images(className, path)

RadiusLight = BasicLight:extend()


function RadiusLight:new (x, y, radius, decayRateSeconds, color, angle, speed, friction) --figure out how to automatically remove lights without using external removeLight
    RadiusLight.super.new(self, x, y, radius, color, angle, speed, friction, className)
    local decayRateSeconds = decayRateSeconds or 0.5
    self.decayRateRadius = self.radius / decayRateSeconds / SettingsDt["game_tick"] 
    self.friction = 0.95
    self:applyForce()
end

function RadiusLight:update()
    if self.radius < 0 then
        self.alive = false
    end
    if self.decayRateRadius ~= nil then
        self.radius = self.radius - self.decayRateRadius
    end

    return RadiusLight.super.update(self)
end
