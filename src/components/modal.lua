local composer = require("composer")
local const = require("src.const")

local scene = composer.newScene()

local background


function scene:create(event)
    local objects = {}
    local sceneGroup = self.view

    background = display.newRect(const.WIDTH / 2, const.HEIGHT / 2, const.WIDTH, const.HEIGHT)
    background:setFillColor(const.GRAY())
    sceneGroup:insert(background)

    local modal = display.newRect(const.WIDTH / 2, const.HEIGHT / 2, const.WIDTH,
        const.HEIGHT * 0.4)
    modal:setFillColor(const.COLOR_SECUDARY())
    sceneGroup:insert(modal)


    objects.title = display.newImage(event.params.type and event.params.type or "src/assets/instructions.png")
    objects.title.x = const.WIDTH / 2
    objects.title.y = const.HEIGHT * 4 / 12
    sceneGroup:insert(objects.title)

    objects.text = display.newImage(event.params.text and event.params.text or "src/assets/cover/interaction.png")
    objects.text.x = objects.text.width / 2 + 12
    objects.text.y = const.HEIGHT * 4 / 12 + objects.text.height / 2 + 32
    sceneGroup:insert(objects.text)

    background.isHitTestable = true

    background:addEventListener("tap", function()
        composer.hideOverlay()
        return true
    end)
end

function scene:show(event)
    local phase = event.phase

    if (phase == "did") then
        -- Code here runs when the scene is entirely on screen
    end
end

function scene:hide(event)
    local phase = event.phase

    if phase == "will" then
        background.isHitTestable = false
    end
end

function scene:destroy(event)
    -- Code here runs prior to the removal of the scene's view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
