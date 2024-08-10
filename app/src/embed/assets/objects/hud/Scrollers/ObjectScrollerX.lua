ObjectScrollerX = BasicHud:extend()

function ObjectScrollerX:new(x, y, width, height, items)
    ObjectScrollerX.super.new(self, x, y, width, height)
    self.items = items or {}
    self.touchStartX = nil
    self.touchOffsetX = 0
    self.touchOffsetEachFrame = 0
    self.currentX = 0
    self.previousX = 0
    for i, item in ipairs(self.items) do
        item.x = item.x + self.x
        item.y = item.y + self.y
    end
end

function ObjectScrollerX:update(dt)
    ObjectScrollerX.super.update(self)
    if self.touchStartX == nil then
        if self.touchOffsetEachFrame ~= 0 then
            self.touchOffsetEachFrame = self.touchOffsetEachFrame * 0.9
        end
    end

    for i, item in ipairs(self.items) do
        item:update()
        item.x = item.x - self.touchOffsetEachFrame
        if checkCollision(self, item) and self.touchOffsetX == 0 then
            item.active = true
        else
            item.active = false
        end
    end
    if self.touchStartX == nil then
        self:normalize()
    end
    
end

function ObjectScrollerX:Touch(x, y)
    ObjectScrollerX.super.Touch(self, x, y, x, y)
    
    if self.touchStartX == nil then
        self.touchStartX = x
        self.currentX = x
    end
    
    self.previousX = self.currentX
    self.currentX = x
    table.insert(DebugStuff, "start: " .. self.touchStartX)
    self.touchOffsetX = self.touchStartX - x

    self.touchOffsetEachFrame = self.previousX - self.currentX
    
    for i, item in ipairs(self.items) do
        if checkCollision(BasicObject(x, y, 1, 1), item) then
            if item.active == true then
                item:Touch(x, y)
            end
        end
    end
end


function ObjectScrollerX:normalize()
    local difference = 0
    if self.items[1].x < self.x and self.items[#self.items].x + self.items[#self.items].width < self.x + self.width * 0.9 then
        difference = -(self.items[#self.items].x + self.items[#self.items].width - (self.x + self.width * 0.9))
        self.touchOffsetEachFrame = 0
    elseif self.items[1].x > self.x + self.width * 0.1 and self.items[#self.items].x + self.items[#self.items].width > self.x + self.width then
        difference = self.x + self.width * 0.1 - self.items[1].x
        self.touchOffsetEachFrame = 0
    end
    
    self.touchOffsetEachFrame = self.touchOffsetEachFrame - difference * 0.1 
    
end

function ObjectScrollerX:OnLetGo()
    ObjectScrollerX.super.OnLetGo(self)
    self.touchStartX = nil
    self.dragStartX = nil
    self.previousX = 0
    self.currentX = 0
    for i, item in ipairs(self.items) do
        if checkCollision(BasicObject(self.lastTouchX, self.lastTouchY, 1, 1), item) then
            if item.active == true then
                item:OnLetGo()
            end
        end
    end
end

function ObjectScrollerX:draw()
    ObjectScrollerX.super.draw(self)
    
    -- Set the scissor to clip the drawing area
    love.graphics.setScissor(self.x, self.y, self.width, self.height)
    for i, item in ipairs(self.items) do
        item:draw()
    end
    -- Reset the scissor
    love.graphics.setScissor()
end