
TestProjectile=BasicProjectile:extend()
-- doont use yet, not finished
function TestProjectile:new (x, y, width, height, angle, speed, friction)
    TestProjectile.super.new(self, x, y, width, height, angle, speed, friction)

end


function TestProjectile:update()
    TestProjectile.super.update(self)

end

