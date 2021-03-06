widget = require("widget")
local centerX, centerY = display.contentWidth * 0.5, display.contentHeight * 0.5
local sceneGroup=display.newGroup()

local function handleMenuLevelsEvent()
    --Your code here
end

--Overlay Executed Via Pause Button
pausedPopup = function()

    local group = display.newGroup()
    local back = display.newRoundedRect(group, 0, 0, 200, 150, 12)
    back:setFillColor(255 / 255, 255 / 255, 255 / 255)
    back.x = centerX
    back.y = centerY

    local messages = {}
    messages[#messages + 1] = "PAUSED"

    local tmp = display.newText(group, messages[math.random(1, #messages)], 0, 0, gameFont, 44)
    tmp:setFillColor(109 / 255, 182 / 255, 224 / 255)
    tmp.x = back.x
    tmp.y = back.y - 30

    sceneGroup:insert(group)--insert to sceneGroup for NOT cover the buttons

    local MenuLevels = widget.newButton({
        id = "MenuLevels",
        label = "MenuLevels",
        width = 100,
        height = 100,
        --defaultFile = "MenuLevels.png",
        onEvent = handleMenuLevelsEvent
    })
    MenuLevels.x = centerX
    MenuLevels.y = centerY + 40
    sceneGroup:insert(MenuLevels)


    local MenuPlay = widget.newButton({
        id = "MenuPlay",
        label = "MenuPlay",
        width = 100,
        height = 100,
        --defaultFile = "MenuPlay.png",
        onEvent = handleMenuPlayEvent
    })
    MenuPlay.x = centerX - 90
    MenuPlay.y = centerY + 40
    sceneGroup:insert(MenuPlay)

    local MenuReset = widget.newButton({
        id = "MenuReset",
        label = "MenuReset",
        width = 100,
        height = 100,
        --defaultFile = "MenuReset.png",
        onEvent = handleMenuResetEvent
    })
    MenuReset.x = centerX + 90
    MenuReset.y = centerY + 40
    sceneGroup:insert(MenuReset)


    transition.to(group, { alpha = 0, time = 1000, delay = 5500 })
    timer.performWithDelay(6600, function() group:removeSelf() end)
end


pausedPopup()