
TileGenerator=BasicObject:extend()

function TileGenerator:new (x, y, xhit, yhit)
    TileGenerator.super.new(self, x, y, xhit, yhit)
    self.minX = self.x
    self.minY = self.y
    self.maxX = 0
    self.maxY = 0
    self.numberOfTiles = 0
    self.wasteTile = BasicTile(0,0)

    for x = self.x, self.xhit-self.wasteTile.xhit, self.wasteTile.xhit do
        for y = self.y, self.yhit, self.wasteTile.yhit do
            local waste = BasicTile(x, y)
            table.insert(Collections["tiles"], waste)
            self:changeMinAndMax(waste)
        end
    end

    local moveVar = (self.maxX - PlayableArea["xhit"]) * 0.5

    self:resetMinAndMax()

    for i = 1, #Collections["tiles"], 1 do
        Collections["tiles"][i].x = Collections["tiles"][i].x - moveVar
        self:changeMinAndMax(Collections["tiles"][i])
    end
end

function TileGenerator:resetMinAndMax()
    self.minX = self.maxX
    self.minY = self.maxY
    self.maxX = 0
    self.maxY = 0
end


function TileGenerator:changeMinAndMax(tile)
    if self.maxX<tile.x+tile.xhit then
        self.maxX = tile.x+tile.xhit
    end
    if self.maxY<tile.y+tile.yhit then
        self.maxY = tile.y+tile.yhit
    end
    if self.minX>tile.x then
        self.minX = tile.x
    end
    if self.minY>tile.y then
        self.minY = tile.y
    end
end

function TileGenerator:fun()
    self:resetMinAndMax()
    for i = 1, #Collections["tiles"], 1 do
        self:changeMinAndMax(Collections["tiles"][i])
    end
    local maxX = 0
    local minX = Canvas:getWidth()
    if self.minY > PlayableArea["y"] then
        local numberOfTiles = 7
        for x = 0, numberOfTiles - 1, 1 do
            local waste = BasicTile(self.wasteTile.xhit * (Canvas:getWidth() / self.wasteTile.xhit-numberOfTiles)/2 + x*self.wasteTile.xhit, self.minY - self.wasteTile.yhit + 1 *SettingsScale["x_images"])
            if waste.x>maxX then
                maxX = waste.x
            end
            if waste.x<minX then
                minX = waste.x
            end
            table.insert(Collections["tiles"], waste)
        end
    end

    
    if maxX~=0 then
    Collections["borders"]["left"].xhit = Screen.xhit + minX
    Collections["borders"]["right"].x = maxX+self.wasteTile.xhit
    Collections["borders"]["right"].xhit = Screen.xhit-maxX-self.wasteTile.xhit
    end
    
end


function TileGenerator:draw()
    love.graphics.rectangle("line", self.x, self.y, self.xhit, self.yhit)

end

