local Information = {}
local composer = require("composer")
local Button = require("src.components.button")
local const = require("src.const")


function Information.init(type, text)
    local item = Button.init("src/assets/information.png", const.WIDTH * (9 / 10), const.HEIGHT * (13 / 16), function()
        composer.showOverlay("src.components.modal", {
            params = { type = type, text = text }
        })
    end)

    return item
end

return Information
