-- main.lua

local entities = require('entities')
local input = require('input')
local state = require('state')
local world = require('world')

-- Boolean to keep track of whether our game is paused or not
local paused = false

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
    if state.game_over or state.paused or state.stage_cleared then
        return
    end

    local have_bricks = false

    local index = 1
    while index <= #entities do
        local entity = entities[index]
        if entity.type == 'brick' then have_bricks = true end
        if entity.update then entity:update(dt) end
        if entity.health and entity.health < 1 then
            table.remove(entities, index)
            entity.fixture:destroy()
        else
            index = index + 1
        end
    end
    state.stage_cleared = not have_bricks
    world:update(dt)
end
