local Circle = require("objects.Circle")
local HyperCircle = Circle:extend()

function HyperCircle:new(x, y, radius, lineWidth, outerRadius)
    HyperCircle.super:new(x, y, radius)
    self.lineWidth = lineWidth
    self.outerRadius = radius + 70
end

function HyperCircle:update(dt) end

function HyperCircle:draw()
    HyperCircle.super:draw()
    love.graphics.setLineWidth(self.lineWidth)
    love.graphics.ellipse("line", self.x, self.y, self.outerRadius, self.outerRadius)
end

return HyperCircle
