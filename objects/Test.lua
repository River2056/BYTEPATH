local Object = require("lib.classic.classic")
local Test = Object:extend()

function Test:new(x, y)
    self.x = x
    self.y = y
end

function Test:update(dt) end

function Test:draw() end

return Test
