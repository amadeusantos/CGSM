local sound = {}
local const = require("src.const")
sound.activeImage = display.newImage("src/assets/sound.png")
sound.desactiveImage = display.newImage("src/assets/no_sound.png")

sound.x = const.WIDTH * (11 / 12)
sound.y = const.HEIGHT * (1 / 32)

sound.active = true
sound.activeImage.isVisible = true
sound.desactiveImage.isVisible = false
sound.id = "sound"
sound.activeImage.x = sound.x
sound.activeImage.y = sound.y
sound.desactiveImage.x = sound.x
sound.desactiveImage.y = sound.y

local function onObjectTouch(event)
    if (event.phase == "ended") then
        sound.activeImage.isVisible = not sound.active
        sound.desactiveImage.isVisible = sound.active
        sound.active = not sound.active
    end

    return true
end
sound.activeImage:addEventListener("touch", onObjectTouch)
sound.desactiveImage:addEventListener("touch", onObjectTouch)

return sound
