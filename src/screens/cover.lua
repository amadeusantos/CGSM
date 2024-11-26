local composer = require("composer")
local button = require("src.components.button")
local sound = require("src.components.sound")
local information = require("src.components.information")
local const = require("src.const")
local scene = composer.newScene()

local audio = {}

local function nextPage(event)
    composer.gotoScene("src.screens.page02", "fade")
end

function scene:create(event)
    local objects = {}
    local sceneGroup = self.view
    objects.title = display.newImage("src/assets/cover/title_cover.png")
    objects.title.x = const.WIDTH / 2
    objects.title.y = const.HEIGHT / 6
    sceneGroup:insert(objects.title)
    objects.image = display.newImage("src/assets/cover/image.png")
    objects.image.x = const.WIDTH / 2
    objects.image.y = const.HEIGHT * (17 / 32)
    sceneGroup:insert(objects.image)


    objects.textName = display.newImage("src/assets/cover/name.png")
    objects.textName.x = const.WIDTH / 2
    objects.textName.y = const.HEIGHT * (12 / 14)
    sceneGroup:insert(objects.textName)

    objects.information = information.init("src/assets/instructions.png", "src/assets/cover/interaction.png")
    sceneGroup:insert(objects.information)

    objects.next = button.init("src/assets/next_page.png", const.WIDTH * (9 / 10), const.HEIGHT * (15 / 16), nextPage)
    sceneGroup:insert(objects.next)

    audio = sound.init("src/assets/cover/audio.mp3")

    sceneGroup:insert(audio)
end

function scene:show(event)
    local phase = event.phase

    if (phase == "did") then
        -- Code here runs when the scene is entirely on screen
    end
end

function scene:hide(event)
    local phase = event.phase
    audio.reset()
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
