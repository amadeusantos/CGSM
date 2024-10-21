local composer = require("composer")
local const = require("src.const")
local arrow = require("src.components.arrow")
local button = require("src.components.button")
local information = require("src.components.information")
local scene = composer.newScene()

local function previousPage(event)
    composer.gotoScene("src.screens.page06", "fade")
end

local function frontPage(event)
    composer.gotoScene("src.screens.cover", "fade")
end

local function openReferences()
    composer.showOverlay("src.components.modal", {
        params = { type = "src/assets/backCover/references_title.png", text = "src/assets/backCover/references_text.png" }
    })
end

function scene:create(event)
    local objects = {}
    local sceneGroup = self.view
    objects.title = display.newImage("src/assets/cover/title_cover.png")
    objects.title.x = const.WIDTH / 2
    objects.title.y = const.HEIGHT / 8
    sceneGroup:insert(objects.title)

    objects.discipline = display.newImage("src/assets/backCover/discipline.png")
    objects.discipline.x = const.WIDTH / 2
    objects.discipline.y = const.HEIGHT / 4
    sceneGroup:insert(objects.discipline)

    objects.image = display.newImage("src/assets/backCover/image_back_cover.png")
    objects.image.x = const.WIDTH / 2
    objects.image.y = const.HEIGHT * (6 / 13)
    sceneGroup:insert(objects.image)

    objects.organizer = display.newImage("src/assets/backCover/organizer.png")
    objects.organizer.x = const.WIDTH / 2
    objects.organizer.y = const.HEIGHT * (8 / 12)
    sceneGroup:insert(objects.organizer)


    objects.textName = display.newImage("src/assets/cover/name.png")
    objects.textName.x = const.WIDTH / 2
    objects.textName.y = const.HEIGHT * (9 / 12)
    sceneGroup:insert(objects.textName)

    objects.referencesButton = button.init("src/assets/backCover/references.png", const.WIDTH / 2,
        const.HEIGHT * (12 / 13), openReferences)
    objects.referencesButton.x = const.WIDTH / 2
    objects.referencesButton.y = const.HEIGHT * (11 / 13)
    sceneGroup:insert(objects.referencesButton)

    objects.frontPageButton = button.init("src/assets/backCover/front_page.png", const.WIDTH / 2,
        const.HEIGHT * (12 / 13), frontPage)
    sceneGroup:insert(objects.frontPageButton)

    objects.rollback = arrow.init(const.WIDTH * (1 / 10), const.HEIGHT * (15 / 16), previousPage, 180)
    sceneGroup:insert(objects.rollback)

    objects.information = information.init("src/assets/instructions.png", "src/assets/backCover/interaction.png")
    sceneGroup:insert(objects.information)
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
