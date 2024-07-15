
ForceBorderYDown=BasicBorder:extend()


function ForceBorderYDown:new (x, y, xhit, yhit, destroyOnTouch)
    ForceBorderYDown.super.new(self, x, y, xhit, yhit)
    self.destroyOnTouch = destroyOnTouch
    self.hasNormalCollision = false

end

function ForceBorderYDown:abnormalCollideOnY(object)

    local forceMultiplier = (self.y+self.yhit / object.y) - 0.5
    object:addForce(object.vel*forceMultiplier, 90, object.velSubtract*forceMultiplier)


end
function ForceBorderYDown:abnormalCollideOnX(object)

end
-----------------------------------------------------

ForceBorderYUp=BasicBorder:extend()


function ForceBorderYUp:new (x, y, xhit, yhit, destroyOnTouch)
    ForceBorderYUp.super.new(self, x, y, xhit, yhit)
    self.destroyOnTouch = destroyOnTouch
    self.hasNormalCollision = false

end

function ForceBorderYUp:abnormalCollideOnY(object)

    local forceMultiplier = (self.y+self.yhit / object.y) - 0.5
    object:addForce(object.vel*forceMultiplier, 270, object.velSubtract*forceMultiplier)


end
function ForceBorderYUp:abnormalCollideOnX(object)

end
--------------------------------------------

ForceBorderXRight=BasicBorder:extend()


function ForceBorderXRight:new (x, y, xhit, yhit, destroyOnTouch)
    ForceBorderXRight.super.new(self, x, y, xhit, yhit)
    self.destroyOnTouch = destroyOnTouch
    self.hasNormalCollision = false

end

function ForceBorderXRight:abnormalCollideOnY(object)

end

function ForceBorderXRight:abnormalCollideOnX(object)
    local forceMultiplier = ((object.x + object.xhit - self.x) / (self.xhit*0.5)) + 0.5

    object:addForce(object.vel*forceMultiplier, 180, object.velSubtract*forceMultiplier)
end

--------------------------------------------------
ForceBorderXLeft=BasicBorder:extend()


function ForceBorderXLeft:new (x, y, xhit, yhit, destroyOnTouch)
    ForceBorderXLeft.super.new(self, x, y, xhit, yhit)
    self.destroyOnTouch = destroyOnTouch
    self.hasNormalCollision = false

end

function ForceBorderXLeft:abnormalCollideOnY(object)

end

function ForceBorderXLeft:abnormalCollideOnX(object)
    local forceMultiplier = (self.x+self.xhit / object.x) - 0.5
    object:addForce(object.vel*forceMultiplier, 0, object.velSubtract*forceMultiplier)
end
