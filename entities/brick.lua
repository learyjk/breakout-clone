local world = require('world')

return function(x_pos, y_pos)
    local entity = {}
    entity.body = love.physics.newBody(world, x_pos, y_pos, 'static')
    entity.shape = love.physics.newRectangleShape(50, 20)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setUserData(entity)

    entity.health = 2

    entity.draw = function(self)
        if self.health == 2 then
            love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
        else
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
            love.graphics.setColor(1, 1, 1, 1)
        end
    end

    entity.end_contact = function(self)
        self.health = self.health - 1
    end

    return entity
end
