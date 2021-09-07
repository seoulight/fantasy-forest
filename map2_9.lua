-----------------------------------------------------------------------------------------
--
-- map2_9.lua
-- 피터팬 은신처 안
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image3/4-1.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5

	-- 캐릭터 --
	local c1 = display.newImageRect("image/image3/child1.png", 439*0.36, 761*0.36)
	c1.x, c1.y = display.contentWidth*0.15, display.contentHeight*0.69

	local c2 = display.newImageRect("image/image3/child2.png", 308*0.38, 679*0.38)
	c2.x, c2.y = display.contentWidth*0.23, display.contentHeight*0.69

	local c3 = display.newImageRect("image/image3/child3.png", 335*0.36, 793*0.36)
	c3.x, c3.y = display.contentWidth*0.31, display.contentHeight*0.68

	local p1 = display.newImageRect("image/image3/peter1.png", 609*0.33, 1080*0.33)
	p1.x, p1.y = display.contentWidth*0.7, display.contentHeight*0.65
	p1.alpha = 0

	local p2 = display.newImageRect("image/image3/peter2.png", 609*0.33, 1080*0.33)
	p2.x, p2.y = display.contentWidth*0.7, display.contentHeight*0.65

	-- 네로 움직이는 모습 --
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
	nero.x, nero.y = 500, display.contentHeight * 0.75

	sceneGroup:insert(bg)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	sceneGroup:insert(p1)
	sceneGroup:insert(p2)
	sceneGroup:insert(nero)

	-- 캐릭터 대화버전 --
	local nero2 = display.newImageRect("image/char/nero_default.png", 460*0.75, 499*0.75)
	nero2.x, nero2.y = display.contentWidth * 0.75, display.contentHeight * 0.38
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	local bird = display.newImageRect("image/char/bird_default2.png", 556*0.4, 630*0.4)
	bird.x, bird.y = display.contentWidth * 0.75, display.contentHeight * 0.57
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

	local p11 = display.newImageRect("image/image3/peter1.png", 609*0.73, 1080*0.73)
	p11.x, p11.y = display.contentWidth*0.75, display.contentHeight*0.55
	sceneGroup:insert(p11)
	p11.alpha = 0

	local p22 = display.newImageRect("image/image3/peter2.png", 609*0.73, 1080*0.73)
	p22.x, p22.y = display.contentWidth*0.75, display.contentHeight*0.55
	sceneGroup:insert(p22)
	p22.alpha = 0

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text2.png", 1168, 305)
	text1.x, text1.y = display.contentWidth * 0.499, display.contentHeight * 0.74
	sceneGroup:insert(text1)
	text1.alpha = 0

	--[[local text2 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text2.x, text2.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	sceneGroup:insert(text2)
	text2.alpha = 0]]

	local text3 = display.newImageRect("image/char/text1.png", 1150, 340)
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text3)
	text3.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("아이들", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	--local bName = display.newText("앵무", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	--sceneGroup:insert(bName)
	--bName.alpha = 0

	local pName = display.newText("피터 팬", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(pName)
	pName.alpha = 0

	--local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	--sceneGroup:insert(neroName)
	--neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("너희들의 대장이 누구지?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("피터 팬!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("나와 저 이방인 중 누구를 따를 거야?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("피터 팬!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("서운했던 마음이 풀렸어. 우리 화해하자.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("좋아! 앞으로도 사이좋게 지내자.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	
	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	for i = 2, 7 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local function talk() 
		transition.fadeIn( text[1], { time = 900 } )
		transition.to( text1, { alpha = 0.96, time = 900 } )
		transition.fadeIn( c11, { time = 900 } )
		transition.fadeIn( c22, { time = 900 } )
		transition.fadeIn( c33, { time = 900 } )
		transition.fadeIn( p22, { time = 900 } )
		transition.fadeIn( pName, { time = 900 } )
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		--text[2].alpha = 0
		if j > 1 then
			text[j - 1].alpha = 0
		end

		-- 피터팬 대사 --
		if j == 3 or j == 5 then
			name.alpha = 0
			pName.alpha = 1
		end

		-- 피터팬 심통->웃는 표정 --
		if j == 5 then
			p2.alpha = 0
			p1.alpha = 1
			p22.alpha = 0
			p11.alpha = 1
		end

		-- 배경 초록색으로 바뀜 --
		if j == 7 then
			composer.gotoScene("map2_10", { effect = "fade", time = 900 })
		end

		if j < 7 then
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
				if (nero.x < 750) then
					transition.moveBy(nero, { x = 750 - nero.x, time = (750 - nero.x) * 7 })
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
			if (nero.x == 750 and flag == 0) then
				flag = 1
				Runtime:removeEventListener("key", move)
				-- 대화 시작 --
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
		composer.removeScene("map2_9")
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