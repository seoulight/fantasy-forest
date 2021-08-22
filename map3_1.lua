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
	

	-- 네로 캐릭터
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 100, height = 166, numFrames = 4})
	local sequences_nero = {
		{
			name = "walkRight",
			frames = { 1, 2 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "walkLeft",
			frames = { 3, 4 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		}
	}
	local nero = display.newSprite(nero_sheet, sequences_nero)
	nero.x, nero.y = 30, display.contentHeight * 0.6
	sceneGroup:insert(nero);
	sceneGroup:insert(sail)


	-- 좌표 알아내기용 이벤트
	-- local function tab( event )
	-- 	if ( event.phase == "began" ) then
	-- 		print("touched")
	-- 	elseif ( event.phase == "moved" ) then
	-- 		print(event.x .. ", " .. event.y)
	-- 	elseif ( event.phase == "ended") then
	-- 		print("ended")
	-- 	end
	-- 	return true
	-- end

	-- Runtime:addEventListener("touch", tab)

	local function nextScene()
		-- transition.fadeOut(sceneGroup, {time = 300})
		local options = {
					    effect = "fade",
					    time = 500
					}
		composer.gotoScene( "map3_2" , options)
	end

	-- 방향키 입력시 움직이는 이벤트리스너
	function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 340) then
					transition.moveBy(nero, {x = 340 - nero.x, time = (340 - nero.x) * 7})
				else
					transition.moveBy(nero, {x = 1280 - nero.x, y = 450, time = (1280 - nero.x) * 7})
				end
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				if (nero.x < 340) then
					transition.moveBy(nero, {x = -nero.x, time = nero.x * 7})
				else
					transition.moveBy(nero, {x = -nero.x, y = -450, time = nero.x * 7})
				end
				transition.to(nero, {x = nero.x - 1000, time = 7000})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.y > 620) then
				Runtime:removeEventListener("key", move)
				nextScene()
			end
		end
	end
	
	Runtime:addEventListener("key", move)

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
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