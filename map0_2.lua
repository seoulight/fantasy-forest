-----------------------------------------------------------------------------------------
--
-- map0_2.lua
-- 무지개호수(앵무 구하는 것 추가해야됨)
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local bg = display.newImageRect("image/rainbow/bg1.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	-- 네로 캐릭터
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 738 / 3, height = 648 * 0.5, numFrames = 6})
	local sequences_nero = {
		{
			name = "walkRight",
			frames = { 1, 2},
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "walkLeft",
			frames = { 5, 6 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		}
	}
	local nero = display.newSprite(nero_sheet, sequences_nero)
	nero.x, nero.y = 70, display.contentHeight * 0.5
	transition.to(nero, {time = 0, xScale = 0.7, yScale = 0.7})
	sceneGroup:insert(nero)

	-- 땅 --
	local b1 = { }
	local b1Group = display.newGroup()

	for i = 1, 6 do
		b1[i] = display.newImageRect(b1Group,"image/rainbow/1-1.png", 100, 100) 
		b1[i].x, b1[i].y = bg.x + 100 * i, bg.y
	end

	b1Group.x = b1Group.x - 690
	b1Group.y = b1Group.y + 110

	local b2 = display.newImageRect("image/rainbow/1-2.png", 100, 100) 
	b2.x, b2.y = display.contentWidth*0.508, display.contentHeight*0.653

	local b3 = { }
	local b3Group = display.newGroup()

	for i = 1, 6 do
		b3[i] = display.newImageRect(b3Group,"image/rainbow/1-4.png", 100, 100) 
		b3[i].x, b3[i].y = bg.x + 100 * i, bg.y
	end

	b3Group.x = b3Group.x - 690
	b3Group.y = b3Group.y + 210

	local b4 = { }
	local b4Group = display.newGroup()

	for i = 1, 2 do
		b4[i] = display.newImageRect(b4Group, "image/rainbow/1-3.png", 100, 100) 
		b4[i].x, b4[i].y = bg.x, bg.y * i * 0.278
	end

	b4Group.x = b4Group.x + 10
	b4Group.y = b4Group.y + 470

	local b5 = { }
	local b5Group = display.newGroup()

	for i = 1, 6 do
		b5[i] = display.newImageRect(b5Group,"image/rainbow/1-4.png", 100, 100) 
		b5[i].x, b5[i].y = bg.x + 100 * i, bg.y
	end

	b5Group.x = b5Group.x - 690
	b5Group.y = b5Group.y + 310

	-- 호수 --
	local b6 = { }
	local b6Group = display.newGroup()

	for i = 1, 13  do
		b6[i] = display.newImageRect(b6Group,"image/rainbow/1-5.png", 100, 100) 
		b6[i].x, b6[i].y = bg.x + 100 * i, bg.y
	end

	b6Group.x = b6Group.x - 690
	b6Group.y = b6Group.y + 210

	local b7 = { }
	local b7Group = display.newGroup()

	for i = 1, 13  do
		b7[i] = display.newImageRect(b7Group,"image/rainbow/1-6.png", 100, 100) 
		b7[i].x, b7[i].y = bg.x + 100 * i, bg.y
	end

	b7Group.x = b7Group.x - 690
	b7Group.y = b7Group.y + 310

	-- 아이템 --
	local flower = { }
	local flowerGroup = display.newGroup()

	for i = 1, 3 do
		flower[i] = display.newImageRect(flowerGroup, "image/rainbow/flower1.png", 55, 75)
		flower[i].x, flower[i].y = bg.x + 180 * i, bg.y
	end

	flowerGroup.x = flowerGroup.x - 620
	flowerGroup.y = flowerGroup.y + 30

	local wave = { }
	local waveGroup = display.newGroup()

	for i = 1, 3 do
		wave[i] = display.newImageRect(waveGroup, "image/rainbow/wave.png", 350, 150)
		wave[i].x, wave[i].y = bg.x + 400 * i, bg.y
	end
	
	waveGroup.x = waveGroup.x - 800
	waveGroup.y = waveGroup.y + 250

	sceneGroup:insert(b1Group)
	sceneGroup:insert(b2)
	sceneGroup:insert(b3Group)
	sceneGroup:insert(b4Group)
	sceneGroup:insert(b5Group)
	sceneGroup:insert(b6Group)
	sceneGroup:insert(b7Group)
	sceneGroup:insert(flowerGroup)
	sceneGroup:insert(waveGroup)
	nero:toFront()



	-- 방향키 입력시 움직이는 이벤트리스너
	function move( event )
		if (nero.x <= 0) then
			Runtime:removeEventListener("key", move)
			composer.gotoScene("map1_0", { effect = "fade", time = 900 })
		end
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.moveBy(nero, {x = 680 - nero.x, time = (680 - nero.x) * 7})
				
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.moveBy(nero, {x = -nero.x, time = nero.x * 7})
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
		composer.removeScene("map0_2")
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