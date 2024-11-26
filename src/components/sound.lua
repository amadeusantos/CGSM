local Sound = {}
local const = require("src.const")
Sound.x = const.WIDTH * (11 / 12)
Sound.y = const.HEIGHT * (2 / 32)


function Sound.init(source)
    local sound = audio.loadSound(source)
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
        
        if (activeImage.isVisible) then
            audio.stop()
        else
            audio.setVolume(0.5)
            audio.play(sound)
        end
        return true
    end
    
    
    activeImage:addEventListener("tap", onObjectTouch)
    desactiveImage:addEventListener("tap", onObjectTouch)
    
    local group = display.newGroup()
    group.isVisible = true
    group:insert(activeImage)
    group:insert(desactiveImage)
    
    group.reset = function ()
        activeImage.isVisible = true
        desactiveImage.isVisible = false
        audio.stop()
    end

    return group
end

return Sound
