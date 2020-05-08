local world = require('world')

return function(x_pos, y_pos)
    local entity = {}
    entity.body = love.physics.newBody(world, 400, -5, 'static')
    entity.shape = love.physics.newRectangleShape(800, 10)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    return entity
end
