-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local composer = require("composer")
local animation = require("src.animations.page02.scene01")

composer.gotoScene("src.screens.cover", "fade")
 
animation.loadCarga()

display.setDefault("background", 1, 1, 1)
