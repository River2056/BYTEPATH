local Input = require("lib.boipushy.Input")
local Timer = require("lib.hump.timer")

function love.load()
	input = Input()
	timer = Timer()

	health_bar = { x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2, w = 300, h = 50 }
	health_bar_shawdow = { x = love.graphics.getWidth() / 2, y = love.graphics.getHeight() / 2, w = 300, h = 50 }

	input:bind("d", "test")
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.update(dt)
	timer:update(dt)

	local counter = 0
	if input:down("test") then
		print("minus health...")
		counter = counter + 10
	end

	if health_bar.w > 0 and counter > 0 then
		timer:tween(
			0.5,
			health_bar,
			{ w = health_bar.w > counter and health_bar.w - counter or 0 },
			"in-out-cubic",
			function()
				timer:tween(0.7, health_bar_shawdow, { w = health_bar_shawdow.w - 10 }, "in-out-cubic")
				--[[ timer:after(0.4, function()
            end) ]]
			end
		)
	end
	counter = 0
end

function love.draw()
	love.graphics.setColor(0.87, 0.25, 0.25)
	love.graphics.rectangle(
		"fill",
		health_bar_shawdow.x - (health_bar_shawdow.w / 2),
		health_bar_shawdow.y - (health_bar_shawdow.h / 2),
		health_bar_shawdow.w,
		health_bar_shawdow.h
	)
	love.graphics.setColor(1.0, 0.38, 0.37)
	love.graphics.rectangle(
		"fill",
		health_bar.x - (health_bar.w / 2),
		health_bar.y - (health_bar.h / 2),
		health_bar.w,
		health_bar.h
	)
end
