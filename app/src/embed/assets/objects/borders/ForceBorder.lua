
ForceBorderYDown=BasicBorder:extend()


function ForceBorderYDown:new (x, y, width, height, destroyOnTouch)
    ForceBorderYDown.super.new(self, x, y, width, height)
    self.destroyOnTouch = destroyOnTouch
    self.hasStandardCollision = false

end

function ForceBorderYDown:customCollideY(object)

    local forceMultiplier = (self.y+self.height / object.y) - 0.5
    --object:addForce(object.vel*forceMultiplier, 90, object.velSubtract*forceMultiplier)


end
function ForceBorderYDown:customCollideX(object)

end
-----------------------------------------------------

ForceBorderYUp=BasicBorder:extend()


function ForceBorderYUp:new (x, y, width, height, destroyOnTouch)
    ForceBorderYUp.super.new(self, x, y, width, height)
    self.destroyOnTouch = destroyOnTouch
    self.hasStandardCollision = false

end

function ForceBorderYUp:customCollideY(object)

    local forceMultiplier = (self.y+self.height / object.y) - 0.5
    --object:addForce(object.vel*forceMultiplier, 270, object.velSubtract*forceMultiplier)


end
function ForceBorderYUp:customCollideX(object)

end
--------------------------------------------

ForceBorderXRight=BasicBorder:extend()


function ForceBorderXRight:new (x, y, width, height, destroyOnTouch)
    ForceBorderXRight.super.new(self, x, y, width, height)
    self.destroyOnTouch = destroyOnTouch
    self.hasStandardCollision = false

end

function ForceBorderXRight:customCollideY(object)

end

function ForceBorderXRight:customCollideX(object)
    local forceMultiplier = ((object.x + object.width - self.x) / (self.width*0.5)) + 0.5

    --object:addForce(object.vel*forceMultiplier, 180, object.velSubtract*forceMultiplier)
end

--------------------------------------------------
ForceBorderXLeft=BasicBorder:extend()


function ForceBorderXLeft:new (x, y, width, height, destroyOnTouch)
    ForceBorderXLeft.super.new(self, x, y, width, height)
    self.destroyOnTouch = destroyOnTouch
    self.hasStandardCollision = false

end

function ForceBorderXLeft:customCollideY(object)

end

function ForceBorderXLeft:customCollideX(object)
    local forceMultiplier = (self.x+self.width / object.x) - 0.5
    --object:addForce(object.vel*forceMultiplier, 0, object.velSubtract*forceMultiplier)
end
