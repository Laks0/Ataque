soldiers = {}

function soldiers:create(p,x,y,t)
    local s = {}
    s.t = t
    s.x = x
    s.y = y
    s.ox = x
    s.oy = y
    s.sp = 200
    s.sel = false
    s.rad = 0
    s.img = "assets/Soldier.png"
    if s.t == 2 then s.img = "assets/general.png" end
    table.insert(players[p].soldiers,s)
    players[p].mny = players[p].mny - 10 - 10*(s.t-1)
end

function soldiers:update(p,dt)
    for l, s in ipairs(players[p].soldiers) do
        if dist(s.x,s.y,s.ox,s.oy) > 5 then
            local angle = math.atan2((s.y - s.oy) , (s.x - s.ox))
            local dx = math.cos(angle)
            local dy = math.sin(angle)
            s.x = s.x - (dx*s.sp*dt)
            s.y = s.y - (dy*s.sp*dt)
        else
            s.x = s.ox
            s.y = s.oy
        end
        if p == turn then
            if pres.L then
                if s.sel then
                    if dist(mouse.x,mouse.y,s.x,s.y) < s.rad then
                        s.rad = s.rad - dist(mouse.x,mouse.y,s.x,s.y)
                        s.ox = mouse.x
                        s.oy = mouse.y
                    else
                        s.sel = false
                    end
                    players[p].sel = false
                end
                if mouse_en(s.x-16,s.y-16,32,32) then
                    if (not s.sel) and s.rad > 5 then
                        s.sel = true
                        players[p].sel = false
                    end
                end
                if mouse_en(width/2-buttonW/2,height-64,buttonW,64) then
                    s.rad = 128
                    if s.t == 2 then s.rad = 200 end
                    if (p == 1 and s.x>border) or (p == 2 and s.x<border) then
                        border = border + (100*s.t) * -players[p].side
                    end
                end
            end
            if s.rad < 16 then
                s.sel = false
            end
        else
            for j, e in ipairs(players[3-p].soldiers) do
                if dist(s.x,s.y,e.x,e.y) < 32 then
                    table.remove(players[p].soldiers,l)
                    players[3-p].mny = players[3-p].mny + 5*s.t
                end
            end
        end
    end
end

function soldiers:draw(p)
    for l, s in ipairs(players[p].soldiers) do
        --render:rectangle(1,mode,s.x-16,s.y-16,32,32,4,players[p].r,players[p].g,players[p].b)
        render:img(1,s.img,s.x-16,s.y-16,4,players[p].r,players[p].g,players[p].b)
        if s.sel then
            render:circle(1,"fill",s.x,s.y,s.rad,3,players[p].r-100,players[p].g-100,players[p].b-100)
        end
    end
end
