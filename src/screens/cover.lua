local composer = require("composer")
local arrow = require("src.components.arrow")
local information = require("src.components.information")
local const = require("src.const")
local scene = composer.newScene()

local function nextPage(event)
    composer.gotoScene("src.screens.page02", "fade")
end

function scene:create(event)
    local objects = {}
    local sceneGroup = self.view
    objects.title = display.newImage("src/assets/cover/title_cover.png")
    objects.title.x = const.WIDTH / 2
    objects.title.y = const.HEIGHT / 8
    sceneGroup:insert(objects.title)
    objects.image = display.newImage("src/assets/cover/image.png")
    objects.image.x = const.WIDTH / 2
    objects.image.y = const.HEIGHT * (6 / 12)
    sceneGroup:insert(objects.image)


    objects.textName = display.newImage("src/assets/cover/name.png")
    objects.textName.x = const.WIDTH / 2
    objects.textName.y = const.HEIGHT * (10 / 12)
    sceneGroup:insert(objects.textName)

    objects.information = information.init("src/assets/instructions.png", "src/assets/cover/interaction.png")
    sceneGroup:insert(objects.information)

    objects.next = arrow.init(const.WIDTH * (9 / 10), const.HEIGHT * (15 / 16), nextPage, 0)
    sceneGroup:insert(objects.next)
end

function scene:show(event)
    local phase = event.phase

    if (phase == "did") then
        -- Code here runs when the scene is entirely on screen
    end
end

function scene:hide(event)
    local phase = event.phase

    if (phase == "will") then
        -- Code here runs when the scene is on screen (but is about to go off screen)
    end
end

function scene:destroy(event)
    -- Code here runs prior to the removal of the scene"s view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
