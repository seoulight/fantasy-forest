-----------------------------------------------------------------------------------------
--
-- map1_0.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image1/forest.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)


	-- 네로 캐릭터
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites3.png", { width = 300, height = 500, numFrames = 4})
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
	nero.x, nero.y = display.contentWidth * 0.2, display.contentHeight * 0.6
	sceneGroup:insert(nero);
	
	-- local block = display.newImageRect("image/image1/1.png", 400, 400);
	-- block.x, block.y = display.contentWidth * 0.2, display.contentHeight * 0.9

	-- 네로 줄이기
	transition.scaleTo(nero, {xScale = 0.4, yScale = 0.4, time = 0})

	-- 타이틀 등장 후 사라지게 --
	local title = display.newImage("image/image1/map1_title.png")
	title.x, title.y = display.contentWidth*0.5, display.contentHeight*0.35
	sceneGroup:insert(title)
	transition.fadeOut(title, { delay = 500, time = 700 })
	sceneGroup:remove(title)

	local block = display.newImage("image/image1/1.png")
	block.x, block.y = 1500, 800
	sceneGroup:insert(block)

	

	-- 방향키 입력시 움직이는 이벤트리스너
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.to(nero, {x = nero.x + 1000, time = 7000})
				
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.to(nero, {x = nero.x - 1000, time = 7000})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
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
		composer.removeScene("map1_0")
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