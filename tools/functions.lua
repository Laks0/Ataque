function mouse_en(x,y,w,h)
    return mouse.x > x and mouse.x < x + w and mouse.y > y and mouse.y < y + h
end

function dist(x,y,x2,y2)
    return math.sqrt((x-x2)^2 + (y-y2)^2)
end

function sign(n)
    if n > 0 then
        return 1
    elseif n < 0 then
        return -1
    elseif n == 0 then
        return 0
    end
end

function cam(x,y)
    return x*camera.scaleX + camera.x, y*camera.scaleY + camera.y
end
