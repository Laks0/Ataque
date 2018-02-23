players = {}

function players:create(turn)
    local p = {}
    p.points = 100
    p.turn = turn or #self+1
    p.r = love.math.random(0,255)
    p.g = love.math.random(0,255)
    p.b = love.math.random(0,255)
    table.insert(self,p)
end

function players:update(dt)
    for i,p in ipairs(self) do

    end
end

function players:draw()
    for i,p in ipairs(self) do
        if p.turn == turn then
            render:text(2,"Player "..p.turn.."\n$"..p.points,0,0,3,p.r,p.g,p.b)
        end
    end
end
