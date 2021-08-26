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
	nero.x, nero.y = 20, display.contentHeight * 0.66
	sceneGroup:insert(nero);

	-- 타이틀 등장 후 사라지게 --
	local title = display.newImage("image/image1/map1_title.png")
	title.x, title.y = display.contentWidth*0.5, display.contentHeight*0.35
	sceneGroup:insert(title)
	transition.fadeOut(title, { delay = 700, time = 1000 })


	local block_img = {"image/image1/1.png", "image/image1/2.png", "image/image1/3.png", "image/image1/1.png"}
	local block = {}

	bx, by = 150, 700
	for i = 1, 4 do
		block[i] = display.newImageRect(block_img[i], 300, 300)
		block[i].x, block[i].y = bx, by
		bx = bx + 300
		if (i == 2) then
			bx = bx + 150
		end
		sceneGroup:insert(block[i])
	end
	
	-- 방향키 입력시 움직이는 이벤트리스너
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.moveBy(nero, {x = 600 - nero.x, time = (600 - nero.x) * 7})
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.moveBy(nero, {x = -nero.x, time = nero.x * 7})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.x == 600) then
				transition.to(nero, {x = 650, y = nero.y + 20, time = 200})
				transition.to(nero, {delay = 200, y = 760, time = 700})
				Runtime:removeEventListener("key", move)
				composer.gotoScene("game2_maze", { effect = "fade", time = 800 })
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