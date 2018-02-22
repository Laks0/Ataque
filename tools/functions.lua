function mouse_en(fx,fy,fw,fh)
    local x = fx - camera.x * camera.scaleX
    local y = fy - camera.y * camera.scaleX
    local w = fw-- / camera.scaleX
    local h = fh-- / camera.scaleY
    return mouse.x > x and mouse.x < x + w and mouse.y > y and mouse.y < y + h
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
