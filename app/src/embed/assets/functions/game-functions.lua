function CheckCollision(rect1, rect2)
    return rect1.x < rect2.x + rect2.xhit and
           rect1.x + rect1.xhit > rect2.x and
           rect1.y < rect2.y + rect2.yhit and
           rect1.y + rect1.yhit > rect2.y
end


