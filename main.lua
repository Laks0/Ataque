require "tools/camera"
require "tools/functions"
require "tools/TSerial"
render = require "tools/render"

require "states/game"
require "states/menu"

width = 1280
height = 720

wres = love.graphics.getWidth()/width
hres = love.graphics.getHeight()/height

pres = {}

function love.load()
    canvas = love.graphics.newCanvas(width, height)
    state = "menu"
    game_load()
    menu_load()

    love.graphics.setFont(love.graphics.newFont("assets/Beholder.ttf",35))
end

function love.update(dt)
    f = love.graphics.getFont()
    line = f:getHeight("A")
    mouse = {
        x = (love.mouse.getX() - camera.x * camera.scaleX) / wres,
        y = (love.mouse.getY() - camera.y * camera.scaleX) / hres
    }

    render:clear()
    if state == "game" then
        game_update(dt)
    elseif state == "menu" then
        menu_update(dt)
    end

    pres.L = false
end

function love.draw()
    if state == "game" then
        game_draw()
    elseif state == "menu" then
        menu_draw()
    end

    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    camera:set()

    render:render(1)

    camera:unset()

    render:render(2)
    love.graphics.setCanvas()
    love.graphics.setColor(255,255,255)
    wres = love.graphics.getWidth()/width
    hres = love.graphics.getHeight()/height
    love.graphics.draw(canvas,0,0,0,wres,hres)
end
