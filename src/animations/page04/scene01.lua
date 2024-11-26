local Scene01 = {}
local const = require("src.const")
local objects = {}
local aphids = {}

local function createAphids()
    aphids[1] = display.newImage("src/assets/page_04/aphid.png")
    aphids[1].x = 478
    aphids[1].y = 670
    aphids[1].vectorFinalX = 235
    aphids[1].vectorFinalY = 880
    aphids[1].vectorInitialX = 478
    aphids[1].vectorInitialY = 670


    aphids[2] = display.newImage("src/assets/page_04/aphid.png")
    aphids[2].x = 583
    aphids[2].y = 688
    aphids[2].vectorFinalX = 509
    aphids[2].vectorFinalY = 640
    aphids[2].vectorInitialX = 583
    aphids[2].vectorInitialY = 688

    aphids[3] = display.newImage("src/assets/page_04/aphid.png")
    aphids[3].x = 519
    aphids[3].y = 739
    aphids[3].vectorFinalX = 374
    aphids[3].vectorFinalY = 564
    aphids[3].vectorInitialX = 519
    aphids[3].vectorInitialY = 739

    aphids[4] = display.newImage("src/assets/page_04/aphid.png")
    aphids[4].x = 601
    aphids[4].y = 777
    aphids[4].vectorFinalX = 227
    aphids[4].vectorFinalY = 647
    aphids[4].vectorInitialX = 601
    aphids[4].vectorInitialY = 777

    aphids[5] = display.newImage("src/assets/page_04/aphid.png")
    aphids[5].x = 494
    aphids[5].y = 816
    aphids[5].vectorFinalX = 252
    aphids[5].vectorFinalY = 795
    aphids[5].vectorInitialX = 494
    aphids[5].vectorInitialY = 816

    aphids[6] = display.newImage("src/assets/page_04/aphid.png")
    aphids[6].x = 561
    aphids[6].y = 855
    aphids[6].vectorFinalX = 525
    aphids[6].vectorFinalY = 822
    aphids[6].vectorInitialX = 561
    aphids[6].vectorInitialY = 855

    local group = display.newGroup()

    for _, object in pairs(aphids) do
        group:insert(object)
    end

    return group
end

local function resetAphids()
    for _, object in pairs(aphids) do
        object.x = object.vectorInitialX
        object.y = object.vectorInitialY
    end
end

local function setVector(porcentual)
    for _, object in pairs(aphids) do
        object.x = object.vectorInitialX - ((object.vectorInitialX - object.vectorFinalX) * porcentual)
        object.y = object.vectorInitialY - ((object.vectorInitialY - object.vectorFinalY) * porcentual)
    end
end

function Scene01.init()
    objects.ladybugs = display.newImage("src/assets/page_04/ladybugs.png")
    objects.ladybugs.x = const.WIDTH * 6 / 20
    objects.ladybugs.y = const.HEIGHT * (5 / 7)

    objects.plantation = display.newImage("src/assets/page_04/plantation.png")
    objects.plantation.x = const.WIDTH * 14 / 20
    objects.plantation.y = const.HEIGHT * (5 / 7)

    objects.aphids = createAphids()

    local function onDragLadyBugs(event)
        if (event.phase == "began") then
            display.currentStage:setFocus(objects.ladybugs)
            objects.ladybugs.isFocus = true
            objects.ladybugs.markX = objects.ladybugs.x
        elseif (event.phase == "moved") then
            local x = (event.x - event.xStart) + objects.ladybugs.markX
            local leftLimit = const.WIDTH * 6 / 20
            local rightLimit = const.WIDTH / 2

            if (x > leftLimit and x < rightLimit) then
                objects.ladybugs.x = x
                objects.plantation.x = const.WIDTH - objects.ladybugs.x
                setVector((x - leftLimit) / (rightLimit - leftLimit))
            end

            if (x < display.contentCenterX - 100) then
                objects.ladybugs.isFocus = false
            end
        elseif (event.phase == "ended" or event.phase == "cancelled") then
            display.currentStage:setFocus(nil)
            objects.ladybugs.isFocus = false
        end
        return true
    end

    objects.ladybugs:addEventListener("touch", onDragLadyBugs)

    local group = display.newGroup()

    for _, object in pairs(objects) do
        group:insert(object)
    end

    objects.aphids:toFront()
    objects.ladybugs:toFront()

    return group
end

function Scene01.reset()
    objects.ladybugs.x = const.WIDTH * 6 / 20
    objects.ladybugs.y = const.HEIGHT * (5 / 7)

    objects.plantation.x = const.WIDTH * 14 / 20
    objects.plantation.y = const.HEIGHT * (5 / 7)

    resetAphids()
end

return Scene01
