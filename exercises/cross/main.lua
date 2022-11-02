local Timer = require("lib.hump.timer")

function love.load()
	timer = Timer()
	rect1 = { x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2, w = 50, h = 200 }
	rect2 = { x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2, w = 200, h = 50 }

    print("construct rects animations...")
	timer:after(1, function()
        print("after function triggered")
		timer:tween(1, rect1, { w = 0 }, "in-out-cubic", function()
			timer:tween(1, rect2, { h = 0 }, "in-out-cubic", function()
				timer:after(1, function()
					timer:tween(1, rect1, { w = 50 }, "in-out-cubic")
					timer:tween(1, rect2, { h = 50 }, "in-out-cubic")
				end)
			end)
		end)
	end)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.update(dt)
    timer:update(dt)
end

function love.draw()
	love.graphics.rectangle("fill", rect1.x - rect1.w / 2, rect1.y - rect1.h / 2, rect1.w, rect1.h)
	love.graphics.rectangle("fill", rect2.x - rect2.w / 2, rect2.y - rect2.h / 2, rect2.w, rect2.h)
end
