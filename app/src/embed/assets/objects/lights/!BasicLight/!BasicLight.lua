local className = "BasicLight"
ImagesData[className] = { "1.png"}
local path = "objects/lights/!BasicLight/images/"
Get_images(className, path)

BasicLight = BasicObjectImage:extend()


function BasicLight:new (x, y, radius, color, angle, speed, friction, image)
    className = image or className
    self.radius = radius or 0.2
    BasicLight.super.new(self, x, y, className, color)
    self.color = color or {1,1,1,0.5}
    self.angle = angle or math.random(0, 360)
    self.speed = speed or 2
    self.friction = friction or 1
    self.collisionGroups = {}
    self.collection = "lights"
    self.alive = true
end

function BasicLight:update()
    BasicLight.super.update(self)
    if self.alive == false then
        return true
    end
    if self.followingThisObject ~= nil then
        self:follow(self.followingThisObject)
    end
end

function BasicLight:draw()
    love.graphics.setColor(self.color)
    love.graphics.draw(Images[self.image][self.imageIndex], self.x , self.y, math.rad(self.angle), SettingsScale["x_images"] * self.radius, SettingsScale["y_images"] * self.radius, self.widthHalf / SettingsScale["x_images"], self.heightHalf / SettingsScale["y_images"])
end


function BasicLight:follow(o)
    self.followingThisObject = o
    self.x = o.x + o.width * 0.5
    self.y = o.y + o.height * 0.5
end

function BasicLight:onDestroy()
    --LM:getLighter():removeLight(self.light)
    --self.light = nil
    self.alive = false
end



--had to override, to ignore chunks collision
function BasicLight:checkCollisionX()
    local cg = self.collisionGroups or CollisionGroups
    for _, group in pairs(cg) do
        for _, obstacle in pairs(LM:getCollection(group)) do
            self:handleCollisionX(obstacle)
        end
    end
end
--had to override, to ignore chunks collision
function BasicLight:checkCollisionY()
    local cg = self.collisionGroups or CollisionGroups
    for _, group in pairs(cg) do
        for _, obstacle in pairs(LM:getCollection(group)) do
            self:handleCollisionY(obstacle)
        end
    end
end