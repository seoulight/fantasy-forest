-----------------------------------------------------------------------------------------
--
-- map0_8.lua
-- 무지개호수(하양, 다음 맵으로 이동)
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local bg = display.newImageRect("image/rainbow/bg5.png", 1280, 720)
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
	nero.x, nero.y = 600, display.contentHeight * 0.4
	
	sceneGroup:insert(nero)

	-- 땅 --
	local b1 = { }
	local b1Group = display.newGroup()

	for i = 1, 6 do
		b1[i] = display.newImageRect(b1Group,"image/rainbow/5-1.png", 100, 100) 
		b1[i].x, b1[i].y = bg.x + 100 * i, bg.y
	end

	b1Group.x = b1Group.x - 690
	b1Group.y = b1Group.y + 110

	local b2 = display.newImageRect("image/rainbow/5-2.png", 100, 100) 
	b2.x, b2.y = display.contentWidth*0.508, display.contentHeight*0.653

	local b3 = { }
	local b3Group = display.newGroup()

	for i = 1, 6 do
		b3[i] = display.newImageRect(b3Group,"image/rainbow/5-4.png", 100, 100) 
		b3[i].x, b3[i].y = bg.x + 100 * i, bg.y
	end

	b3Group.x = b3Group.x - 690
	b3Group.y = b3Group.y + 210

	local b4 = { }
	local b4Group = display.newGroup()

	for i = 1, 2 do
		b4[i] = display.newImageRect(b4Group, "image/rainbow/5-3.png", 100, 100) 
		b4[i].x, b4[i].y = bg.x, bg.y * i * 0.278
	end

	b4Group.x = b4Group.x + 10
	b4Group.y = b4Group.y + 470

	local b5 = { }
	local b5Group = display.newGroup()

	for i = 1, 6 do
		b5[i] = display.newImageRect(b5Group,"image/rainbow/5-4.png", 100, 100) 
		b5[i].x, b5[i].y = bg.x + 100 * i, bg.y
	end

	b5Group.x = b5Group.x - 690
	b5Group.y = b5Group.y + 310

	-- 호수 --
	local b6 = { }
	local b6Group = display.newGroup()

	for i = 1, 13  do
		b6[i] = display.newImageRect(b6Group,"image/rainbow/5-5.png", 100, 100) 
		b6[i].x, b6[i].y = bg.x + 100 * i, bg.y
	end

	b6Group.x = b6Group.x - 690
	b6Group.y = b6Group.y + 210

	local b7 = { }
	local b7Group = display.newGroup()

	for i = 1, 13  do
		b7[i] = display.newImageRect(b7Group,"image/rainbow/5-6.png", 100, 100) 
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

	-- 네로 대화모습 --
	local nero2 = display.newImageRect("image/char/nero_default.png", 400, 440)
	nero2.x, nero2.y = display.contentWidth * 0.75, display.contentHeight * 0.33
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	-- 앵무 대화모습 --
	local bird = display.newImageRect("image/char/bird_default.png", 556*0.35, 630*0.35)
	bird.x, bird.y = display.contentWidth * 0.2, display.contentHeight * 0.5
	sceneGroup:insert(bird)
	bird.alpha = 0

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text1.x, text1.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text1.png", 1150, 340)
	text2.x, text2.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text2)
	text2.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	local name2 = display.newText("앵무", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name2)
	name2.alpha = 0


	-- 텍스트 수정 필요 --

	local text = { }
		text[1] = display.newText("빛이 모두 돌아왔어!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[2] = display.newText("다행이다. 같이 여행하느라 고생 많았어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[3] = display.newText("이 모든 건 나 때문이야. 사실 나는 볼품없는 비둘기였어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[4] = display.newText("아름다운 색을 갖고 싶었는데.. 내 소원으로 인해 빛이 모두 사라져버렸어..", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[5] = display.newText("괜찮아. 다시 되돌려 놓으려고 노력했잖아.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[6] = display.newText("그리고 빛도 모두 되찾았는걸!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[7] = display.newText("고마워. 너와 여행을 다니면서 많은 생각을 했어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[8] = display.newText("비둘기의 모습일 때도 나를 좋아해 주던 친구들이 있었는데", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[9] = display.newText("정작 나는 내 모습을 사랑하지 못했나 봐.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[10] = display.newText("이제 내 겉모습은 중요하지 않다는 것을 깨달았어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[11] = display.newText("고마워. 이제 돌아가서 푹 쉬자!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[12] = display.newText(" ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)

		text[1]:setFillColor(0)
	text[1].alpha = 0

	for i = 2, 12 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	transition.fadeIn( nero2, { delay = 3000,time = 1000 } )
	transition.fadeIn( bird, { delay = 3000,time = 1000 } )
	transition.fadeIn( name2, { delay = 3000,time = 1000 } )
	transition.fadeIn( text2, { delay = 3000,effect = "fade", time = 1000 } )
	transition.fadeIn( text[1], { delay = 3000,time = 1000 } )	
	
	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 네로 대사 --
		if j == 2 or j == 5 then
			name2.alpha = 0
			name.alpha = 1
			text2.alpha = 0
			text1.alpha = 0.8
		end
		-- 앵무 대사 --
		if j == 3 or j == 7 then
			name.alpha = 0
			name2.alpha = 1
			text1.alpha = 0
			text2.alpha = 1
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 12 then
			composer.gotoScene("map0_9", { effect = "fade", time = 900 })
		end

		if j < 12 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)	
	text2:addEventListener("tap", nextText)


	-- 방향키 입력시 움직이는 이벤트리스너
	function move( event )
		if (nero.x <= display.contentWidth*0.1) then
			-- 인어공주 맵으로 이동 --
			Runtime:removeEventListener("key", move)
			composer.gotoScene("map3_1", { effect = "fade", time = 900 })
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
		composer.removeScene("map0_8")
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