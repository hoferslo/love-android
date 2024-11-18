ObjectScrollerX = BasicHud:extend()

function ObjectScrollerX:new(x, y, width, height, items)
    ObjectScrollerX.super.new(self, x, y, width, height)
    self.items = items or {}
    self.touchStartX = nil
    self.touchOffsetX = 0
    self.touchOffsetEachFrame = 0
    self.currentX = 0
    self.previousX = 0
    self.previousYFramePos = self.y
    self.previousXFramePos = self.x
    for i, item in ipairs(self.items) do
        item.x = item.x + self.x
        item.y = item.y + self.y
    end
    self.canvas = love.graphics.newCanvas(self.width, self.height, SettingsCanvas)
end

function ObjectScrollerX:update(dt)
    if self.isBeingPressed == false then
        self.touchStartX = nil
    end
    ObjectScrollerX.super.update(self)
    if self.touchStartX == nil then
        if self.touchOffsetEachFrame ~= 0 then
            self.touchOffsetEachFrame = self.touchOffsetEachFrame * 0.9
        end
    end
    
    for i, item in ipairs(self.items) do
        
        item.x = item.x - self.touchOffsetEachFrame + self.x - self.previousXFramePos
        item.y = item.y + self.y - self.previousYFramePos 
        item.active = false
        item:update(dt)
    end
    if self.touchStartX == nil then
        self:normalize()
    end
    self.previousYFramePos = self.y
    self.previousXFramePos = self.x
end

function ObjectScrollerX:Touch(x, y)
    ObjectScrollerX.super.Touch(self, x, y, x, y)
    
    if self.touchStartX == nil then
        self.touchStartX = x
        self.currentX = x
    end
    self.previousX = self.currentX
    self.currentX = x

    self.touchOffsetX = self.touchStartX - x

    self.touchOffsetEachFrame = self.previousX - self.currentX
    
    for i, item in ipairs(self.items) do
        if checkCollision(BasicObject(x, y, 1, 1), item) then
            item.active = true
            item:Touch(x, y)
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
    self.previousX = 0
    self.currentX = 0

    for i, item in ipairs(self.items) do
        if self.touchOffsetX == 0 and checkCollision(BasicObject(self.lastTouchX, self.lastTouchY, 1, 1), item) then
            item.active = true
                item:OnLetGo()
        end
    end
    self.touchOffsetX = 0
end

function ObjectScrollerX:draw(canvas, offsetX, offsetY) --dont question this
    canvas = canvas or Canvas
    offsetX = offsetX or 0
    offsetY = offsetY or 0
    ObjectScrollerX.super.draw(self)
    love.graphics.setCanvas(self.canvas)
    love.graphics.clear(love.graphics.getBackgroundColor())
    
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