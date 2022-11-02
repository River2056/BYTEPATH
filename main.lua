require("utils.utils")
local Input = require("lib.boipushy.Input")
local Timer = require("lib.hump.timer")

function love.load()
    local objectsList = {}
    recursiveEnumerate("objects", objectsList)

    for _, obj in ipairs(objectsList) do
        local file = obj:sub(1, -5)
        local class = file:sub(string.find(file, "/[^/]*$") + 1)

        _G[class] = require(file)
    end

    -- circle = Circle(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 50)
    hyper = HyperCircle(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 50, 10, 70)

    input = Input()
    input:bind("mouse1", "test")

    -- circle = { radius = 50 }
    timer = Timer()
    --[[ timer:every(2, function()
        timer:tween(6, circle, { radius = 120 }, "in-out-cubic", function()
            timer:tween(6, circle, { radius = 50 }, "in-out-cubic")
        end)
    end) ]]
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.update(dt)
    if input:pressed("test") then
        print("pressed")
    end
    if input:released("test") then
        print("released")
    end
    if input:down("test", 0.5) then
        print("down")
    end

    timer:update(dt)
end

function love.draw()
    -- hyper:draw()
    --[[ love.graphics.ellipse(
        "fill",
        love.graphics.getWidth() / 2,
        love.graphics.getHeight() / 2,
        circle.radius,
        circle.radius
    ) ]]
    --[[ love.graphics.rectangle("fill", rect1.x - rect1.w / 2, rect1.y - rect1.h / 2, rect1.w, rect1.h)
    love.graphics.rectangle("fill", rect2.x - rect2.w / 2, rect2.y - rect2.h / 2, rect2.w, rect2.h) ]]
end
