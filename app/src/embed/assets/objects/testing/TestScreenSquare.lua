
TestScreenSquare=BasicObjectImage:extend()

function TestScreenSquare:new (x, y, offset)
    TestScreenSquare.super.new(self, x, y)
    self.dir="r"
    offset = offset or 0
    self.vel = math.random(1,100)*0.01
    self.offset = self.width * offset
    self.x = self.x + self.offset
    self.y = self.y + self.offset
end


function TestScreenSquare:update()
    self.angle = self.angle + self.vel
    if self.dir=="r" then
        self.x=self.x+self.vel
        if self.x+self.width>Screen.width-self.offset then
            self.dir = "d"
            self.x = Screen.width-self.width-self.offset
        end
    elseif self.dir=="d" then
        self.y=self.y+self.vel
        if self.y+self.height>Screen.height-self.offset then
            self.dir = "l"
            self.y = Screen.height-self.height-self.offset
        end
    elseif self.dir=="l" then
        self.x=self.x-self.vel
        if self.x<0+self.offset then
            self.dir = "u"
            self.x = self.offset
        end
    elseif self.dir=="u" then
        self.y=self.y-self.vel
        if self.y<0+self.offset then
            self.dir = "r"
            self.y = self.offset
        end
    end
end
