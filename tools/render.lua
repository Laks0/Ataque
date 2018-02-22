local render = {{{},{},{},{},{},{}},{{},{},{},{},{},{}}}

function render:clear()
    for i = 1,#self do
        for l = 1, #self[i] do
            self[i][l] = {}
        end
    end
end

function render:rectangle(cape,m,x,y,w,he,la,r,g,b,h)
    local c = cape or 1
    if c > 2 then
        c = 2
    end

    local l = la or 1
    if l > 5 then
        l = 1
    end

    local ren = {}
    ren.type = "rect"
    ren.m = m or "fill"
    ren.x = x or 1
    ren.y = y or 1
    ren.w = w or 10
    ren.he = he or 10
    ren.r = r or 255
    ren.g = g or 255
    ren.b = b or 255
    ren.h = h or 255
    table.insert(self[c][l],ren)
end

function render:circle(cape,m,x,y,ra,la,r,g,b,h)
    local c = cape or 1
    if c > 2 then
        c = 2
    end

    local l = la or 1
    if l > 5 then
        l = 1
    end

    local ren = {}
    ren.type = "cir"
    ren.m = m or "fill"
    ren.x = x or 5
    ren.y = y or 5
    ren.ra = ra or 5
    ren.r = r or 255
    ren.g = g or 255
    ren.b = b or 255
    ren.h = h or 255
    table.insert(self[c][l],ren)
end

function render:text(cape,txt,x,y,la,r,g,b,h)
    local c = cape or 1
    if c > 2 then
        c = 2
    end

    local l = la or 1
    if l > 5 then
        l = 1
    end

    local ren = {}
    ren.type = "txt"
    ren.txt = txt or ""
    ren.x = x or 1
    ren.y = y or 1
    ren.r = r or 255
    ren.g = g or 255
    ren.b = b or 255
    ren.h = h or 255
    table.insert(self[c][l],ren)
end

function render:line(cape,x,y,x2,y2,la,r,g,b,h)
    local c = cape or 1
    if c > 2 then
        c = 2
    end

    local l = la or 1
    if l > 5 then
        l = 1
    end

    local ren = {}
    ren.type = "lin"
    ren.x = x or 1
    ren.y = y or 1
    ren.x2 = x2 or 1
    ren.y2 = y2 or 1
    ren.r = r or 255
    ren.g = g or 255
    ren.b = b or 255
    ren.h = h or 255
    table.insert(self[c][l],ren)
end

function render:img(cape,img,x,y,la,r,g,b,h)
    local c = cape or 1
    if c > 2 then
        c = 2
    end

    local l = la or 1
    if l > 5 then
        l = 1
    end

    local ren = {}
    ren.type = "img"
    ren.img = love.graphics.newImage(img)
    ren.x = x or 1
    ren.y = y or 1
    ren.r = r or 255
    ren.g = g or 255
    ren.b = b or 255
    ren.h = h or 255
    table.insert(self[c][l],ren)
end

function render:render(n)
    for l = 1, #self[n] do
        for _, r in pairs(self[n][l]) do
            love.graphics.setColor(r.r,r.g,r.b,r.h)
            if r.type == "rect" then
                love.graphics.rectangle(r.m,r.x,r.y,r.w,r.he)
            elseif r.type == "cir" then
                love.graphics.circle(r.m,r.x,r.y,r.ra)
            elseif r.type == "txt" then
                love.graphics.print(r.txt,r.x,r.y)
            elseif r.type == "img" then
                love.graphics.draw(r.img,r.x,r.y)
            elseif r.type == "lin" then
                love.graphics.line(r.x,r.y,r.x2,r.y2)
            end
        end
    end
end

return render
