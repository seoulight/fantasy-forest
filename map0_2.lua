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
	nero.x, nero.y = 150, display.contentHeight * 0.5
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

	-- 네로 대화모습 --
	local nero2 = display.newImageRect("image/char/nero_default2.png", 400, 440)
	nero2.x, nero2.y = display.contentWidth * 0.2, display.contentHeight * 0.3
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	-- 앵무 대화모습 --
	local bird = display.newImageRect("image/char/bird_default2.png", 556*0.35, 630*0.35)
	bird.x, bird.y = display.contentWidth * 0.75, display.contentHeight * 0.58
	sceneGroup:insert(bird)
	bird.alpha = 0

	--물에 빠진 앵무 --
	local bird2 = display.newImageRect("image/char/bird_default2.png", 556*0.15, 630*0.15)
	bird2.x, bird2.y = display.contentWidth * 0.75, display.contentHeight * 0.72
	sceneGroup:insert(bird2)
	bird2.alpha = 1

	-- 땅에 올라온 앵무 --
	local bird3 = display.newImageRect("image/char/bird_default2.png", 556*0.15, 630*0.15)
	bird3.x, bird3.y = display.contentWidth * 0.4, display.contentHeight * 0.55
	sceneGroup:insert(bird3)
	bird3.alpha = 0

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

	-- 검은 화면 --
	local item_bg = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.5, 1280, 720)
	item_bg:setFillColor(0)
	sceneGroup:insert(item_bg)
	item_bg.alpha = 0

	local text = { }
		text[1] = display.newText("살려줘! 어푸.....살려!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[2] = display.newText("앗! 새가 호수에 빠져서 나오지 못하고 있나봐! 내가 구해줄 방법이 없을까?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[3] = display.newText("나뭇가지를 새에게 던져서 붙잡게 하고 내가 당겨주면 되겠다!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[4] = display.newText("살아 있나..?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[5] = display.newText(".......푸하!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[6] = display.newText("우왓! 다행이다. 깨어났어! 작은 새야, 정신이 좀 드니?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[7] = display.newText("여긴, 어디..?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[8] = display.newText("무지개 호수야. 하마터면 물에 빠져서 아주 큰일이 날뻔했어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[9] = display.newText("어디 다친 데는 없지?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[10] = display.newText("무, 물론이지! 겨우 이런 일로는 끄떡도 없어!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[11] = display.newText("...구해줘서 고마워.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[12] = display.newText("다행이다. 그런데 왜 물가에 빠지게 된 거야?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[13] = display.newText("그게..... 어?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[14] = display.newText("왜 세상이 하얗게 변해버린 거지?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[15] = display.newText("왜 이렇게 된 거냐면......", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[16] = display.newText("그래서 내가 요정님의 부탁을 받고 숲이 일어버린 빛을 찾으러 가는 중이야.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[17] = display.newText("그렇구나...", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[18] = display.newText("그렇다면, 나를 구해준 보답으로 함께 가주도록 할게!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[19] = display.newText("이래 봬도 나는 호수의 축복을 받은 아주 특별한 앵무새거든!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[20] = display.newText("와아, 정말 멋있다! 네가 도와준다면 분명 숲을 원래대로 바꿀 수 있을 거야!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[21] = display.newText("그러면 우리는 친구인 거지? 내 이름은 네로야. 잘 부탁해!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[22] = display.newText("나는..... 앵무! 앵무라고 부르도록 해!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[23] = display.newText("그런데, 빛을 찾으려면 어디로 가야 할지 모르겠어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[24] = display.newText("요정님께서 내 붓과 팔레트에만 마법을 걸어주고 가셨거든.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[25] = display.newText("음음, 그건 나한테 맡겨!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[26] = display.newText("일단 어디 보자…… 저쪽이다! 동쪽으로 가면 빨간빛을 찾을 수 있을 거야.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[27] = display.newText("우와, 어떻게 알았어? 축복의 힘이 알려주는구나? 대단하다!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[28] = display.newText("그, 그래 맞아! 그거야! 자 어서 서두르자. 출발!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[29] = display.newText("출발!", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
		text[30] = display.newText(" ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)
	text[1].alpha = 0

	for i = 2, 30 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	--transition.fadeIn( nero2, { delay = 3000,time = 1000 } )
	transition.fadeIn( bird, { delay = 0000,time = 1000 } )
	transition.fadeIn( name2, { delay = 0000,time = 1000 } )
	transition.fadeIn( text2, { delay = 0000,effect = "fade", time = 1000 } )
	transition.fadeIn( text[1], { delay = 0000,time = 1000 } )	
	
	-- 탭 하면 다음 text --
	local j = 2
	local k = 0
	local function nextText()
		if j==2 then
			nero2.alpha = 1
			bird.alpha = 0
		end

		if j==15 then
			--화면 까맣 --
			text1:removeEventListener("tap", nextText)
			transition.fadeIn(item_bg, { delay = 600, time = 700 })
			transition.fadeOut(item_bg, { delay = 1600, time = 700 })
			transition.to(text[15], { delay = 800, alpha = 0 })
			text1:addEventListener("tap", nextText)	
		end

		if j==4 then 
			bird2.alpha = 0
			bird3.alpha = 1
		end

		if j==5 then 
			bird.alpha = 1
		end

		-- 네로 대사 --
		if j==2 or j==6 or j==8 or j==12 or j==15 or j==20 or j==23 or j==27 or j==29 then
			name2.alpha = 0
			name.alpha = 1
			text2.alpha = 0
			text1.alpha = 0.8
		end
		-- 앵무 대사 --
		if j==5 or j==7 or j==10 or j==13 or j==17 or j==22 or j==25 or j==28 then
			name.alpha = 0
			name2.alpha = 1
			text1.alpha = 0
			text2.alpha = 1
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 30 then
			composer.gotoScene("map1_0", { effect = "fade", time = 900 })
		end

		if j < 30 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)	
	text2:addEventListener("tap", nextText)


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