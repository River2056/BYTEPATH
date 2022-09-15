local Object = require("lib.classic.classic")
local Circle = Object:extend()

function Circle:new(x, y, radius)
    self.x = x
    self.y = y
    self.radius = radius
end

function Circle:update(dt) end

function Circle:draw()
    love.graphics.ellipse("fill", self.x, self.y, self.radius, self.radius)
end

return Circle
