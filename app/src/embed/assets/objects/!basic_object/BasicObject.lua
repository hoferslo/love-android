BasicObject=Object:extend()

function BasicObject:new (x, y, xhit, yhit)
   self.x = x
   self.y = y
   self.xhit = xhit
   self.yhit = yhit
   self.angle=0
   self.vel = 1
   --self.velMax = self.vel * 2
   self.velSubtract = 0.01
   self.forces = {
       main = {},
       knockback = {}
   }
   self.collisionData = {}
   self.hasNormalCollision = true --if this is false, the object must override abnormalCollideOnY and abnormalCollideOnX

end


function BasicObject:fun()
   self:calcForcesX()
   self:calcCollisionX()
   self:calcForcesY()
   self:calcCollisionY()
   self:subtractForces()
end

function BasicObject:draw()

end


function BasicObject:addForce(vel, angle, velSubtract, id) --id = self = 1, knockback = 2
   if id==nil then
       id = "main"
   end
   if vel==nil then
       vel = self.vel
   end
   if velSubtract == nil then
       velSubtract = self.velSubtract
   end
   if angle == nil then
       angle = self.angle
   end

   table.insert(self.forces[id], {vel = vel, angle = angle, velSubtract = velSubtract})
   
end

function BasicObject:hasCollided(obstacle)
   if self.x < obstacle.x + obstacle.xhit and
      self.x + self.xhit > obstacle.x and
      self.y < obstacle.y + obstacle.yhit and
      self.y + self.yhit > obstacle.y then
      return true
   end
   return false
end


function BasicObject:CollideOnX(obstacle)
   if obstacle.hasNormalCollision then
      if self.x+self.xhit*0.5 < obstacle.x+obstacle.xhit*0.5 then
         self.x = obstacle.x - self.xhit
      else
         self.x = obstacle.x + obstacle.xhit
      end
   else
      obstacle:abnormalCollideOnX(self)
   end
end

function BasicObject:calcCollisionX()
   for key, value in pairs(self.collisionData) do
       for _, obstacle in pairs(Collections[value]) do
           if self:hasCollided(obstacle) then
               self:CollideOnX(obstacle)
           end
       end
   end
   return nil
end

function BasicObject:calcCollisionY()
   for key, value in pairs(self.collisionData) do
       for _, obstacle in pairs(Collections[value]) do
           if self:hasCollided(obstacle) then
               self:CollideOnY(obstacle)
           end
       end
   end
   return nil
end

function BasicObject:CollideOnY(obstacle)
   if obstacle.hasNormalCollision then
      if self.y+self.yhit*0.5 < obstacle.y+obstacle.yhit*0.5 then
         self.y = obstacle.y - self.yhit
      else
         self.y = obstacle.y + obstacle.yhit
      end
   else
      obstacle:abnormalCollideOnY(self)
   end
end

function BasicObject:abnormalCollideOnY(object)
   if self.y+self.yhit*0.5 < object.y+object.yhit*0.5 then
      self.y = object.y - self.yhit
   else
      self.y = object.y + object.yhit
   end
end
function BasicObject:abnormalCollideOnX(object)
   if self.x+self.xhit*0.5 < object.x+object.xhit*0.5 then
      self.x = object.x - self.xhit
   else
      self.x = object.x + object.xhit
   end
end

function BasicObject:calcForcesX()
   for key, value in pairs(self.forces) do
       for i = #self.forces[key], 1, -1 do
           self.x = self.x + self.forces[key][i]["vel"] * math.cos(math.rad(self.forces[key][i]["angle"]))
       end
   end
end

function BasicObject:calcForcesY()
   for key, value in pairs(self.forces) do
       for i = #self.forces[key], 1, -1 do
           self.y = self.y + self.forces[key][i]["vel"] * math.sin(math.rad(self.forces[key][i]["angle"]))
       end
   end
end

function BasicObject:subtractForces()
   for key, value in pairs(self.forces) do
      for i = #self.forces[key], 1, -1 do
         self.forces[key][i]["vel"] = self.forces[key][i]["vel"] - self.forces[key][i]["velSubtract"]
         if self.forces[key][i]["vel"] < self.forces[key][i]["velSubtract"] then
             table.remove(self.forces[key], i)
         end
      end
  end
end


function BasicObject:AddMovement(vel, angle)
   if angle==nil then
       angle = math.random(0, 360)
   end
   self:addForce(vel, angle)
end

function BasicObject:CalcAngle(i)
   return math.deg(math.atan2(i.y - i.yhit*0.5 - self.y - self.yhit*0.5 , i.x - i.xhit*0.5 - self.x - self.xhit*0.5 ))
end

