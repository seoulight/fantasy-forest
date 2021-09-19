-----------------------------------------------------------------------------------------
--
-- map2_5.lua
-- 요정 나무(요정2 f3_날개가 아름다운 요정)
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	print("hint2")
	local bg = display.newImageRect("image/image3/2.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5

	-- 캐릭터 --
	local c1 = display.newImageRect("image/image3/child1.png", 439*0.36, 761*0.36)
	c1.x, c1.y = display.contentWidth*0.06, display.contentHeight*0.69

	local c2 = display.newImageRect("image/image3/child2.png", 308*0.38, 679*0.38)
	c2.x, c2.y = display.contentWidth*0.12, display.contentHeight*0.69

	local c3 = display.newImageRect("image/image3/child3.png", 335*0.36, 793*0.36)
	c3.x, c3.y = display.contentWidth*0.19, display.contentHeight*0.68

	-- 자는 요정 --
	local f1 = display.newImageRect("image/image3/fairy1.png", 271*0.4, 269*0.4)
	f1.x, f1.y = display.contentWidth*0.365, display.contentHeight*0.45

	-- 활발한 요정 --
	local f2 = display.newImageRect("image/image3/fairy4.png", 241*0.4, 326*0.4)
	f2.x, f2.y = display.contentWidth*0.5, display.contentHeight*0.5

	-- 날개 파란 요정 --
	local f3 = display.newImageRect("image/image3/fairy3.png", 223*0.4, 299*0.4)
	f3.x, f3.y = display.contentWidth*0.57, display.contentHeight*0.75

	-- 꽃 요정 --
	local f4 = display.newImageRect("image/image3/fairy2.png", 285*0.4, 281*0.4)
	f4.x, f4.y = display.contentWidth*0.95, display.contentHeight*0.6

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
	nero.x, nero.y = 500, display.contentHeight * 0.7

	sceneGroup:insert(bg)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	sceneGroup:insert(f1)
	sceneGroup:insert(f2)
	sceneGroup:insert(f3)
	sceneGroup:insert(f4)
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

	-- 날개 파란 요정 --
	local f33 = display.newImageRect("image/image3/fairy3.png", 223*0.8, 299*0.8)
	f33.x, f33.y = display.contentWidth*0.74, display.contentHeight*0.3
	sceneGroup:insert(f33)
	f33.alpha = 0

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text2.png", 1168, 305)
	text1.x, text1.y = display.contentWidth * 0.499, display.contentHeight * 0.74
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text2.x, text2.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	sceneGroup:insert(text2)
	text2.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("아이들", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	local name2 = display.newText("요정", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name2)
	name2.alpha = 0

	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	local choice1 = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.72, 900, 50)
	sceneGroup:insert(choice1)
	choice1:setFillColor(0)
	choice1.alpha = 0

	local choice2 = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.82, 900, 50)
	sceneGroup:insert(choice2)
	choice2:setFillColor(0)
	choice2.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("그 아이는 나는 것을 좋아해. 이곳에서 누가 빨리 나는지 가끔 시합도 하거든.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("날개도 없는데도 가볍게 나는 게 정말 신기하단 말이야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("1. 날개가 무거우면 떼어드릴까요?\n\n2. 요정님 날개에서는 눈을 뗄 수가 없네요. 어떻게 그렇게 반짝거리는 거죠?", text1.x, text1.y + 25, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("뭐라고?? 넌 나에게 모욕감을 줬어.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("너, 보는 눈이 있구나? 내 날개는 빛이 나. 요정 중에서 가장 아름답지.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	for i = 2, 7 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local k = 0
	local function hint2()
		if k == 0 then
			transition.fadeIn( text[1], { time = 900 } )
			transition.to( text1, { alpha = 0.96, time = 900 } )
			transition.fadeIn( name2, { time = 900 } )
			transition.fadeIn( nero2, { time = 900 } )
			transition.fadeIn( f33, { time = 900 } )
			
		end
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		k = 1
		if j == 3 then
			name2.alpha = 0
			neroName.alpha = 1
			text1.alpha = 0
			text2.alpha = 0.8
			choice1.alpha = 0.25
			choice2.alpha = 0.25

			text1:removeEventListener("tap", nextText)
			text2:removeEventListener("tap", nextText)

			-- 성공 --
			local function success()
				j = j + 2
				text1:addEventListener("tap", nextText)
				text2:addEventListener("tap", nextText)
			end
			choice2:addEventListener("tap", success)

			-- 실패 --
			local function fail()
				text1:addEventListener("tap", nextText)
				text2:addEventListener("tap", nextText)
			end
			choice1:addEventListener("tap", fail)
		end

		if j == 4 then
			name2.alpha = 1
			neroName.alpha = 0
			text1.alpha = 1
			text2.alpha = 0
			text[3].alpha = 0
			choice1.alpha = 0
			choice2.alpha = 0
		end

		-- 실패 -> 재도전 --
		if j == 5  then
			text1:removeEventListener("tap", nextText)
			text2:removeEventListener("tap", nextText)
			scene:create()
		end

		if j == 6 then
			name2.alpha = 1
			neroName.alpha = 0
			text1.alpha = 1
			text2.alpha = 0
			text[3].alpha = 0
			choice1.alpha = 0
			choice2.alpha = 0
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		-- 성공 -> 다음 씬으로 --
		if j == 7 then
			transition.fadeOut( text1, { time = 900 } )
			transition.fadeOut( name2, { time = 900 } )
			transition.fadeOut( nero2, { time = 900 } )
			transition.fadeOut( f33, { time = 900 } )
			
			text1:removeEventListener("tap", nextText)
			text2:removeEventListener("tap", nextText)
			
			local function listener( event )
				composer.gotoScene("map2_6")
			end

			timer.performWithDelay( 1000, listener, 1)
		end

		if j < 7 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)
	text2:addEventListener("tap", nextText)

	local flag = 0
	---- 방향키 입력시 움직이는 이벤트리스너 --
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 600) then
					transition.moveBy(nero, { x = 600 - nero.x, time = (600 - nero.x) * 7 })
				else
					transition.moveBy(nero, { x = 1280 - nero.x, time = (1280 - nero.x) * 7 })
				end
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.to(nero, {x = nero.x - 1000, time = 7000})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.x == 600 and flag == 0) then
				flag = 1
				Runtime:removeEventListener("key", move)
				hint2()
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
		composer.removeScene("map2_5")
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