-- BasicObject Class Definition
BasicObject = Object:extend()

CollisionGroups = {
    "players",
    "enemies",
    "borders",
    --tiles,
    "enviormentCollide",
    "itemsOnGround"
}

function BasicObject:new(x, y, width, height, color)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = 0.02
    self.angle = 0  -- Movement angle in degrees
    self.velocityX = 0  -- Velocity on X-axis
    self.velocityY = 0  -- Velocity on Y-axis
    self.friction = 0.98  -- Friction coefficient to decelerate the object
    self.collisionGroups = nil --{ "borders" } --set value to this variable, if you want custom collision groups
    self.hasStandardCollision = true  -- If false, the object must override customCollideX and customCollideY
    self.color = color or { 1, 1, 1, 1 }
end

-- Movement Logic

function BasicObject:applyForce(angle, force)
    -- Apply a force in the specified angle direction (in degrees)
    angle = angle or self.angle
    local angleRad = math.rad(angle)
    force = force or self.speed
    self.velocityX = self.velocityX + force * math.cos(angleRad)
    self.velocityY = self.velocityY + force * math.sin(angleRad)
end

function BasicObject:applyFriction()
    -- Apply friction to gradually reduce the object's velocity
    self.velocityX = self.velocityX * self.friction
    self.velocityY = self.velocityY * self.friction
end

function BasicObject:updatePosition()
    -- Update the object's position based on the current velocity
    self.x = self.x + self.velocityX
    self:checkCollisionX()
    self.y = self.y + self.velocityY
    self:checkCollisionY()
    self:applyFriction()
end

function BasicObject:update()
    -- Called every frame to update the object's state
    self:updatePosition()

end

function BasicObject:calcAngle(i)
    return math.deg(math.atan2(i.y - i.height * 0.5 - self.y - self.height * 0.5, i.x - i.width * 0.5 - self.x - self.width * 0.5))
end

-- Collision Logic

function BasicObject:isOutsideScreen()
    -- Check if the object is outside the screen boundaries
    return self.x + self.width < 0 or self.x > Screen.width or self.y + self.height < 0 or self.y > Screen.height
end

function BasicObject:isOutsideBounds()
    -- Check if the object is outside the screen boundaries
    return self.x + self.width < -Screen.width or self.x > Screen.width * 2 or self.y + self.height < -Screen.height or self.y > Screen.height * 2
end

function BasicObject:draw()
    -- Draw the object
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function BasicObject:handleCollisionX(obstacle)
    -- Handle collision response on X-axis
    if self:checkCollision(obstacle) then
        if self ~= obstacle then
            if self.x + self.width / 2 < obstacle.x + obstacle.width / 2 then
                self.x = obstacle.x - self.width
            else
                self.x = obstacle.x + obstacle.width
            end
            self.velocityX = self.velocityX * 0.5

        end
    end
end

function BasicObject:handleCollisionY(obstacle)
    -- Handle collision response on Y-axis
    if self:checkCollision(obstacle) then
        if self ~= obstacle then
            if self.y + self.height / 2 < obstacle.y + obstacle.height / 2 then
                self.y = obstacle.y - self.height
            else
                self.y = obstacle.y + obstacle.height
            end
            self.velocityY = self.velocityY * 0.5
        end
    end
end

-- Function to check if two objects have collided
function BasicObject:checkCollision(obj2)
    return self.x < obj2.x + obj2.width and
            self.x + self.width > obj2.x and
            self.y < obj2.y + obj2.height and
            self.y + self.height > obj2.y
end

-- General Collision Check Functions
function BasicObject:checkCollisionX()
    -- Check and handle collisions on the X-axis
    local collisionGroups = self.collisionGroups or CollisionGroups
    for _, group in pairs(collisionGroups) do
        for _, obstacle in pairs(LM:getCollection(group)) do
            self:handleCollisionX(obstacle)
        end
    end
end

function BasicObject:checkCollisionY()
    -- Check and handle collisions on the Y-axis
    local collisionGroups = self.collisionGroups or CollisionGroups
    for _, group in pairs(collisionGroups) do
        for _, obstacle in pairs(LM:getCollection(group)) do
            self:handleCollisionY(obstacle)
        end
    end
end
