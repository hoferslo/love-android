local className = "BasicObjectImage"
ImagesData[className] = {"placeholder.png"}
local path = "objects/!basic_object/images/"
Get_images(className, path)


BasicObjectImage=BasicObject:extend()

function BasicObjectImage:new (x, y, image)
    self.image = image or className
    self.image_index = 1
    BasicObjectImage.super.new(self, x, y, Images[self.image][self.image_index]:getWidth()*SettingsScale["x_images"], Images[self.image][self.image_index]:getHeight()*SettingsScale["y_images"])
    self.color={1,1,1,1}
    self.image_silhouette=self.image.."_silhouette"
    self.xhitHalf = self.xhit * 0.5
    self.yhitHalf = self.yhit * 0.5
    self.collisionData = {"borders"}

end

function BasicObjectImage:draw()
    love.graphics.draw(Images[self.image][self.image_index], self.x+self.xhit*0.5, self.y+self.yhit*0.5, math.rad(self.angle), SettingsScale["x_images"], SettingsScale["y_images"], self.xhitHalf/SettingsScale["x_images"], self.yhitHalf/SettingsScale["y_images"])
end

function BasicObjectImage:fun()
    BasicObjectImage.super.fun(self)
    
end
