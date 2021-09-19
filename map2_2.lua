-----------------------------------------------------------------------------------------
--
-- map2_2.lua
-- 울창한 숲속(게임 성공 후 장면)
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image3/1-1.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5

	local bg2 = display.newImageRect("image/image3/1-2.png", 1280, 720)
	bg2.x, bg2.y = display.contentWidth*0.5, display.contentHeight*0.5

	-- 캐릭터 --
	local c1 = display.newImageRect("image/image3/child1.png", 439*0.36, 761*0.36)
	c1.x, c1.y = display.contentWidth*0.735, display.contentHeight*0.69

	local c2 = display.newImageRect("image/image3/child2.png", 308*0.38, 679*0.38)
	c2.x, c2.y = display.contentWidth*0.815, display.contentHeight*0.69

	local c3 = display.newImageRect("image/image3/child3.png", 335*0.36, 793*0.36)
	c3.x, c3.y = display.contentWidth*0.89, display.contentHeight*0.68

	local p1 = display.newImageRect("image/image3/peter1.png", 609*0.33, 1080*0.33)
	p1.x, p1.y = display.contentWidth*1.2, display.contentHeight*0.1
	transition.to( p1, { x = display.contentWidth*0.6, y = display.contentWidth*0.325, time = 2500 } )

	local p2 = display.newImageRect("image/image3/peter2.png", 609*0.33, 1080*0.33)
	p2.x, p2.y = display.contentWidth*0.6, display.contentHeight*0.58
	p2.alpha = 0

	-- 네로 움직이는 모습 --
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
	nero.x, nero.y = 420, display.contentHeight * 0.7
	sceneGroup:insert(bg2)
	sceneGroup:insert(bg)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	--sceneGroup:insert(bg)
	sceneGroup:insert(p1)
	sceneGroup:insert(p2)
	sceneGroup:insert(nero)

	-- 캐릭터 대화버전 --
	local nero2 = display.newImageRect("image/char/nero_default2.png", 460*0.7, 499*0.7)
	nero2.x, nero2.y = display.contentWidth * 0.18, display.contentHeight * 0.32
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	local bird = display.newImageRect("image/char/bird_default.png", 556*0.25, 630*0.25)
	bird.x, bird.y = display.contentWidth * 0.285, display.contentHeight * 0.51
	sceneGroup:insert(bird)
	bird.alpha = 0

	local c11 = display.newImageRect("image/image3/child1.png", 439*0.73, 761*0.73)
	c11.x, c11.y = display.contentWidth*0.674, display.contentHeight*0.607
	sceneGroup:insert(c11)
	c11.alpha = 0

	local c22 = display.newImageRect("image/image3/child2.png", 308*0.75, 679*0.75)
	c22.x, c22.y = display.contentWidth*0.77, display.contentHeight*0.6
	sceneGroup:insert(c22)
	c22.alpha = 0

	local c33 = display.newImageRect("image/image3/child3.png", 335*0.73, 793*0.73)
	c33.x, c33.y = display.contentWidth*0.89, display.contentHeight*0.6
	sceneGroup:insert(c33)
	c33.alpha = 0

	local p11 = display.newImageRect("image/image3/peter1.png", 609*0.73, 1080*0.73)
	p11.x, p11.y = display.contentWidth*0.46, display.contentHeight*0.55
	sceneGroup:insert(p11)
	p11.alpha = 0

	local p22 = display.newImageRect("image/image3/peter2.png", 609*0.73, 1080*0.73)
	p22.x, p22.y = display.contentWidth*0.46, display.contentHeight*0.55
	sceneGroup:insert(p22)
	p22.alpha = 0
	
	-- 대화창 --
	local text1 = display.newImageRect("image/char/text2.png", 1168, 305)
	text1.x, text1.y = display.contentWidth * 0.499, display.contentHeight * 0.74
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text2.x, text2.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	sceneGroup:insert(text2)
	text2.alpha = 0

	local text3 = display.newImageRect("image/char/text1.png", 1150, 340)
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text3)
	text3.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("아이들", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	local pName = display.newText("피터 팬", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(pName)
	pName.alpha = 0

	local bName = display.newText("앵무", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(bName)
	bName.alpha = 0

	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("무슨 일이야??", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("어른이 우리 땅에 함부로 침입했어.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("너희와 이곳을 해칠 생각으로 들어온 게 아니야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("그럼 왜 이곳에 들어왔는데?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("환상의 숲에 사라진 빛을 찾아서 왔어.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("그건 너희 어른들이 숲을 망쳐놨기 때문에 그런 거 아니야?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("나도 아직 어른이 아니야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[8] = display.newText("왜 숲에 빛이 사라졌는지 모르겠지만 우리는 숲을 구하기 위해 여행을 다니고 있어.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[9] = display.newText("원더랜드라는 곳에서 빨간빛을 되찾고 이제 초록빛을 찾기 위해 네버랜드로 온 거야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[10] = display.newText("우리도 여행에 함께 갈래.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[11] = display.newText("안돼. 위험해.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[12] = display.newText("우리가 도움을 받으면 좋을 것 같아. 게다가 아이들은 이곳에 대해 잘 알고 있으니 괜찮을 거야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[13] = display.newText("오예!!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[14] = display.newText("그렇게 저 이방인이 좋다면 나 말고 이방인을 따르든지!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[15] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[16] = display.newText("그래서 초록빛을 찾으려면 어디로 가야 하는데?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[17] = display.newText("초록빛이 아주 가까이 있었다가 방금 전 조금 멀어졌어.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[18] = display.newText("그 빛이 피터 팬인 것 같아.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[19] = display.newText("그럼 피터 팬을 찾아야 하는 거야?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[20] = display.newText("뭐야, 모험이 아니잖아. 시시해.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[21] = display.newText("그런데 피터가 화가 나서 우리에게 안 돌아오면 어떡하지? 큰일 났다!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[22] = display.newText("피터 팬의 마음을 돌리려면 그가 좋아할 만한 것을 선물로 바쳐야 해.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[23] = display.newText("함께 요정의 나무로 가보자. 요정들이 도와줄 거야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[24] = display.newText("", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)



	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	for i = 2, 24 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local flag = 0
	local function talk()
		if flag == 0 then
			p1.alpha = 0.8
			transition.fadeIn( text[1], { time = 900 } )
			transition.to( text1, { alpha = 0.96, time = 900 } )
			transition.fadeIn( pName, { time = 900 } )
			transition.fadeIn( nero2, { time = 900 } )
			transition.fadeIn( bird, { time = 900 } )
			transition.fadeIn( c11, { time = 900 } )
			transition.fadeIn( c22, { time = 900 } )
			transition.fadeIn( c33, { time = 900 } )
			transition.fadeIn( p11, { time = 900 } )
		end
	end

	p1:addEventListener("tap", talk)

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		flag = 1
		-- 앵무 대사 --
		if j == 11 or j == 17 or j == 18 then
			name.alpha = 0
			pName.alpha = 0
			bName.alpha = 1
			neroName.alpha = 0
			text1.alpha = 0
			text2.alpha = 0
			text3.alpha = 1
		-- 네로 대사 --
		elseif j == 3 or j == 5 or j ==7 or j == 8 or j == 9 or j == 12 then
			name.alpha = 0
			pName.alpha = 0
			bName.alpha = 0
			neroName.alpha = 1
			text1.alpha = 0
			text2.alpha = 0.8
			text3.alpha = 0
		else 
			text1.alpha = 0.96
			text2.alpha = 0
			text3.alpha = 0
			bName.alpha = 0
			neroName.alpha = 0
			-- 피터팬 대사 --
			if j == 1 or j == 4 or j == 14 then
				name.alpha = 0
				pName.alpha = 1
			-- 아이들 대사 --
			else
				name.alpha = 1
				pName.alpha = 0
			end
		end

		if j == 2 then
			text[1].alpha = 0
		end

		-- 피터팬 언짢은 표정 --
		if j == 13 then
			p1.alpha = 0
			p2.alpha = 0.8
			p11.alpha = 0
			p22.alpha = 1
		end

		-- 피터팬 사라짐 --
		if j == 15 then
			name.alpha = 0
			transition.fadeOut( p2, { time = 900 } )
			transition.fadeOut( p22, { time = 900 } )
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 24 then
			text1.alpha = 0
			name.alpha = 0
			text1:removeEventListener("tap", nextText)
			text2:removeEventListener("tap", nextText)
			text3:removeEventListener("tap", nextText)
			composer.gotoScene("map2_3", { effect = "fade", time = 900 })
		end

		if j < 24 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)
	text2:addEventListener("tap", nextText)
	text3:addEventListener("tap", nextText)

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
		composer.removeScene("map2_2")
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