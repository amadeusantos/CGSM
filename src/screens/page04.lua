local composer = require("composer")
local const = require("src.const")
local arrow = require("src.components.arrow")
local scene = composer.newScene()

local function previousPage(event)
    composer.gotoScene("src.screens.page03", "fade")
end

local function nextPage(event)
    composer.gotoScene("src.screens.page05", "fade")
end

function scene:create(event)
    local objects = {}
    local sceneGroup = self.view
    objects.next = arrow.init(const.WIDTH * (9 / 10), const.HEIGHT * (15 / 16), nextPage, 0)
    objects.rollback = arrow.init(const.WIDTH * (1 / 10), const.HEIGHT * (15 / 16), previousPage, 180)
    sceneGroup:insert(objects.next)
    sceneGroup:insert(objects.rollback)
    objects.page = display.newImage("src/assets/pages/page_4.png")
    objects.page.x = const.WIDTH * (1 / 2)
    objects.page.y = const.HEIGHT * (15 / 16)
    sceneGroup:insert(objects.page)
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
