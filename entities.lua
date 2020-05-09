local boundary_bottom = require('entities/boundary-bottom')
local boundary_top = require('entities/boundary-top')
local boundary_vertical = require('entities/boundary-vertical')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local brick = require('entities/brick')
local pause_text = require('entities/pause-text')

return {
    boundary_bottom(400, 606),
    boundary_vertical(-6, 300),
    boundary_vertical(806, 300),
    boundary_top(400, -6),
    paddle(300, 500),
    ball(200, 200),
    brick(100, 100),
    brick(200, 100),
    brick(300, 100),
    pause_text(),

}
