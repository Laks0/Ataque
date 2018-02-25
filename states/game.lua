require "objects/players"

function game_load()
    players:create(1)
    players:create(2)

    border = width/2

    turn = 1
end

function game_update(dt)
    if border <= 0 or border >= width and pres.L then
        table.remove(players,2)
        table.remove(players,1)
        game_load()
    end

    players:update(dt)

    if pres.L and mouse_en(width/2-buttonW/2,height-64,buttonW,64) then
        players[turn].sel = false
        if turn >= #players then turn = 1 else
            turn = turn + 1
        end
    end
end

function game_draw()
    players:draw()

    --Field
    render:line(1,border,0,border,height,5)
    render:rectangle(1,"fill",0,0,border,height,2,players[1].r,players[1].g,players[1].b,100)
    render:rectangle(1,"fill",border,0,width-border,height,2,players[2].r,players[2].g,players[2].b,100)

    --HUD
    buttonW = f:getWidth("  FIN TURNO   ")
    render:rectangle(2,"fill",width/2-buttonW/2,height-64,buttonW,64,3,0,0,0)
    render:text(2,"   FIN TURNO   ",width/2-buttonW/2,height-32,4)

    if border <= 0 then
        render:rectangle(2,"fill",width/2-f:getWidth("PLAYER 2 WINS")/2,height/2-line/2,f:getWidth("PLAYER 2 WINS"),line,4,0,0,0)
        render:text(2,"PLAYER 2 WINS",width/2-f:getWidth("PLAYER 2 WINS")/2,height/2-line/2,5,255,255,255)
    elseif border >= width then
        render:rectangle(2,"fill",width/2-f:getWidth("PLAYER 1 WINS")/2,height/2-line/2,f:getWidth("PLAYER 1 WINS"),line,4,0,0,0)
        render:text(2,"PLAYER 1 WINS",width/2-f:getWidth("PLAYER 1 WINS")/2,height/2-line/2,5,255,255,255)
    end
end

function love.mousepressed(x, y, b)
    if b == 1 then
        pres.L = true
    end
end
