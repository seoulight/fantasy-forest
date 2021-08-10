-- 대화 템플릿
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local neroDefault = display.newImageRect("image/char/nero_default.png", 400, 440)
	neroDefault.x, neroDefault.y = display.contentWidth * 0.8, display.contentHeight * 0.33
	sceneGroup:insert(neroDefault)

	local text1 = display.newImageRect("image/char/text1.png", 1150, 340)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text1)

	local playerName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(playerName)

	local text = { }
	text[1] = display.newText("스크립트 테스트용", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])



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

	text1:addEventListener("touch", tab)
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