local composer = require("composer")
local const = require("src.const")
local button = require("src.components.button")
local animation = require("src.animations.page05.scene01")
local information = require("src.components.information")
local sound = require("src.components.sound")
local scene = composer.newScene()

local audio = {}

local function previousPage(event)
    composer.gotoScene("src.screens.page04", "fade")
end

local function nextPage(event)
    composer.gotoScene("src.screens.page06", "fade")
end

function scene:create(event)
    local objects = {}
    local sceneGroup = self.view
    objects.next = button.init("src/assets/next_page.png", const.WIDTH * (9 / 10), const.HEIGHT * (15 / 16), nextPage)
    objects.rollback = button.init("src/assets/previous_page.png", const.WIDTH * (1 / 10), const.HEIGHT * (15 / 16),
        previousPage)
    sceneGroup:insert(objects.next)
    sceneGroup:insert(objects.rollback)

    objects.page = display.newImage("src/assets/pages/page_5.png")
    objects.page.x = const.WIDTH * (1 / 2)
    objects.page.y = const.HEIGHT * (15 / 16)
    sceneGroup:insert(objects.page)

    objects.information = information.init("src/assets/instructions.png", "src/assets/page_05/interaction.png")
    sceneGroup:insert(objects.information)

    audio = sound.init("src/assets/page_05/audio.mp3")

    sceneGroup:insert(audio)

    objects.text = display.newImage("src/assets/page_05/text.png")
    objects.text.x = const.WIDTH * (1 / 2)
    objects.text.y = objects.text.width / 2
    sceneGroup:insert(objects.text)

    local objectsAnimations = animation.init()

    sceneGroup:insert(objectsAnimations)
end

function scene:show(event)
    animation.reset()
    
    local phase = event.phase

    if (phase == "did") then
        -- Code here runs when the scene is entirely on screen
    end
end

function scene:hide(event)
    audio.reset()
    animation.hide()
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
