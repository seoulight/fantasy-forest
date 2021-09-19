-----------------------------------------------------------------------------------------
--
-- map2_11.lua
-- 색 채취
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image3/4-2.png", 1280, 720)
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

	-- 네로 움직이는 모습 --
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 738 / 3, height = 648 * 0.5, numFrames = 4})
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
	nero.x, nero.y = 750, display.contentHeight * 0.7

	sceneGroup:insert(bg)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	sceneGroup:insert(p1)
	sceneGroup:insert(nero)

	-- 팔레트, 브러쉬 --
	local palette1 = display.newImageRect("image/color/palette.png", 700, 700)
	palette1.x, palette1.y = display.contentWidth*0.27, display.contentHeight*0.52
	sceneGroup:insert(palette1)

	local palette2 = display.newImageRect("image/color/palette_green2.png", 700, 700)
	palette2.x, palette2.y = display.contentWidth*0.27, display.contentHeight*0.52
	sceneGroup:insert(palette2)
	palette2.alpha = 0

	transition.fadeIn( palette2, { delay = 8000, effect = "fade", time = 1500 } )

	local brush1 = display.newImageRect("image/color/brush.png", 450, 550)
	brush1.x, brush1.y = display.contentWidth*0.65, display.contentHeight*0.78
	sceneGroup:insert(brush1)
	brush1.rotation = 60

	local brush2 = display.newImageRect("image/color/brush_green.png", 450, 550)
	brush2.x, brush2.y = display.contentWidth*0.65, display.contentHeight*0.78
	sceneGroup:insert(brush2)
	brush2.rotation = 60
	brush2.alpha = 0

	transition.fadeIn( brush2, { delay = 3000, effect = "fade", time = 1000 } )
	transition.to( brush1, { delay = 4000, alpha = 0, time = 0 } )

	local bx, by = display.contentWidth*0.45, display.contentHeight*0.86
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
		local text1 = display.newImageRect("image/char/text_nero.png", 1170, 315)
		text1.x, text1.y = display.contentWidth * 0.501, display.contentHeight * 0.745
		sceneGroup:insert(text1)
		text1.alpha = 0

		-- 대화창 이름 --
		local name = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
		sceneGroup:insert(name)
		name.alpha = 0

		-- 대사 --
		local text = { }
		text[1] = display.newText("초록빛도 되찾았어. 호수로 돌아가자.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[1]:setFillColor(0)
		sceneGroup:insert(text[1])
		text[1].alpha = 0

		transition.fadeIn( nero2, { time = 1000 } )
		transition.to( text1, { effect = "fade", alpha = 0.8, time = 1000 } )
		transition.fadeIn( name, { time = 1000 } )
		transition.fadeIn( text[1], { time = 1000 } )

		local function nextScene()
			composer.gotoScene("map0_5", { effect = "fade", time = 900 }) --무지개 호수 맵으로 이동
		end
		text1:addEventListener("tap", nextScene)

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
		-- Called when the scene is now off screen
		composer.removeScene("map2_11")
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