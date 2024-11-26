local Scene01 = {}
local const = require("src.const")
local objects = {}
local sheet = {}

system.activate("multitouch")

local finger1, finger2, initialDistance, isZooming

local function calculateDistance(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

local function onTouch(event)
    if event.phase == "began" then
        if not finger1 then
            finger1 = event
        elseif not finger2 then
            finger2 = event
            isZooming = true
            initialDistance = calculateDistance(finger1.x, finger1.y, finger2.x, finger2.y)
        end
    elseif event.phase == "moved" and isZooming then
        if finger1 and finger2 and event.id == finger1.id then
            finger1 = event
        elseif finger1 and finger2 and event.id == finger2.id then
            finger2 = event
        end

        if finger1 and finger2 then
            local currentDistance = calculateDistance(finger1.x, finger1.y, finger2.x, finger2.y)
            local scale = currentDistance / initialDistance

            if objects.zoom.frame + scale < 312 then
                objects.zoom:setFrame(objects.zoom.frame + scale)
            else
                objects.zoom:setFrame(312)
            end

            initialDistance = currentDistance
        end
    elseif event.phase == "ended" or event.phase == "cancelled" then
        if event.id == finger1.id then
            finger1 = nil
        elseif event.id == finger2.id then
            finger2 = nil
        end

        if not finger1 or not finger2 then
            isZooming = false
        end

        -- if extractionDevice.width > 300 then
        --     extractionDevice.isVisible = false
        --     deviceScreen.isVisible = true

        -- end
    end
    return true
end

function Scene01.loadCarga()
    local sheetOptions =
    {
        width = 640,
        height = 360,
        numFrames = 312
    }
    sheet = graphics.newImageSheet("src/assets/page_02/zoom.png", sheetOptions)
end

function Scene01.hide()
    Runtime:removeEventListener("touch", onTouch)
end

function Scene01.init()
    -- local sequenceData =
    -- {
    --     {
    --         name = "camera",
    --         start = 1,
    --         time = 800,
    --         loopCount = 0,
    --         loopDirection = "forward"
    --     },
    --     { name = "scanner", frames = { 3, 4, 5, 6, 7, 8 }, time = 120, loopCount = 4 },
    --     { name = "nanomemeter", start = 9,                     count = 13, time = 300 }
    -- }

    objects.zoom = display.newSprite(sheet, {
        name = "teste",
        start = 1,
        count = 312,
        time = 800,
        loopCount = 0,
        loopDirection = "forward"
    })
    Runtime:addEventListener("touch", onTouch)

    objects.zoom.x = const.WIDTH / 2
    objects.zoom.y = const.HEIGHT * (15 / 20)
    objects.zoom.xScale = 0.75
    objects.zoom.yScale = 0.75

    objects.zoom:setFrame(1)
    -- objects.zoom:setSequence("teste")
    -- objects.zoom:play()


    local group = display.newGroup()

    for _, object in pairs(objects) do
        group:insert(object)
    end

    -- objects.cornInitial:addEventListener("tap", teste)

    return group
end

function Scene01.reset()
    objects.zoom:setFrame(1)
    finger1 = nil
    finger2 = nil
    initialDistance = nil
    isZooming = nil
end

return Scene01
