-- main.lua

local entities = require('entities')
local input = require('input')
local world = require('world')

-- Boolean to keep track of whether our game is paused or not
local paused = false

-- local key_map = {
--     escape = function()
--     love.event.quit()
--     end,
--     space = function()
--     paused = not paused
--     end
-- }

love.draw = function()
    for _, entity in ipairs(entities) do
        if entity.draw then entity:draw() end
    end
end

love.focus = function(focused)
    input.toggle_focus(focused)
end

love.keypressed = function(pressed_key)
    input.press(pressed_key)
end

love.keyreleased = function(released_key)
    input.release(released_key)
end

love.update = function(dt)
    if not input.pasued then
        local index = 1
        while index <= #entities do
            local entity = entities[index]
            if entity.update then entity:update(dt) end
            if entity.health == 0 then
                table.remove(entities, index)
                entity.fixture:destroy()
            else
                index = index + 1
            end
        end
        world:update(dt)
    end
end
