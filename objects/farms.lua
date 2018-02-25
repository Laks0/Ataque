farms = {}

function farms:create(p,x,y)
    local f = {}
    f.x = x
    f.y = y
    table.insert(players[p].farms,f)
    players[p].mny = players[p].mny - 5
end

function farms:update(p,dt)
    for l, f in ipairs(players[p].farms) do
        if p == turn then
            if mouse_en(width/2-buttonW/2,height-64,buttonW,64) and pres.L then
                players[p].mny = players[p].mny + 2
            end
        else
            for j, e in ipairs(players[3-p].soldiers) do
                if dist(f.x,f.y,e.x,e.y) < 80 then
                    table.remove(players[p].farms,l)
                    players[p].mny = players[p].mny + 2
                end
            end
        end
    end
end

function farms:draw(p)
    for l, f in ipairs(players[p].farms) do
        local pl = players[p]
        render:img(1,"assets/farm.png",f.x-16,f.y-16,4,pl.r,pl.g,pl.b)
    end
end
