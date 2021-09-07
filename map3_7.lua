-----------------------------------------------------------------------------------------
--
-- map3_7.lua
-- 색 채취
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5
	
	local bg = display.newImageRect("image/image2/4-2.png", 1280, 720)
	bg.x, bg.y = cx, cy
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
	nero.x, nero.y = 400, display.contentHeight * 0.8
	sceneGroup:insert(nero)

	-- 언니 인어 --
	local m1 = display.newImageRect("image/image2/m1_smile.png", 577 * 0.35, 856 * 0.35)
	m1.x, m1.y = display.contentWidth * 0.65, display.contentHeight * 0.7
	sceneGroup:insert(m1)

	-- 막내 인어 --
	local m5 = display.newImageRect("image/image2/m2_smile.png", 483 * 0.35, 856 * 0.35)
	m5.x, m5.y = display.contentWidth * 0.78, display.contentHeight * 0.7
	sceneGroup:insert(m5)

	local w2 = display.newImageRect("image/image2/witch_smile.png", 664 * 0.35, 1080 * 0.35)
	w2.x, w2.y = display.contentWidth * 0.9, display.contentHeight * 0.7
	sceneGroup:insert(w2)

	local bird = display.newImageRect("image/char/bird_default2.png", 556*0.4, 630*0.4)
	bird.x, bird.y = display.contentWidth * 0.75, display.contentHeight * 0.57
	sceneGroup:insert(bird)
	bird.alpha = 0

	-- 팔레트, 브러쉬 --
	local palette1 = display.newImageRect("image/color/palette.png", 700, 700)
	palette1.x, palette1.y = display.contentWidth*0.27, display.contentHeight*0.52

	local palette2 = display.newImageRect("image/color/palette_blue2.png", 700, 700)
	palette2.x, palette2.y = display.contentWidth*0.27, display.contentHeight*0.52
	palette2.alpha = 0

	transition.fadeIn( palette2, { delay = 8000, effect = "fade", time = 1500 } )

	local brush1 = display.newImageRect("image/color/brush.png", 450, 550)
	brush1.x, brush1.y = display.contentWidth*0.65, display.contentHeight*0.78
	brush1.rotation = 60

	local brush2 = display.newImageRect("image/color/brush_blue.png", 450, 550)
	brush2.x, brush2.y = display.contentWidth*0.65, display.contentHeight*0.78
	brush2.rotation = 60
	brush2.alpha = 0

	sceneGroup:insert(palette1)
	sceneGroup:insert(brush1)

	transition.fadeIn( brush2, { delay = 3000, effect = "fade", time = 1000 } )
	transition.to( brush1, { delay = 4000, alpha = 0, time = 0 } )

	local bx, by = display.contentWidth*0.49, display.contentHeight*0.68
	transition.to( brush2, { delay = 5000, x = bx, y = by, time=2500, rotation=0 } )
	
	-- 대사 --
	local function textScene() 
		transition.fadeOut( palette1, { time = 800 } )
		transition.fadeOut( palette2, { time = 800 } )
		transition.fadeOut( brush2, { time = 800 } )

		-- 네로 --
		local nero2 = display.newImageRect("image/char/nero_default2.png", 400, 440)
		nero2.x, nero2.y = display.contentWidth * 0.2, display.contentHeight * 0.255
		sceneGroup:insert(nero2)
		nero2.alpha = 0

		-- 대화창 --
		local text1 = display.newImageRect("image/char/text1.png", 1150, 340)
		text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
		sceneGroup:insert(text1)
		text1.alpha = 0

		local text2 = display.newImageRect("image/char/text_nero.png", 1170, 315)
		text2.x, text2.y = display.contentWidth * 0.501, display.contentHeight * 0.745
		sceneGroup:insert(text2)
		text2.alpha = 0

		-- 대화창 이름 --
		local name = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
		sceneGroup:insert(name)
		name.alpha = 0

		local name2 = display.newText("앵무", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
		sceneGroup:insert(name2)
		name2.alpha = 0

		-- 대사 --
		local text = { }
		text[1] = display.newText("와!! 드디어 삼원색을 전부 찾았어. 빨리 호수로 돌아가자!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[2] = display.newText("그래. 전보다 더 추워진 것 같네.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[3] = display.newText("물에 오래 있어서 그런가? 육지로 올라가서 몸을 말리면 괜찮을 거야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[4] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

		text[1]:setFillColor(0)
		text[1].alpha = 0

		for i = 2, 4 do
			text[i].alpha = 0
			text[i]:setFillColor(0)
		end

		transition.fadeIn( nero2, { time = 1000 } )
		transition.to( text2, { effect = "fade", alpha = 0.8, time = 1000 } )
		transition.fadeIn( name, { time = 1000 } )
		transition.fadeIn( bird, { time = 1000 } )
		transition.fadeIn( text[1], { time = 1000 } )

		-- 탭 하면 다음 text --
		local j = 2
		local function nextText()
			-- 앵무 대사 --
			if  j == 2 then
				name2.alpha = 1
				name.alpha = 0
				text2.alpha = 0
				text1.alpha = 1
			-- 네로 대사 --
			else
				name.alpha = 1
				name2.alpha = 0
				text1.alpha = 0
				text2.alpha = 0.8
			end

			if j > 1 then
				text[j - 1].alpha = 0
			end

			if j == 4 then
				-- 무지개 호수 맵으로 이동 --
				composer.gotoScene("map0_7", { effect = "fade", time = 900 }) 
			end

			if j < 4 then
				text[j].alpha = 1
				j = j + 1
			end
		end

		text1:addEventListener("tap", nextText)	
		text2:addEventListener("tap", nextText)	

	end
	palette2:addEventListener("tap", textScene)

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
		composer.removeScene("map3_7")
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