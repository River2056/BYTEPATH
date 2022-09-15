require("utils.utils")

function love.load()
    local objectsList = {}
    recursiveEnumerate("objects", objectsList)

    for _, obj in ipairs(objectsList) do
        local file = obj:sub(1, -5)
        local class = file:sub(string.find(file, "/[^/]*$") + 1)
        print(class)

        print(_G)
        _G[class] = require(file)
    end

    -- circle = Circle(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 50)
    hyper = HyperCircle(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 50, 10, 70)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    hyper:draw()
end
