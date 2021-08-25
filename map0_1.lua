-----------------------------------------------------------------------------------------
--
-- map0_1.lua
-- 무지개호수 가는 길
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local bg = display.newImageRect("image/rainbow/bg1.png", 1280, 720)
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
	nero.x, nero.y = display.contentWidth*0.06, display.contentHeight * 0.5
	sceneGroup:insert(nero)

	-- 땅 --
	local b1 = { }
	local b1Group = display.newGroup()

	for i = 1, 13 do
		b1[i] = display.newImageRect(b1Group,"image/rainbow/1-1.png", 100, 100) 
		b1[i].x, b1[i].y = bg.x + 100 * i, bg.y
	end

	b1Group.x = b1Group.x - 690
	b1Group.y = b1Group.y + 110

	local b2 = { }
	local b2Group = display.newGroup()

	for i = 1, 13 do
		b2[i] = display.newImageRect(b2Group,"image/rainbow/1-4.png", 100, 100) 
		b2[i].x, b2[i].y = bg.x + 100 * i, bg.y
	end

	b2Group.x = b2Group.x - 690
	b2Group.y = b2Group.y + 210

	local b3 = { }
	local b3Group = display.newGroup()

	for i = 1, 13 do
		b3[i] = display.newImageRect(b3Group,"image/rainbow/1-4.png", 100, 100) 
		b3[i].x, b3[i].y = bg.x + 100 * i, bg.y
	end

	b3Group.x = b3Group.x - 690
	b3Group.y = b3Group.y + 310

	-- 호수 --
	local b4 = { }
	local b4Group = display.newGroup()

	for i = 1, 13  do
		b4[i] = display.newImageRect(b4Group,"image/rainbow/1-5.png", 100, 100) 
		b4[i].x, b4[i].y = bg.x + 100 * i, bg.y
	end

	b4Group.x = b4Group.x - 690
	b4Group.y = b4Group.y + 210

	local b5 = { }
	local b5Group = display.newGroup()

	for i = 1, 13  do
		b5[i] = display.newImageRect(b5Group,"image/rainbow/1-6.png", 100, 100) 
		b5[i].x, b5[i].y = bg.x + 100 * i, bg.y
	end

	b5Group.x = b5Group.x - 690
	b5Group.y = b5Group.y + 310

	-- 아이템 --
	local flower = { }
	local flowerGroup = display.newGroup()

	for i = 1, 4 do
		flower[i] = display.newImageRect(flowerGroup, "image/rainbow/flower1.png", 55, 75)
		flower[i].x, flower[i].y = bg.x + 350 * i, bg.y
	end

	flowerGroup.x = flowerGroup.x - 850
	flowerGroup.y = flowerGroup.y + 30

	local flower2 = { }
	local flower2Group = display.newGroup()

	for i = 1, 2 do
		flower2[i] = display.newImageRect(flower2Group, "image/rainbow/flower1.png", 55, 75)
		flower2[i].x, flower2[i].y = bg.x + 400 * i, bg.y
	end

	flower2Group.x = flower2Group.x - 800
	flower2Group.y = flower2Group.y + 30

	local wave = { }
	local waveGroup = display.newGroup()

	for i = 1, 3 do
		wave[i] = display.newImageRect(waveGroup, "image/rainbow/wave.png", 350, 150)
		wave[i].x, wave[i].y = bg.x + 400 * i, bg.y
	end
	
	waveGroup.x = waveGroup.x - 800
	waveGroup.y = waveGroup.y + 250

	sceneGroup:insert(b1Group)
	sceneGroup:insert(b2Group)
	sceneGroup:insert(b3Group)
	sceneGroup:insert(b4Group)
	sceneGroup:insert(b5Group)
	sceneGroup:insert(flowerGroup)
	sceneGroup:insert(flower2Group)
	sceneGroup:insert(waveGroup)
	nero:toFront()

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text1.x, text1.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	sceneGroup:insert(text1)
	text1.alpha = 0

	-- 대화창 이름 --
	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	-- 네로 이름 --
	local nero2 = display.newImageRect("image/char/nero_default2.png", 360, 400)
	nero2.x, nero2.y = display.contentWidth * 0.23, display.contentHeight * 0.285
	nero2.alpha = 0

	-- 대사 --
	local text = display.newText("이게 무슨 소리지?? 저기 호숫가로 가보자!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text:setFillColor(0)
	text.alpha = 0

	-- 네로 혼잣말 --
	local j = 0

	local function talk()
		j = 1
		transition.to( text1, { alpha = 0.8, effect = "fade", time = 900 } )
		transition.fadeIn( nero2, { effect = "fade", time = 900 } )
		transition.fadeIn( neroName, { effect = "fade", time = 900 } )
		transition.fadeIn( text, { effect = "fade", time = 900 } )

		local function remove()
			transition.fadeOut( text1, { effect = "fade", time = 900 } )
			transition.fadeOut( nero2, { effect = "fade", time = 900 } )
			transition.fadeOut( neroName, { effect = "fade", time = 900 } )
			transition.fadeOut( text, { effect = "fade", time = 900 } )
		end

		text1:addEventListener("tap", remove)
	end

	-- 방향키 입력시 움직이는 이벤트리스너
	function move( event )
		if (nero.x >= display.contentWidth*0.3 and j ~= 1) then
			talk()
		end
		if (nero.x > display.contentWidth*0.9) then
			Runtime:removeEventListener("key", move)
			composer.gotoScene("map0_2", { effect = "fade", time = 900 })
		end
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
		composer.removeScene("map0_1")
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