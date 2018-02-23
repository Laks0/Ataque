soldiers = {}

function soldiers:create(p,x,y)
    local s = {}
    s.x = x
    s.y = y
    s.sel = false
    s.rad = 0
    table.insert(players[p].soldiers,s)
    players[p].mny = players[p].mny - 10
end

function soldiers:update(p,dt)
    for l, s in ipairs(players[p].soldiers) do
        if p == turn then
            if pres.L then
                if s.sel then
                    if dist(mouse.x,mouse.y,s.x,s.y) < s.rad then
                        s.rad = s.rad - dist(mouse.x,mouse.y,s.x,s.y)
                        s.x = mouse.x
                        s.y = mouse.y
                    else
                        s.sel = false
                    end
                    players[p].sel = false
                end
                if mouse_en(s.x-16,s.y-16,32,32) then
                    if (not s.sel) and s.rad > 5 then
                        s.sel = true
                    end
                end
                if mouse_en(width/2-buttonW/2,height-64,buttonW,64) then
                    s.rad = 128
                    if (p == 1 and s.x>border) or (p == 2 and s.x<border) then
                        border = border + 50 * -players[p].side
                    end
                end
            end
        else
            for j, e in ipairs(players[3-p].soldiers) do
                if dist(s.x,s.y,e.x,e.y) < 32 then
                    table.remove(players[p].soldiers,l)
                    players[p].mny = players[p].mny + 2
                end
            end
        end
    end
end

function soldiers:draw(p)
    for l, s in ipairs(players[p].soldiers) do
        render:rectangle(1,"fill",s.x-16,s.y-16,32,32,4,players[p].r,players[p].g,players[p].b)
        if s.sel then
            render:circle(1,"fill",s.x,s.y,s.rad,3,players[p].r-100,players[p].g-100,players[p].b-100)
        end
    end
end
