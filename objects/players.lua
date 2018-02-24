require "objects/farms"
require "objects/soldiers"

players = {}

function players:create(turn)
    local p = {}
    p.mny = 25
    p.turn = turn or #self+1
    p.r = love.math.random(0,255)
    p.g = love.math.random(0,255)
    p.b = love.math.random(0,255)
    if p.turn == 1 then
        p.side = -1
    else
        p.side = 1
    end
    p.sel = false
    p.sx = 0
    p.sy = 0
    p.farms = {}
    p.soldiers = {}
    table.insert(self,p)
end

function players:update(dt)
    for i,p in ipairs(self) do
        if p.turn == turn then
            if pres.L then
                if p.sel then
                    if mouse_en(0,height-line,f:getWidth("   CREAR GRANJA   "),line) and p.mny >= 5 then
                        farms:create(p.turn,p.sx,p.sy)
                        p.sel = false
                    elseif mouse_en(width-f:getWidth("   CREAR SOLDADO   "),height-line,f:getWidth("   CREAR SOLDADO   "),line)
                    and p.mny >= 10 then
                        soldiers:create(p.turn,p.sx,p.sy,1)
                        p.sel = false
                    elseif mouse_en(960-f:getWidth("   CREAR GENERAL   ")/2,height-line,f:getWidth("   CREAR GENERAL   "),line)
                    and p.mny >= 20 then
                        soldiers:create(p.turn,p.sx,p.sy,2)
                        p.sel = false
                    else
                        p.sel = false
                    end
                elseif (p.turn == 1 and mouse.x<border) or (p.turn == 2 and mouse.x>border) then
                    p.sx = mouse.x
                    p.sy = mouse.y
                    p.sel = true
                end
                --end turn
                if mouse_en(width/2-buttonW/2,height-64,buttonW,64) then

                end
            end
        end
        farms:update(p.turn,dt)
        soldiers:update(p.turn,dt)
    end
end

function players:draw()
    for i,p in ipairs(self) do
        if p.turn == turn then
            render:text(2,"Player "..p.turn.."\n$"..p.mny,0,0,3,p.r,p.g,p.b)
            if p.sel then
                render:circle(1,"fill",p.sx,p.sy,5,4,255,255,0)
                render:rectangle(2,"fill",0,height-line,f:getWidth("   CREAR GRANJA   "),line,3,0,0,0)
                render:text(2,"   CREAR GRANJA   ",0,height-line,4)
                render:rectangle(2,"fill",width-f:getWidth("   CREAR SOLDADO   "),height-line,f:getWidth("   CREAR SOLDADO   "),line,3,0,0,0)
                render:text(2,"   CREAR SOLDADO   ",width- f:getWidth("   CREAR SOLDADO   "),height-line,4)
                render:rectangle(2,"fill",960-f:getWidth("   CREAR GENERAL   ")/2,height-line,f:getWidth("   CREAR GENERAL   "),line,3,0,0,0)
                render:text(2,"   CREAR GENERAL   ",960-f:getWidth("   CREAR GENERAL   ")/2,height-line,4)
            end
        end
        farms:draw(p.turn)
        soldiers:draw(p.turn)
    end
end
