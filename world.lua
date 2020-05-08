-- world.lua

local begin_contact_callback = function()

end

local end_contact_callback = function()

end

local pre_solve_callback = function()

end

local post_solve_callback = function()

end

local world = love.physics.newWorld(0, 0)

world:setCallbacks(
  begin_contact_callback,
  end_contact_callback,
  pre_solve_callback,
  post_solve_callback
)

return world
