local Scene01 = {}
local const = require("src.const")
local objects = {}

local function createRaindrop()
    local raindrop = display.newCircle(0, 0, 2.5)
    raindrop:setFillColor(1, (217 / 255), (115 / 255))

    local gradient = {
        type = "gradient",
        color1 = { 1, (217 / 255), (115 / 255) },
        color2 = { 1, (217 / 255), (115 / 255) },
        direction = "down"
    }

    raindrop.fill = gradient

    return raindrop
end

local function shake(event)
    if event.isShake then
        local numRaindrops = 50
        for i = 1, numRaindrops do
            local raindropInstance = createRaindrop()
            raindropInstance.x = math.random(const.WIDTH / 4, const.WIDTH * 3 / 4)
            raindropInstance.y = const.HEIGHT * (12 / 20) - objects.biofertilizer.width / 2
            transition.to(raindropInstance, {
                y = const.HEIGHT * (15 / 20) + objects.cornInitial.height / 2,
                time = 2000,
                onComplete = function()
                    display.remove(raindropInstance)
                    objects.cornInitial.isVisible = false
                    objects.cornEnd.isVisible = true
                    Runtime:removeEventListener("accelerometer", shake)
                end
            })
        end
    end
    return true
end

Runtime:addEventListener("accelerometer", shake)

function Scene01.init()
    objects.biofertilizer = display.newImage("src/assets/page_05/biofertilizer.png")
    objects.biofertilizer.x = const.WIDTH / 2
    objects.biofertilizer.y = const.HEIGHT * (12 / 20)
    objects.cornInitial = display.newImage("src/assets/page_05/cornInitial.png")
    objects.cornInitial.x = const.WIDTH / 2
    objects.cornInitial.y = const.HEIGHT * (15 / 20)
    objects.cornEnd = display.newImage("src/assets/page_05/cornEnd.png")
    objects.cornEnd.x = const.WIDTH / 2
    objects.cornEnd.y = const.HEIGHT * (15 / 20)
    objects.cornEnd.isVisible = false
    local group = display.newGroup()
    -- Runtime:addEventListener("accelerometer", shake)

    for _, object in pairs(objects) do
        group:insert(object)
    end

    return group
end

function Scene01.reset()
    objects.cornInitial.isVisible = true
    objects.cornEnd.isVisible = false
    Runtime:addEventListener("accelerometer", shake)
end

return Scene01
