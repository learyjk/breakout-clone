-- world.lua

local begin_contact_counter = 0
local end_contact_counter = 0
local pre_solve_counter = 0
local post_solve_counter = 0

local begin_contact_callback = function()
  begin_contact_counter = begin_contact_counter + 1
  print('beginContact called ' .. begin_contact_counter .. ' times')
end

local end_contact_callback = function()
  end_contact_counter = end_contact_counter + 1
  print('endContact called ' .. end_contact_counter .. ' times')
end

local pre_solve_callback = function()
  pre_solve_counter = pre_solve_counter + 1
  print('preSolve called ' .. pre_solve_counter .. ' times')
end

local post_solve_callback = function()
  post_solve_counter = post_solve_counter + 1
  print('postSolve called ' .. post_solve_counter .. ' times')
end

local world = love.physics.newWorld(0, 9.81 * 128)

world:setCallbacks(
  begin_contact_callback,
  end_contact_callback,
  pre_solve_callback,
  post_solve_callback
)

return world
