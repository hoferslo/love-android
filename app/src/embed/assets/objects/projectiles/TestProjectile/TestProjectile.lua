
TestProjectile=BasicProjectile:extend()
-- doont use yet, not finished
function TestProjectile:new (x, y)
    TestProjectile.super.new(self, x, y, 10, 10)

end


function TestProjectile:update()
    TestProjectile.super.update(self)

end

