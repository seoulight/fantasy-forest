-----------------------------------------------------------------------------------------
--
-- map3_1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5

	local bg = display.newImageRect("image/image2/1-1.png", 1280, 720)
	bg.x, bg.y = cx, cy
	sceneGroup:insert(bg)

	local npc = display.newImageRect("image/image2/mermaid_1.png", 223, 342)
	npc.x, npc.y = 860, 450
	sceneGroup:insert(npc)

	local sail = display.newImageRect("image/image2/1-2.png", 1280, 720)
	sail.x, sail.y = cx, cy
	sceneGroup:insert(sail)


	-- 좌표 알아내기용 이벤트
	local function tab( event )
		if ( event.phase == "began" ) then
			print("touched")
		elseif ( event.phase == "moved" ) then
			print(event.x .. ", " .. event.y)
		elseif ( event.phase == "ended") then
			print("ended")
		end
		return true
	end

	Runtime:addEventListener("touch", tab)
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