local lm = love.math

function menu_load()
    bc = {{lm.random(0,255),lm.random(0,255),lm.random(0,255)},
    {lm.random(0,255),lm.random(0,255),lm.random(0,255)}}
end

function menu_update(dt)
    if pres.L and mouse_en(width/2-f:getWidth("    JUGAR    ")/2,height/2-line/2,f:getWidth("    JUGAR    "),line) then
        state = "game"
    end
end

function menu_draw()
    render:line(1,width/2,0,width/2,height,4)
    render:rectangle(1,"fill",0,0,width/2,height,3,bc[1][1],bc[1][2],bc[1][3],100)
    render:rectangle(1,"fill",width/2,0,width/2,height,3,bc[2][1],bc[2][2],bc[2][3],100)

    render:rectangle(2,"fill",width/2-f:getWidth("    JUGAR    ")/2,height/2-line/2,f:getWidth("    JUGAR    "),line,1,0,0,0)
    render:text(2,"    JUGAR    ",width/2-f:getWidth("    JUGAR    ")/2,height/2-line/2,2)
end
