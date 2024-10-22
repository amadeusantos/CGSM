local Sound = {}
local const = require("src.const")
Sound.x = const.WIDTH * (11 / 12)
Sound.y = const.HEIGHT * (1 / 32)


function Sound.init()
    local activeImage = display.newImage("src/assets/sound.png")
    local desactiveImage = display.newImage("src/assets/no_sound.png")

    activeImage.isVisible = true
    desactiveImage.isVisible = false

    activeImage.x = Sound.x
    activeImage.y = Sound.y
    desactiveImage.x = Sound.x
    desactiveImage.y = Sound.y
    local function onObjectTouch(event)
        activeImage.isVisible = not activeImage.isVisible
        desactiveImage.isVisible = not activeImage.isVisible
        return true
    end
    activeImage:addEventListener("tap", onObjectTouch)
    desactiveImage:addEventListener("tap", onObjectTouch)

    return activeImage, desactiveImage
end

return Sound
