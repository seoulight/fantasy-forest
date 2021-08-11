-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/main_bg.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local btnNew = display.newImageRect("image/image1/main_1_1.png", 197, 72);
	btnNew.x, btnNew.y = display.contentWidth * 0.5, display.contentHeight * 0.51
	btnNew.name = "new game"

	sceneGroup:insert(btnNew)

	local function nextView( event )
		transition.fadeOut(bg, {time = 500})
		transition.fadeOut(btnNew, {time = 500})
		local options = {
					    effect = "fade",
					    time = 800
					}
    	composer.gotoScene("view2", options)
 	 end
 	 bg:addEventListener("tab", nextView)
	
	local function onNewgameTab( event )
		local object = event.target
		print(object.name)
		nextView()
		return true
	end

	btnNew:addEventListener("tap", onNewgameTab)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		composer.removeScene("view1")
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene