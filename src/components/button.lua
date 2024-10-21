local Button = {}

function Button.init(image, x, y, functionOnClick)
    local item = display.newImage(image)
    item.x = x
    item.y = y
    item:addEventListener("tap", functionOnClick)
    return item
end

return Button
