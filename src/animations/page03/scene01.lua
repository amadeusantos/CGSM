local Scene01 = {}
local const = require("src.const")
local physics = require("physics")
local objects = {}
local joint = {}

local function onDragMove(event)
    local target = event.target

    if event.phase == "began" then
        display.getCurrentStage():setFocus(target)
        target.isFocus = true

        target.touchOffsetX = event.x - target.x
        target.touchOffsetY = event.y - target.y
    elseif event.phase == "moved" and target.isFocus then
        if event.x - target.touchOffsetX > 64 and event.x - target.touchOffsetX < const.WIDTH - 64 then
            target.x = event.x - target.touchOffsetX
        end
        if event.y - target.touchOffsetY > 64 and event.y - target.touchOffsetY < const.HEIGHT - 64 then
            target.y = event.y - target.touchOffsetY
        end
    elseif event.phase == "ended" or event.phase == "cancelled" then
        display.getCurrentStage():setFocus(nil)
        target.isFocus = false
    end

    return true
end


local function collision1(self, event)
    if event.phase == "began" then
        if event.other.name == "links1" and joint.links1 then
            joint.links1:removeSelf()
            joint.links1 = nil
            self.isVisible = false
            objects.scissors2.isVisible = true
            objects.links_1.isVisible = false
        end
    end
    return true
end

local function collision2(self, event)
    if event.phase == "began" then
        if event.other.name == "links2" and joint.links2 then
            joint.links2:removeSelf()
            joint.links2 = nil
            self.isVisible = false
            objects.links_2.isVisible = false
        end
    end
    return true
end

function Scene01.init()
    physics.start()
    physics.setGravity(0, 9.8)
    objects.grafeno_1 = display.newImage("src/assets/page_03/grafeno.png")
    objects.grafeno_1.x = const.WIDTH / 2
    objects.grafeno_1.y = const.HEIGHT * (13 / 17) - 72
    physics.addBody(objects.grafeno_1, "kinematic", { density = 1.0, friction = 0.5, bounce = 0.3 })

    objects.grafeno_2 = display.newImage("src/assets/page_03/grafeno.png")
    objects.grafeno_2.x = const.WIDTH / 2 + 25
    objects.grafeno_2.y = const.HEIGHT * (13 / 17)
    physics.addBody(objects.grafeno_2, { density = 1.0, friction = 0.5, bounce = 0.3, radius = 40 })
    objects.grafeno_2.name = "links2"

    joint.links2 = physics.newJoint("distance", objects.grafeno_1, objects.grafeno_2, const.WIDTH / 2,
        const.HEIGHT * (13 / 17) - 35, const.WIDTH / 2 + 25, const.HEIGHT * (13 / 17))

    objects.grafeno_3 = display.newImage("src/assets/page_03/grafeno.png")
    objects.grafeno_3.x = const.WIDTH / 2
    objects.grafeno_3.y = const.HEIGHT * (13 / 17) + 60
    physics.addBody(objects.grafeno_3, { density = 1.0, friction = 0.5, bounce = 0.3, radius = 40 })
    objects.grafeno_3.name = "links1"

    objects.grafenoFull = display.newImage("src/assets/page_03/grafeno_full.png")
    objects.grafenoFull.x = const.WIDTH / 2
    objects.grafenoFull.y = const.HEIGHT + 150

    joint.links1 = physics.newJoint("distance", objects.grafeno_2, objects.grafeno_3, const.WIDTH / 2 + 25,
        const.HEIGHT * (13 / 17), const.WIDTH / 2, const.HEIGHT * (13 / 17) + 60)

    objects.scissors = display.newImage("src/assets/page_03/scissors.png")
    objects.scissors.x = const.WIDTH / 6
    objects.scissors.y = const.HEIGHT * (5 / 7)
    objects.scissors:addEventListener("touch", onDragMove)
    physics.addBody(objects.scissors, "static",
        { density = 1.0, friction = 0.5, bounce = 0.3, isSensor = true, radius = 10 })
    objects.scissors.collision = collision1
    objects.scissors:addEventListener("collision")

    objects.scissors2 = display.newImage("src/assets/page_03/scissors.png")
    objects.scissors2.x = const.WIDTH / 6
    objects.scissors2.y = const.HEIGHT * (5 / 7)
    objects.scissors2.isVisible = false
    objects.scissors2:addEventListener("touch", onDragMove)
    physics.addBody(objects.scissors2, "static",
        { density = 1.0, friction = 0.5, bounce = 0.3, isSensor = true, radius = 10 })
    objects.scissors2.collision = collision2
    objects.scissors2:addEventListener("collision")


    objects.links_1 = display.newImage("src/assets/page_03/links.png")
    objects.links_1.x = const.WIDTH / 2
    objects.links_1.y = const.HEIGHT * (13 / 17) + 25


    objects.links_2 = display.newImage("src/assets/page_03/links.png")
    objects.links_2.x = const.WIDTH / 2
    objects.links_2.y = const.HEIGHT * (13 / 17) - 35


    local group = display.newGroup()

    for _, object in pairs(objects) do
        group:insert(object)
    end

    return group
end

function Scene01.reset()
    objects.grafeno_1.x = const.WIDTH / 2
    objects.grafeno_1.y = const.HEIGHT * (13 / 17) - 72

    objects.grafeno_2.x = const.WIDTH / 2 + 25
    objects.grafeno_2.y = const.HEIGHT * (13 / 17)

    if not joint.links2 then
        joint.links2 = physics.newJoint("distance", objects.grafeno_1, objects.grafeno_2, const.WIDTH / 2,
            const.HEIGHT * (13 / 17) - 35, const.WIDTH / 2 + 25, const.HEIGHT * (13 / 17))
    end

    objects.grafeno_3.x = const.WIDTH / 2
    objects.grafeno_3.y = const.HEIGHT * (13 / 17) + 60

    if not joint.links1 then
        joint.links1 = physics.newJoint("distance", objects.grafeno_2, objects.grafeno_3, const.WIDTH / 2 + 25,
            const.HEIGHT * (13 / 17), const.WIDTH / 2, const.HEIGHT * (13 / 17) + 60)
    end

    objects.grafenoFull.x = const.WIDTH / 2
    objects.grafenoFull.y = const.HEIGHT + 150

    objects.scissors.x = const.WIDTH / 6
    objects.scissors.y = const.HEIGHT * (5 / 7)
    objects.scissors.isVisible = true

    objects.scissors2.x = const.WIDTH / 6
    objects.scissors2.y = const.HEIGHT * (5 / 7)
    objects.scissors2.isVisible = false

    objects.links_1.x = const.WIDTH / 2
    objects.links_1.y = const.HEIGHT * (13 / 17) + 25

    objects.links_1.isVisible = true

    objects.links_2.x = const.WIDTH / 2
    objects.links_2.y = const.HEIGHT * (13 / 17) - 35
    objects.links_2.isVisible = true

    objects.grafeno_2:setLinearVelocity(0, 0)
    objects.grafeno_3:setLinearVelocity(0, 0)
end

local function rotationLinks(event)
    objects.links_2.x = objects.grafeno_2.x
    objects.links_2.y = objects.grafeno_2.y - 35
    objects.links_2.rotation = math.atan(objects.grafeno_1.x - objects.grafeno_2.x) * 2


    objects.links_1.x = objects.grafeno_3.x
    objects.links_1.y = objects.grafeno_3.y - 35
    objects.links_1.rotation = math.atan(objects.grafeno_2.x - objects.grafeno_3.x) * 2

    if not objects.scissors.isVisible and not objects.scissors2.isVisible then
        objects.grafeno_1.y = objects.grafeno_1.y + 5
    end

    if objects.grafeno_1.y > const.HEIGHT + 100 and objects.grafenoFull.y >= (const.HEIGHT * (7 / 10) + 50) then
        objects.grafenoFull.y = objects.grafenoFull.y - 5
    end
end

Runtime:addEventListener("enterFrame", rotationLinks)

return Scene01
