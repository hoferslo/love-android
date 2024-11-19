BasicLight = BasicObject:extend()

function BasicLight:new (x, y, radius, color, angle, speed, friction, gradientImage) --figure out how to automatically remove lights without using external removeLight
    BasicLight.super.new(self, x, y, 1, 1, color)
    self.gradientImage = gradientImage
    self.radius = radius or 50
    self.angle = angle or 0
    self.speed = speed or 2
    self.friction = friction or 1
    self.collisionGroups = {}
    self.collection = "lights"
    self.light = LM:getLighter():addLight(self.x, self.y, self.radius, self.color[1], self.color[2], self.color[3], self.color[4], gradientImage)
    LM:insertObject(self)
end

function BasicLight:update()
    BasicLight.super.update(self)
    if self.light == nil then
        return true
    end
    if self.followingThisObject ~= nil then
        self:follow(self.followingThisObject)
    end
    LM:getLighter():updateLight(self.light, self.x , self.y, self.radius, self.color[1], self.color[2], self.color[3], self.color[4])
end

function BasicLight:follow(o)
    self.followingThisObject = o
    self.x = o.x + o.width * 0.5
    self.y = o.y + o.height * 0.5
end

function BasicLight:onDestroy()
    LM:getLighter():removeLight(self.light)
    self.light = nil
end

function BasicLight:draw()
    LM:getLighter():drawLight(self.light)
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