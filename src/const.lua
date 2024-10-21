local const = {
    WIDTH = 768,
    HEIGHT = 1024,
    COLOR_PRIMARY = function()
        return 39 / 255, 55 / 255, 77 / 255
    end,
    COLOR_SECUDARY = function()
        return 82 / 255, 109 / 255, 130 / 255
    end,
    COLOR_TERCIARY = function()
        return 157 / 255, 178 / 255, 191 / 255
    end,
    GRAY = function()
        return 0, 0, 0, 0.7
    end,
    WHITE = function()
        return 1, 1, 1
    end
}

return const
