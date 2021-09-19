-----------------------------------------------------------------------------------------
--
-- map2_3.lua
-- 요정 나무(대화)
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
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
	nero.x, nero.y = display.contentWidth*0.09, display.contentHeight * 0.7

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

	local c11 = display.newImageRect("image/image3/child1.png", 439*0.73, 761*0.73)
	c11.x, c11.y = display.contentWidth*0.152, display.contentHeight*0.51
	sceneGroup:insert(c11)
	c11.alpha = 0

	local c22 = display.newImageRect("image/image3/child2.png", 308*0.75, 679*0.75)
	c22.x, c22.y = display.contentWidth*0.25, display.contentHeight*0.5
	sceneGroup:insert(c22)
	c22.alpha = 0

	local c33 = display.newImageRect("image/image3/child3.png", 335*0.73, 793*0.73)
	c33.x, c33.y = display.contentWidth*0.37, display.contentHeight*0.5
	sceneGroup:insert(c33)
	c33.alpha = 0

	-- 활발한 요정 --
	local f22 = display.newImageRect("image/image3/fairy4.png", 241*0.8, 326*0.8)
	f22.x, f22.y = display.contentWidth*0.63, display.contentHeight*0.4
	sceneGroup:insert(f22)
	f22.alpha = 0

	-- 날개 파란 요정 --
	local f33 = display.newImageRect("image/image3/fairy3.png", 223*0.8, 299*0.8)
	f33.x, f33.y = display.contentWidth*0.74, display.contentHeight*0.3
	sceneGroup:insert(f33)
	f33.alpha = 0

	-- 꽃 요정 --
	local f44 = display.newImageRect("image/image3/fairy2.png", 285*0.8, 281*0.8)
	f44.x, f44.y = display.contentWidth*0.82, display.contentHeight*0.5
	sceneGroup:insert(f44)
	f44.alpha = 0

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

	local name2 = display.newText("요정", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name2)
	name2.alpha = 0

	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("요정들아, 피터 팬의 마음을 풀 수 있게 도와줘.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("부탁을 하려면 조금 더 공손한 태도로 해야 하지 않겠어?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	for i = 2, 3 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local k = 0
	local function talk()
		if k == 0 then
			transition.fadeIn( text[1], { time = 900 } )
			transition.to( text1, { alpha = 0.96, time = 900 } )
			transition.fadeIn( name, { time = 900 } )
			transition.fadeIn( c11, { time = 900 } )
			transition.fadeIn( c22, { time = 900 } )
			transition.fadeIn( c33, { time = 900 } )
			transition.fadeIn( f22, { time = 900 } )
			transition.fadeIn( f33, { time = 900 } )
			transition.fadeIn( f44, { time = 900 } )
		end
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		k = 1
		if j == 2 then
			name.alpha = 0
			name2.alpha = 1
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 3 then
			transition.fadeOut( text1, { time = 900 } )
			transition.fadeOut( name2, { time = 900 } )
			transition.fadeOut( c11, { time = 900 } )
			transition.fadeOut( c22, { time = 900 } )
			transition.fadeOut( c33, { time = 900 } )
			transition.fadeOut( f22, { time = 900 } )
			transition.fadeOut( f33, { time = 900 } )
			transition.fadeOut( f44, { time = 900 } )
			text1:removeEventListener("tap", nextText)

			local function listener( event )
				composer.gotoScene("map2_4")
			end

			timer.performWithDelay( 1000, listener, 1)
		end

		if j < 3 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)

	local flag = 0
	---- 방향키 입력시 움직이는 이벤트리스너 --
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 360) then
					transition.moveBy(nero, { x = 360 - nero.x, time = (360 - nero.x) * 7 })
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
			if (nero.x == 360 and flag == 0) then
				flag = 1
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
		-- Called when the scene is now off screen
		composer.removeScene("map2_3")
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