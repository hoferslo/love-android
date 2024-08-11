ObjectScrollerY = BasicHud:extend()

function ObjectScrollerY:new(x, y, width, height, items)
    ObjectScrollerY.super.new(self, x, y, width, height)
    self.items = items or {}
    self.touchStartY = nil
    self.touchOffsetY = 0
    self.touchOffsetEachFrame = 0
    self.currentY = 0
    self.previousY = 0
    self.previousYFramePos = self.y
    self.previousXFramePos = self.x
    for i, item in ipairs(self.items) do
        item.x = item.x + self.x
        item.y = item.y + self.y
    end
    self.canvas = love.graphics.newCanvas(self.width, self.height, SettingsCanvas)
end

function ObjectScrollerY:update(dt)
    if self.isBeingPressed == false then
        self.touchStartY = nil
    end
    ObjectScrollerY.super.update(self)
    if self.touchStartY == nil then
        if self.touchOffsetEachFrame ~= 0 then
            self.touchOffsetEachFrame = self.touchOffsetEachFrame * 0.9
        end
    end
    
    for i, item in ipairs(self.items) do
        
        item.y = item.y - self.touchOffsetEachFrame + self.y - self.previousYFramePos
        item.x = item.x + self.x - self.previousXFramePos 
        
        item.active = false
        item:update(dt)
    end
    if self.touchStartY == nil then
        self:normalize()
    end
    self.previousYFramePos = self.y
    self.previousXFramePos = self.x
end

function ObjectScrollerY:Touch(x, y)
    ObjectScrollerY.super.Touch(self, x, y, x, y)
    
    if self.touchStartY == nil then
        self.touchStartY = y
        self.currentY = y
    end
    self.previousY = self.currentY
    self.currentY = y

    self.touchOffsetY = self.touchStartY - y

    self.touchOffsetEachFrame = self.previousY - self.currentY
    
    for i, item in ipairs(self.items) do
        if checkCollision(BasicObject(x, y, 1, 1), item) then
            item.active = true
            item:Touch(x, y)
        end
    end
end


function ObjectScrollerY:normalize()
    local difference = 0

    if self.items[1].y < self.y and self.items[#self.items].y + self.items[#self.items].height < self.y + self.height * 0.9 then
        difference = -(self.items[#self.items].y + self.items[#self.items].height - (self.y + self.height * 0.9))
        self.touchOffsetEachFrame = 0
    elseif self.items[1].y > self.y + self.height * 0.1 and self.items[#self.items].y + self.items[#self.items].height > self.y + self.height then
        difference = self.y + self.height * 0.1 - self.items[1].y
        self.touchOffsetEachFrame = 0
    end
    
    self.touchOffsetEachFrame = self.touchOffsetEachFrame - difference * 0.1 
    
end

function ObjectScrollerY:OnLetGo()
    ObjectScrollerY.super.OnLetGo(self)
    self.touchOffsetY = 0
    self.touchStartY = nil
    self.previousY = 0
    self.currentY = 0

    for i, item in ipairs(self.items) do
        if checkCollision(BasicObject(self.lastTouchX, self.lastTouchY, 1, 1), item) then
            item.active = true
                item:OnLetGo()
        end
    end
end

function ObjectScrollerY:draw(canvas, offsetX, offsetY) --dont question this
    canvas = canvas or Canvas
    offsetX = offsetX or 0
    offsetY = offsetY or 0
    ObjectScrollerY.super.draw(self)
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear()
    
    for i, item in ipairs(self.items) do --for touches collision
        item.x = item.x - self.x - offsetX
        item.y = item.y - self.y - offsetY
    end

    for i, item in ipairs(self.items) do
        love.graphics.setCanvas(self.canvas)
        item:draw(self.canvas, self.x, self.y)
    end
    for i, item in ipairs(self.items) do
        item.x = item.x + self.x + offsetX
        item.y = item.y + self.y + offsetY
    end

    love.graphics.setCanvas(canvas)
    love.graphics.draw(self.canvas, self.x, self.y)

end