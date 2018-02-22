require "tools/camera"
require "tools/functions"
require "tools/TSerial"
render = require "tools/render"

width = 1280
height = 720

wres = love.graphics.getWidth()/width
hres = love.graphics.getHeight()/height

mouse = {
    x = (love.mouse.getX() - camera.x * camera.scaleX) / wres,
    y = (love.mouse.getY() - camera.y * camera.scaleX) / hres
}

function love.load()
    canvas = love.graphics.newCanvas(width, height)
    state = "game"
end

function love.update(dt)
    render:clear()
end

function love.draw()
    draw()
end

function draw()
    love.graphics.setCanvas(canvas)
    camera:set()

    render:render(1)

    camera:unset()

    render:render(2)
    love.graphics.setCanvas()
    love.graphics.draw(canvas,0,0,0,wres,hres)
end