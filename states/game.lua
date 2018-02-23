require "objects/players"

function game_load()
    players:create(1)
    players:create(2)

    turn = 1
end

function game_update(dt)
    players:update(dt)
end

function game_draw()
    f = love.graphics.getFont()
    line = f:getHeight("A")

    players:draw()

    buttonW = f:getWidth("  FIN TURNO  ")
    render:rectangle(2,"fill",width/2-buttonW/2,height-64,buttonW,64,3,0,0,0)
    render:text(2,"   FIN TURNO   ",width/2-buttonW/2,height-64,4)
end

function love.mousepressed(x, y, b)
    if b == 1 then
        if mouse_en(0,0,1280,720) then
            if turn >= #players then turn = 1 else
                turn = turn + 1
            end
        end
    end
end
