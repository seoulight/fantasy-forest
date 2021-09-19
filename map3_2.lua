-----------------------------------------------------------------------------------------
--
-- map3_2.lua
-- 
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5

	local layer_img = {"image/image2/2-5.png", "image/image2/2-4.png", "image/image2/2-3.png", "image/image2/2-2.png",
	"image/image2/2-1.png"}
	local layer = {}

	for i = 1, 5 do
		layer[i] = display.newImageRect(layer_img[i], 1280, 720)
		layer[i].x, layer[i].y = cx, cy
		sceneGroup:insert(layer[i])
	end
	
	sceneGroup:insert(1, layer[2])
	sceneGroup:insert(1, layer[1])

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
	nero.x, nero.y = 80, display.contentHeight * 0.75
	
	sceneGroup:insert(nero)

	local m1 = display.newImageRect("image/image2/m1_smile.png", 223 * 0.9, 342 * 0.9)
	m1.x, m1.y = display.contentWidth * 0.58, display.contentHeight * 0.7
	sceneGroup:insert(m1)

	-- 캐릭터 대화버전 --
	local nero2 = display.newImageRect("image/char/nero_default2.png", 360, 400)
	nero2.x, nero2.y = display.contentWidth * 0.18, display.contentHeight * 0.32
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	local bird = display.newImageRect("image/char/bird_default.png", 556*0.25, 630*0.25)
	bird.x, bird.y = display.contentWidth * 0.285, display.contentHeight * 0.51
	sceneGroup:insert(bird)
	bird.alpha = 0

	local m2 = display.newImageRect("image/image2/m1_smile.png", 450, 680)
	m2.x, m2.y = display.contentWidth * 0.75, display.contentHeight * 0.53
	sceneGroup:insert(m2)
	m2.alpha = 0

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text3.png", 1135, 330)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.735
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text_nero.png", 1145, 332)
	text2.x, text2.y = display.contentWidth * 0.5, display.contentHeight * 0.745
	sceneGroup:insert(text2)
	text2.alpha = 0

	local text3 = display.newImageRect("image/char/text1.png", 1125, 360)
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text3)
	text3.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("언니인어", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	local bName = display.newText("앵무", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(bName)
	bName.alpha = 0

	local neroName = display.newText("네로", 282, 430, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("이 망망대해에서 어린 인어를 어떻게 찾지? ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("무작정 찾지 말고 단서를 찾아 추리해보자.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("좋아. 막내 인어에 대해 아는 게 있어?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("어린데도 헤엄치는 것이 유독 빨라서 멀리까지 갔을지도 몰라.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("이곳저곳 돌아다니며 이상한 것을 주워오거나 눈독 들이는 때가 잦아.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("물건 흘리기는 또 잘 흘리고 다닌단 말이야.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("집 안에 온갖 괴상한 물건들의 끝에는 늘 막내가 있었어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[8] = display.newText("실은 어젯밤에 막내를 심하게 혼냈는데 아침에 일어나보니 막내가 없어졌어.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[9] = display.newText("나에게 화가 나서 가출을 한 걸까?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[10] = display.newText("음, 우선 주변에 막내가 관심을 가질만한 물건이 떨어져 있는지 살펴보고 자취를 쫓아가자.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
	text[11] = display.newText("", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	for i = 2, 11 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local function talk()
		transition.fadeIn( text[1], { time = 900 } )
		transition.to( text2, { alpha = 0.8, time = 900 } )
		transition.fadeIn( neroName, { time = 900 } )
		transition.fadeIn( nero2, { time = 900 } )
		transition.fadeIn( bird, { time = 900 } )
		transition.fadeIn( m2, { time = 900 } )
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 앵무 대사 --
		if j == 2 or j == 10 then
			name.alpha = 0
			neroName.alpha = 0
			bName.alpha = 1
			text1.alpha = 0
			text2.alpha = 0
			text3.alpha = 1
		-- 네로 대사 --
		elseif j == 3 then
			bName.alpha = 0
			neroName.alpha = 1
			text2.alpha = 0.8
			text3.alpha = 0
		-- 인어 대사 --
		else
			bName.alpha = 0
			neroName.alpha = 0
			name.alpha = 1
			text1.alpha = 0.8
			text2.alpha = 0
			text3.alpha = 0
		end


		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 11 then
			bName.alpha = 0
			neroName.alpha = 0
			name.alpha = 0
			text1.alpha = 0
			text2.alpha = 0
			text3.alpha = 0
			text1:removeEventListener("tap", nextText)
			text2:removeEventListener("tap", nextText)
			text3:removeEventListener("tap", nextText)
			composer.gotoScene("game4_findItems", { effect = "fade", time = 900 })
		end

		if j < 11 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)
	text2:addEventListener("tap", nextText)
	text3:addEventListener("tap", nextText)


	-- 방향키 입력시 움직이는 이벤트리스너
	local function move2( event )	
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 500) then
					transition.moveBy(nero, { x = 500 - nero.x, time = (500 - nero.x) * 7 })
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
			if (nero.x == 500) then
				Runtime:removeEventListener("key", move2)
				talk()
			end	
		end
	end

	Runtime:addEventListener("key", move2)
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
		composer.removeScene("map3_2")
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