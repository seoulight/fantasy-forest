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

	text[1] = display.newText("", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[2] = display.newText("줄거리", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[3] = display.newText("나중에 더 추가", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[4] = display.newText("폰트 확인o", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)
	text[5] = display.newText("\t\t\t\t\t세상의 모든 이야기가 모이는 환상의 숲,\n그렇게 네로의 빛을 찾는 여행이 시작되었답니다.", intro.x, intro.y, "fonts/SeoulNamsanB.ttf", 25)

	for i = 2, 5 do
		text[i].alpha = 0
		text[i]:setFillColor(0)
	end

	local j = 2
	-- 탭 하면 다음 text --
	local function nextText()
		if j > 1 then
			text[j - 1].alpha = 0
		end

		if j == 6 then
			composer.gotoScene("map1_0", { effect = "fade", time = 900 })
		end

		if j < 6 then
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