local Arrow = {}
local Button = require("src.components.button")

function Arrow.init(x, y, functionOnClick, rotation)
    local item = Button.init("src/assets/right.png", x, y, functionOnClick)
    item.rotation = rotation
    return item
end

return Arrow
