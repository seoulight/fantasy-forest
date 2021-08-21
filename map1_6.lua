-----------------------------------------------------------------------------------------
--
-- map1_6.lua
-- (장미정원) -> 오솔길_체셔 -> (장미정원)
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image1/wonderland.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local cat1 = display.newImageRect("image/char/cat_default.png", 428, 300)
	cat1.x, cat1.y = display.contentWidth * 0.7, display.contentHeight * 0.2
	sceneGroup:insert(cat1)

	local cat2 = display.newImageRect("image/char/cat_01.png", 428, 300)
	cat2.x, cat2.y = display.contentWidth * 0.7, display.contentHeight * 0.2
	cat2.alpha = 0

	local nero = display.newImageRect("image/char/nero_default2.png", 400, 440)
	nero.x, nero.y = display.contentWidth * 0.2, display.contentHeight * 0.255
	sceneGroup:insert(nero)

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text1.png", 1150, 340)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text1)

	-- 대화창 이름 --
	local catName = display.newText("체셔", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	catName.alpha = 0

	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)

	-- 대사 --
	local text = { }
	text[1] = display.newText("혹시 3이 어디로 갔는지 아니?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("글쎄, 모르겠어.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("스페이드 5의 심장은 어디에 있지?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("스페이드 5의 몸 속?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("맞았지만 틀렸어!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("불쌍한 심장, 눈물이 나서 종이가 다 젖어버리게 생겼군.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)

	for i = 2, 7 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 대사에 따라 이름 변경 --
		if j == 1 or j == 4 then
			catName.alpha = 0
			neroName.alpha = 1
		else
			neroName.alpha = 0
			catName.alpha = 1
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 7 then
			text[j].alpha = 1
			catName.alpha = 0
			--composer.removeScene("map1_6")
			composer.gotoScene("map1_7", { effect = "fade", time = 900 })
		end

		if j < 7 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)
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
		composer.removeScene("map1_6")
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