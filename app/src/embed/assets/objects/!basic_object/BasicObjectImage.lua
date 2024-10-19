local className = "BasicObjectImage"
ImagesData[className] = { "placeholder.png" }
local path = "objects/!basic_object/images/"
Get_images(className, path)

BasicObjectImage = BasicObject:extend()

function BasicObjectImage:new (x, y, image)
    self.image = image or className
    self.imageIndex = 1
    BasicObjectImage.super.new(self, x, y, Images[self.image][self.imageIndex]:getWidth() * SettingsScale["x_images"], Images[self.image][self.imageIndex]:getHeight() * SettingsScale["y_images"])
    self.color = { 1, 1, 1, 1 }
    self.image_silhouette = self.image .. "_silhouette"
    self.widthHalf = self.width * 0.5
    self.heightHalf = self.height * 0.5

end

function BasicObjectImage:draw()
    love.graphics.setColor(self.color)
    love.graphics.draw(Images[self.image][self.imageIndex], self.x + self.width * 0.5, self.y + self.height * 0.5, math.rad(self.angle), SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf / SettingsScale["x_images"], self.heightHalf / SettingsScale["y_images"])
end

function BasicObjectImage:update()
    BasicObjectImage.super.update(self)

end

function BasicObjectImage:drawSilhouette(color)
    love.graphics.setBlendMode("add")
    love.graphics.setColor(color)
    love.graphics.draw(Images[self.image_silhouette][self.imageIndex], self.x + self.width * 0.5, self.y + self.height * 0.5, math.rad(self.angle), SettingsScale["x_images"], SettingsScale["y_images"], self.widthHalf / SettingsScale["x_images"], self.heightHalf / SettingsScale["y_images"])
    love.graphics.setBlendMode(SettingsData.blendMode, SettingsData.blendModeAlpha)
end