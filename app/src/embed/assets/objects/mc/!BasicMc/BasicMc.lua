
BasicMc=BasicObjectImage:extend()

function BasicMc:new (x, y)
    BasicMc.super.new(self, x, y)
    self.vel = 0.1--0.1
    self.velSubtract = 0.01
    self.posOfPress = {x = 0, y = 0}
    self.movementType = "joystick"  --joystick
end


function BasicMc:fun()
    BasicMc.super.fun(self)

end

