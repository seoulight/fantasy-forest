-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" ) 
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local intro = display.newImageRect("image/intro.png", 1280, 720)
	intro.x, intro.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(intro)
	
	local text = {}

	text[1] = display.newText("세상의 모든 이야기가 모이는 환상의 숲.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[2] = display.newText("아이들의 상상과 꿈으로 만들어진 환상의 숲은 무지갯빛으로,\n  빛나는 호수를 중심으로 하는 아주 아름다운 숲이랍니다.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[3] = display.newText("청명하고 푸른 하늘 아래로 붉은 태양 빛이 따사롭게 내리쬐고,\n  싱그러운 녹색 나무들의 노래가 바람 사이로 흘러가지요.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[4] = display.newText("그런데 어느 날, 아름답던 환상의 숲에 큰일이 일어났어요!", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[5] = display.newText("                        빨강, 파랑, 초록…… \n             환상의 숲을 다채롭게 빛내주던 색들이\n              하나씩 빛깔을 잃어버리기 시작하더니,\n결국 모든 빛을 잃어버리고 새하얗게 변해버리고 만 것이지요.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[6] = display.newText("그림을 그리는 것을 좋아하는 소년 네로는 몹시 슬퍼했답니다.\n     그림만큼이나 환상의 숲을 몹시 사랑했기 때문이에요.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[7] = display.newText("“아, 이제 다시는 아름다웠던 숲의 풍경을 보지 못하는 걸까?”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[8] = display.newText("    침울해하고 있는 네로의 앞에\n신비로운 요정이 나타나 말했습니다.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[9] = display.newText("“안녕, 꼬마야. 왜 그렇게 슬프게 울고 있니?”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[10] = display.newText("              “안녕하세요, 요정님. 저는 네로라고 해요.\n         숲이 빛깔을 잃어버리고 전부 하얗게 변해버렸어요.\n무지갯빛으로 반짝이던 호수도 이제 더는 예쁘게 빛나지 않아요.”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 24)
	text[11] = display.newText("                     “그것참 큰일이구나. \n네로야, 너는 이 숲이 다시 빛깔을 되찾았으면 좋겠니?”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[12] = display.newText("           “네! 숲에 다시 빛깔이 돌아와서, \n원래의 아름다운 모습으로 돌아왔으면 좋겠어요!”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[13] = display.newText("                    네로의 말을 들은 요정은\n네로가 가지고 있던 붓과 팔레트에 마법을 걸어주었습니다.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[14] = display.newText("“그렇다면 네가 직접 이 숲을 구해주지 않겠니?”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[15] = display.newText("“제가요?”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[16] = display.newText("          “너의 그림 도구에 마법을 걸어주었단다.\n          숲을 다시 아름답게 만들어줄 수 있는 건\n네로 너 같은 상냥하고 순수한 아이란다. 할 수 있겠지?”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[17] = display.newText("“네! 제가 반드시 환상의 숲에 빛을 돌려놓고 말겠어요!”", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[18] = display.newText("그렇게 잃어버린 숲의 빛을 찾는\n 네로의 여행이 시작되었답니다.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[19] = display.newText("", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)

	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])

	for i = 2, 19 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local j = 2
	-- 탭 하면 다음 text --
	local function nextText()
		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 19 then
			composer.gotoScene("map0_1", { effect = "fade", time = 900 })
		end

		if j < 19 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	intro:addEventListener("tap", nextText)
	
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
		composer.removeScene("view2")
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