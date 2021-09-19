-----------------------------------------------------------------------------------------
--
-- map3_5.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5
	
	local bg = display.newImageRect("image/image2/4-1.png", 1280, 720)
	bg.x, bg.y = cx, cy
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
	nero.x, nero.y = 80, display.contentHeight * 0.7
	
	sceneGroup:insert(nero)

	local bird = display.newImageRect("image/char/bird_default.png", 556*0.25, 630*0.25)
	bird.x, bird.y = display.contentWidth * 0.285, display.contentHeight * 0.51
	sceneGroup:insert(bird)
	bird.alpha = 0

	-- 언니 인어 --
	local m1 = display.newImageRect("image/image2/m1_smile.png", 577 * 0.35, 856 * 0.35)
	m1.x, m1.y = display.contentWidth * 0.65, display.contentHeight * 0.7
	sceneGroup:insert(m1)
	m1.alpha = 0

	local m2 = display.newImageRect("image/image2/m1_sorry.png", 577 * 0.35, 856 * 0.35)
	m2.x, m2.y = display.contentWidth * 0.58, display.contentHeight * 0.7
	sceneGroup:insert(m2)
	m2.alpha = 0

	local m3 = display.newImageRect("image/image2/m1_upset.png", 577 * 0.35, 856 * 0.35)
	m3.x, m3.y = display.contentWidth * 0.31, display.contentHeight * 0.7
	sceneGroup:insert(m3)

	-- 막내 인어 --
	local m4 = display.newImageRect("image/image2/m2.png", 483 * 0.35, 856 * 0.35)
	m4.x, m4.y = display.contentWidth * 0.78, display.contentHeight * 0.7
	sceneGroup:insert(m4)

	local m5 = display.newImageRect("image/image2/m2_smile.png", 483 * 0.35, 856 * 0.35)
	m5.x, m5.y = display.contentWidth * 0.78, display.contentHeight * 0.7
	sceneGroup:insert(m5)
	m5.alpha = 0

	local m6 = display.newImageRect("image/image2/m2_upset.png", 483 * 0.35, 856 * 0.35)
	m6.x, m6.y = display.contentWidth * 0.78, display.contentHeight * 0.7
	sceneGroup:insert(m6)
	m6.alpha = 0

	local w1 = display.newImageRect("image/image2/witch.png", 664 * 0.35, 1080 * 0.35)
	w1.x, w1.y = display.contentWidth * 0.9, display.contentHeight * 0.7
	sceneGroup:insert(w1)

	local w2 = display.newImageRect("image/image2/witch_smile.png", 664 * 0.35, 1080 * 0.35)
	w2.x, w2.y = display.contentWidth * 0.9, display.contentHeight * 0.7
	sceneGroup:insert(w2)
	w2.alpha = 0

	-- 캐릭터 대화버전 --
	local nero2 = display.newImageRect("image/char/nero_default2.png", 360, 400)
	nero2.x, nero2.y = display.contentWidth * 0.18, display.contentHeight * 0.32
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	local bird = display.newImageRect("image/char/bird_default.png", 556*0.25, 630*0.25)
	bird.x, bird.y = display.contentWidth * 0.285, display.contentHeight * 0.51
	--sceneGroup:insert(bird)
	bird.alpha = 0

	local m11 = display.newImageRect("image/image2/m1_smile.png", 577 * 0.7, 856 * 0.7)
	m11.x, m11.y = display.contentWidth * 0.38, display.contentHeight * 0.5
	sceneGroup:insert(m11)
	m11.alpha = 0

	local m22 = display.newImageRect("image/image2/m1_sorry.png", 577 * 0.7, 856 * 0.7)
	m22.x, m22.y = display.contentWidth * 0.38, display.contentHeight * 0.5
	sceneGroup:insert(m22)
	m22.alpha = 0

	local m33 = display.newImageRect("image/image2/m1_upset.png", 577 * 0.7, 856 * 0.7)
	m33.x, m33.y = display.contentWidth * 0.38, display.contentHeight * 0.5
	sceneGroup:insert(m33)
	m33.alpha = 0
	sceneGroup:insert(bird)

	-- 막내 인어 --
	local m44 = display.newImageRect("image/image2/m2.png", 483 * 0.7, 856 * 0.7)
	m44.x, m44.y = display.contentWidth * 0.63, display.contentHeight * 0.5
	sceneGroup:insert(m44)
	m44.alpha = 0

	local m55 = display.newImageRect("image/image2/m2_smile.png", 483 * 0.7, 856 * 0.7)
	m55.x, m55.y = display.contentWidth * 0.63, display.contentHeight * 0.5
	sceneGroup:insert(m55)
	m55.alpha = 0

	local m66 = display.newImageRect("image/image2/m2_upset.png", 483 * 0.7, 856 * 0.7)
	m66.x, m66.y = display.contentWidth * 0.63, display.contentHeight * 0.5
	sceneGroup:insert(m66)
	m66.alpha = 0

	local w11 = display.newImageRect("image/image2/witch.png", 664 * 0.7, 1080 * 0.7)
	w11.x, w11.y = display.contentWidth * 0.82, display.contentHeight * 0.5
	sceneGroup:insert(w11)
	w11.alpha = 0

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text3.png", 1135, 330)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.735
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text_nero.png", 1145, 332)
	text2.x, text2.y = display.contentWidth * 0.5, display.contentHeight * 0.745
	sceneGroup:insert(text2)
	text2.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("언니인어", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	local name2 = display.newText("막내인어", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name2)
	name2.alpha = 0

	local name3 = display.newText("바다 마녀", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name3)
	name3.alpha = 0

	local neroName = display.newText("네로", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("안돼!!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("(약병 깨트림)", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("여기는 어떻게 왔어! 그게 뭔 줄 알고 깨뜨린 건데. 왜 자꾸 나를 성가시게 하는 거야!!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("네가 집에 없으니까 힘들게 찾아서 여기까지 왔어. ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("너야말로 이곳을 대체 무슨 생각으로 찾아온 거야. 왜 자꾸 멋대로 행동하는 거야!!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("정작 내가 알고 싶어 하는 건 조금도 말해주지 않잖아!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("바깥은 네 마음을 현혹하는 것이 많은 만큼 아주 위험하다고!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[8] = display.newText("둘 다 진정하는 게 좋겠어. ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[9] = display.newText("그래. 언니에게 차분히 이야기해봐.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[10] = display.newText("네. 제가 너무 흥분했나 봐요.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[11] = display.newText("요즘 궁 안이 어수선한데 나만 그 이유를 모르고 눈치 없이 군 것 같아서 불안했어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[12] = display.newText("아빠는 이상한 것에 관심 좀 가지지 말라고 하고, 언니들은 바깥에 나가지 말라고 하고.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[13] = display.newText("잔소리를 하는데 이유를 물어봐도 제대로 대답해주지 않으니 답답했어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[14] = display.newText("가족들이 그러는 이유가 알고 싶어서 어떻게든 궁을 빠져나와 바다 마녀를 만난 거야. ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[15] = display.newText("언니가 깨뜨린 물약은 마녀님이 나를 도와주기 위해 만들어주신 거란 말이야.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[16] = display.newText("그랬구나. 네가 그렇게 생각하고 있는 줄 몰랐어. 미안해.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[17] = display.newText("인어공주가 물거품이 되어 사라졌어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[18] = display.newText("이미 떠난 언니의 이야기를 하지 않는 게 너한테 좋을 것 같아서 말하지 않았던 거야.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[19] = display.newText("네 이야기를 들어보니 이런 내 생각이 잘못되었다는 것을 깨달았어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[20] = display.newText("정말 미안해.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[21] = display.newText("괜찮아. 말해줘서 고마워. 이제 궁금한 게 풀렸어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[22] = display.newText("", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	for i = 2, 21 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end
	
	local function talk()
		transition.to( m3, { x = display.contentWidth * 0.65, time = 900 } )
		transition.fadeIn( text[1], { delay = 2000, time = 900 } )
		transition.to( text1, { delay = 2000, alpha = 0.8, time = 900 } )
		transition.fadeIn( name, { delay = 2000, time = 900 } )
		transition.fadeIn( nero2, { delay = 2000, time = 900 } )
		transition.fadeIn( bird, { delay = 2000, time = 900 } )
		transition.fadeIn( m33, { delay = 2000, time = 900 } )
		transition.fadeIn( m44, { delay = 2000, time = 900 } )
		transition.fadeIn( w11, { delay = 2000, time = 900 } )
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 언니인어 대사 --
		if j==2 or j==4 or j==5 or j==7 or j==16 or j==17 or j==18 or j==19 or j==20 then
			name.alpha = 1
			name2.alpha = 0
			name3.alpha = 0
			neroName.alpha = 0
			text1.alpha = 0.8
			text2.alpha = 0
		-- 네로 대사 --
		elseif j == 8 then
			name.alpha = 0
			name2.alpha = 0
			name3.alpha = 0
			neroName.alpha = 1
			text1.alpha = 0
			text2.alpha = 0.8
		-- 마녀 대사 --
		elseif j == 9 then
			name.alpha = 0
			name2.alpha = 0
			name3.alpha = 1
			neroName.alpha = 0
			text1.alpha = 0.8
			text2.alpha = 0
		-- 막내인어 대사 --
		else
			name.alpha = 0
			name2.alpha = 1
			name3.alpha = 0
			neroName.alpha = 0
			text1.alpha = 0.8
			text2.alpha = 0
		end

		if j == 3 then
			m44.alpha = 0
			m66.alpha = 1
		end

		if j == 10 then
			m66.alpha = 0
			m44.alpha = 1
		end

		if j == 16 then
			m33.alpha = 0
			m22.alpha = 1
		end

		if j == 21 then
			m44.alpha = 0
			m55.alpha = 1
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 22 then
			name2.alpha = 0
			text1.alpha = 0
			text1:removeEventListener("tap", nextText)
			text2:removeEventListener("tap", nextText)
			composer.gotoScene("map3_6", { effect = "fade", time = 900 })
		end

		if j < 22 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)
	text2:addEventListener("tap", nextText)

	-- 방향키 입력시 움직이는 이벤트리스너
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 280) then
					transition.moveBy(nero, { x = 280 - nero.x, time = (280 - nero.x) * 7 })
				else
					transition.moveBy(nero, { x = 1280 - nero.x, time = (1280 - nero.x) * 7 })
				end							
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.moveBy(nero, {x = -nero.x, time = nero.x * 7})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.x == 280) then
				Runtime:removeEventListener("key", move)
				talk()
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
		composer.removeScene("map3_5")
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