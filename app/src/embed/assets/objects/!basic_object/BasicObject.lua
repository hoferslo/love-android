-- BasicObject Class Definition
BasicObject = Object:extend()

CollisionGroups = {
    "players",
    "enemies",
    "borders",
    --"chunks", --this one has acustom code for collision
    "enviormentCollide",
    "itemsOnGround"
}

function BasicObject:new(x, y, width, height, color)
    self.x = x
    self.y = y
    self.width = width * SettingsScale["x_images"]
    self.height = height * SettingsScale["y_images"]
    self.speed = 0.2 * SettingsScale["y_images"]
    self.angle = 0  -- Movement angle in degrees
    self.velocityX = 0  -- Velocity on X-axis
    self.velocityY = 0  -- Velocity on Y-axis
    self.friction = 0.75  -- Friction coefficient to decelerate the object
    self.collisionGroups = nil --{ "borders" } --set value to this variable, if you want custom collision groups
    self.hasStandardCollision = true  -- If false, the object must override customCollideX and customCollideY --useless???
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

function BasicObject:onDestroy()
    if self.light ~= nil then
        self.light:onDestroy()
    end
end

function BasicObject:center()
    self.x = self.x - self.width * 0.5
    self.y = self.y - self.height * 0.5
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

function BasicObject:followObject(diffX, diffY)
    self.x = self.x + diffX
    self.y = self.y + diffY
end

function BasicObject:draw()
    -- Draw the object
    love.graphics.setColor(self.color)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function BasicObject:handleCollisionX(obstacle)
    -- Handle collision response on X-axis
    if self:checkCollision(obstacle) then
        if self ~= obstacle then
            if obstacle.hasStandardCollision == true then
                self:collisionLogicX(obstacle)
            else
                obstacle:customCollideY(self)
            end
        end
    end
end

function BasicObject:collisionLogicX(obstacle)
    if self.x + self.width / 2 < obstacle.x + obstacle.width / 2 then
        self.x = obstacle.x - self.width
    else
        self.x = obstacle.x + obstacle.width
    end
    self.velocityX = self.velocityX * 0.5
end

function BasicObject:handleCollisionY(obstacle)
    -- Handle collision response on Y-axis
    
    if self:checkCollision(obstacle) then
        if self ~= obstacle then
            if obstacle.hasStandardCollision == true then
                self:collisionLogicY(obstacle)
            else
                obstacle:customCollideY(self)
            end
        end
    end
end



function BasicObject:collisionLogicY(obstacle)
    if self.y + self.height / 2 < obstacle.y + obstacle.height / 2 then
        self.y = obstacle.y - self.height
    else
        self.y = obstacle.y + obstacle.height
    end
    self.velocityY = self.velocityY * 0.5
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
    local cg = self.collisionGroups or CollisionGroups
    for _, group in pairs(cg) do
        for _, obstacle in pairs(LM:getCollection(group)) do
            self:handleCollisionX(obstacle)
        end
    end

    for _, chunk in pairs(LM:getCollection("chunks")) do --for the object to not have collision with chunks, use a custom checkCollisionX (does it exist?), you can even just override checkCollisionX
        if self:checkCollision(chunk) then
            for _, tile in pairs(chunk.tiles) do
                self:handleCollisionX(tile)
            end
        end
    end

end

function BasicObject:checkCollisionY()
    -- Check and handle collisions on the Y-axis
    local cg = self.collisionGroups or CollisionGroups
    for _, group in pairs(cg) do
        for _, obstacle in pairs(LM:getCollection(group)) do
            self:handleCollisionY(obstacle)
        end
    end

    for _, chunk in pairs(LM:getCollection("chunks")) do
        if self:checkCollision(chunk) then
            for _, tile in pairs(chunk.tiles) do
                self:handleCollisionY(tile)
            end
        end
    end

end

function BasicObject:customCollideX(object)

end

function BasicObject:customCollideY(object)
    
end

function BasicObject:hit(obj)

end

