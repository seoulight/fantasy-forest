-----------------------------------------------------------------------------------------
--
-- map1_3.lua
-- 체셔_대화
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

	local text2 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text2.x, text2.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	text2.alpha = 0

	-- 대화창 이름 --
	local catName = display.newText("체셔", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(catName)

	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("오, 이런. 새로운 앨리스가 왔군.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[2] = display.newText("새로운 앨리스?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[3] = display.newText("이곳에 찾아오는 인간의 이름이 앨리스거든.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[4] = display.newText("나는 앨리스가 아니라 네로야.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[5] = display.newText("그래, 넬리스. 아니 앨로? 하하하!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[6] = display.newText("그래서 너는 무슨 일로 이곳에 발을 들였지?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[7] = display.newText("앨리스가 그랬던 것처럼 길을 알려줄 수도 있어. 그 길이 맞는 길인지는 모르겠지만?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[8] = display.newText("빨간빛을 본 적 있어?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[9] = display.newText("빨간빛은 모르겠지만 빨간 장미라면 하트 여왕의 장미정원으로 가봐.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[10] = display.newText("장미정원으로 가려면 어느 쪽으로 가야하니?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[11] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
	text[1]:setFillColor(0)

	for i = 2, 11 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 대사에 따라 이름 변경 --
		if j == 2 or j == 4 or j == 8 or j == 10 then
			catName.alpha = 0
			neroName.alpha = 1
			text1.alpha = 0
			text2.alpha = 0.8
		else
			neroName.alpha = 0
			catName.alpha = 1
			text2.alpha = 0
			text1.alpha = 1
		end

		-- 체셔 당황한 표정 --
		if j == 5 or j == 6 then
			cat1.alpha = 0
			cat2.alpha = 1
		elseif j > 5 then
			cat2.alpha = 0
			cat1.alpha = 1			
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 11 then
			text[j].alpha = 1
			bg:removeEventListener("tap", nextText)
			composer.gotoScene("map1_4")
		end

		if j < 11 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	bg:addEventListener("tap", nextText)
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
		composer.removeScene("map1_3")
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