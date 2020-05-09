local world = require('world')
local state = require('state')

return function(x_pos, y_pos)
    local entity = {}
    entity.body = love.physics.newBody(world, 400, 605, 'static')
    entity.shape = love.physics.newRectangleShape(800, 10)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.end_contact = function(self)
        state.game_over = true
    end

    return entity
end
