
TestScreenSquare=BasicObjectImage:extend()

function TestScreenSquare:new (x, y, offset)
    TestScreenSquare.super.new(self, x, y)
    self.dir="r"
    offset = offset or 0
    self.vel = math.random(1,100)*0.01
    self.offset = self.xhit * offset
    self.x = self.x + self.offset
    self.y = self.y + self.offset
end


function TestScreenSquare:fun()
    self.angle = self.angle + self.vel
    if self.dir=="r" then
        self.x=self.x+self.vel
        if self.x+self.xhit>Screen.xhit-self.offset then
            self.dir = "d"
            self.x = Screen.xhit-self.xhit-self.offset
        end
    elseif self.dir=="d" then
        self.y=self.y+self.vel
        if self.y+self.yhit>Screen.yhit-self.offset then
            self.dir = "l"
            self.y = Screen.yhit-self.yhit-self.offset
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
