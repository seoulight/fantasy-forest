-----------------------------------------------------------------------------------------
--
-- map3_1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5


	local bg = display.newImageRect("image/image2/1-1.png", 1280, 720)
	bg.x, bg.y = cx, cy
	sceneGroup:insert(bg)

	local npc = display.newImageRect("image/image2/mermaid_1.png", 223 * 0.9, 342 * 0.9)
	npc.x, npc.y = 860, 450
	sceneGroup:insert(npc)

	local sail = display.newImageRect("image/image2/1-2.png", 1280, 720)
	sail.x, sail.y = cx, cy

	local bird = display.newImageRect("image/char/bird_default.png", 73, 82)
	bird.x, bird.y = display.contentWidth * 0.22, display.contentHeight * 0.65
	sceneGroup:insert(bird)

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
	nero.x, nero.y = 150, display.contentHeight * 0.6
	sceneGroup:insert(nero);
	sceneGroup:insert(sail)

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text3.png", 1140, 335)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.74
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text_nero.png", 1150, 340)
	text2.x, text2.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text2)
	text2.alpha = 0

	-- 인어와 대화할 때 사용 (탭 이벤트가 겹쳐서 추가로 선언) --
	local text3 = display.newImageRect("image/char/text_nero.png", 1150, 340)
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text3)
	text3.alpha = 0	

	local nName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	nName.alpha = 0
	sceneGroup:insert(nName)

	local nero2 = display.newImageRect("image/char/nero_default2.png", 360, 400)
	nero2.x, nero2.y = display.contentWidth * 0.23, display.contentHeight * 0.285
	nero2.alpha = 0
	sceneGroup:insert(nero2)

	local bubble = display.newImageRect("image/image2/bubble.png", 350, 400)
	bubble.x, bubble.y = display.contentWidth * 0.5, display.contentHeight * 0.35
	sceneGroup:insert(bubble)
	bubble.alpha = 0

	-- 인어와 대화 --
	local mName, npc2, text

	
	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		text[j - 1].alpha = 0

		-- 네로가 인어 말 따라하는 장면, 타이핑 대신 일단 클릭으로.. --
		if j == 5 then
			text1.alpha = 0
			text3.alpha = 0.8
			mName.alpha = 0
			nName.alpha = 1
			text3:toFront()
			nName:toFront()
		end

		if j == 6 then
			text3.alpha = 0
			text1.alpha = 0.8
			nName.alpha = 0
			mName.alpha = 1
			-- 물거품 부는 모습 추가 --
			transition.fadeIn(bubble, {time = 600})
		end

		if j == 7 then
			transition.fadeOut(bubble, {time = 600})
		end

		-- 대화 끝 --
		if j == 8 then
			text[j].alpha = 1
			nero2.alpha = 0
			npc2.alpha = 0
			text1.alpha = 0
			mName.alpha = 0
			npc.alpha = 1
			nero.alpha = 1
			transition.fadeOut(npc, {time = 300})
			bg:removeEventListener("tap", nextText)
		end

		if j < 8 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	local function textScene() 
		if npc.x == 550 then
			-- 대화창 --
			transition.to( npc, { alpha = 0.8, effect = "fade", time = 900 } )
			transition.to( nero, { alpha = 0.8, effect = "fade", time = 900 } )
			text2.alpha = 0
			transition.to( text1, { alpha = 0.8, effect = "fade", time = 900 } )

			-- 대화창 이름 --
			mName = display.newText("언니인어", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
			sceneGroup:insert(mName)
			mName.alpha = 0
			transition.fadeIn( mName, { effect = "fade", time = 900 } )

			npc2 = display.newImageRect("image/image2/mermaid_1.png", 450, 680)
			npc2.x, npc2.y = display.contentWidth * 0.75, display.contentHeight * 0.53
			sceneGroup:insert(npc2)
			npc2.alpha = 0
			transition.fadeIn( npc2, { effect = "fade", time = 900 } )

			text1:toFront()
			mName:toFront()

			transition.fadeIn( nero2, { effect = "fade", time = 900 } )

			

			-- 대사: 네로가 따라하는 부분 추가해야함 --
			text = { }
			text[1] = display.newText("너, 푸른빛인지 뭔지를 찾으려면 바다로 들어와야 한다고?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[2] = display.newText("내가 도와줄 테니까, 너도 내 동생 찾는 것 좀 도와주지 않을래?", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[3] = display.newText("물속에서도 숨 쉴 수 있게 해주는 마법을 걸어줄게. 내가 하라는 대로 따라 해.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[4] = display.newText("순수한 물, 반짝이는 파랑, 그 아래 모든 생명의 숨.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[5] = display.newText("순수한 물, 반짝이는 파랑, 그 아래 모든 생명의 숨.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[6] = display.newText(" ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[7] = display.newText("마법을 걸었으니 이제 물속에서도 숨을 쉴 수 있을 거야.", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
			text[8] = display.newText(" ", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)

			text[1]:setFillColor(0)

			for i = 2, 7 do
				text[i].alpha = 0
				text[i]:setFillColor(0)
			end
			bg:addEventListener("tap", nextText)
			npc:removeEventListener("tap", textScene)
		end
	end	

	npc:addEventListener("tap", textScene)
	
	-- 방향키 입력시 움직이는 이벤트리스너
	local function move1( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 340) then
					transition.moveBy(nero, {x = 340 - nero.x, time = (340 - nero.x) * 7})
				else
					transition.moveBy(nero, {x = 1280 - nero.x, y = 450, time = (1280 - nero.x) * 7})
				end
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				if (nero.x < 340) then
					transition.moveBy(nero, {x = -nero.x, time = nero.x * 7})
				-- else
				-- 	transition.moveBy(nero, {x = nero.x, y = -150, time = (nero.x - 340) * 7})
				end
				transition.to(nero, {x = nero.x - 1000, time = 7000})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			if (nero.y > 620) then
				Runtime:removeEventListener("key", move1)
				transition.fadeOut(sceneGroup, {time = 300})
				local options = {
								effect = "fade",
								time = 500
							}
				composer.gotoScene( "map3_2" , options)
			end
			if (nero.x == 340) then
				-- 네로 혼잣말 --
				transition.to( text2, { alpha = 0.8, effect = "fade", time = 500 } )

				local txt = display.newText("푸른빛을 찾으려면 물속으로 들어가야 해. 물속에서는 숨을 쉴 수 없을텐데..", text1.x, text1.y + 30, "fonts/SeoulNamsanB.ttf", 28)
				txt:setFillColor(0)
				txt.alpha = 0
				transition.fadeIn( txt, { effect = "fade", time = 500 } )

				transition.fadeIn( nName, { effect = "fade", time = 500 } )
			
				transition.fadeIn( nero2, {effect = "fade", time = 500 } )

				text2:toFront()
				nName:toFront()

				local function removeItems()
					-- 클릭하면 대화창 사라짐 --
					transition.fadeOut( nero2, { effect = "fade", time = 500 } )
					transition.fadeOut( text2, { effect = "fade", time = 500 } )
					transition.fadeOut( nName, { effect = "fade", time = 500 } )
					transition.fadeOut( txt, { effect = "fade", time = 500 } )
			
					-- 앵무가 인어 데리고 옴 --
					transition.to( bird, { delay = 1000, x = 700, y = 300, time = 2000 } )
					transition.to( bird, { delay = 4000, x = 300, y = 470, time = 2000 } )
					transition.to( npc, { delay = 4000, x = 550, time = 1800 } )
				end
			
				text2:addEventListener("tap", removeItems)
			end
		end
	end

	Runtime:addEventListener("key", move1)
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
	elseif phase == "did" then
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
		composer.removeScene("map3_1")
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