-----------------------------------------------------------------------------------------
--
-- map2_1.lua
-- 울창한 숲속
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image3/1-1.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5

	local bg2 = display.newImageRect("image/image3/1-2.png", 1280, 720)
	bg2.x, bg2.y = display.contentWidth*0.5, display.contentHeight*0.5

	-- 타이틀 등장 후 사라지게 --
	local title = display.newImageRect("image/image3/map2_title.png", 591 * 0.7, 291 * 0.7)
	title.x, title.y = display.contentWidth*0.5, display.contentHeight*0.35
	title.alpha = 0

	transition.to(title, { effect = "fade", alpha = 1, time = 1000 })
	transition.to(title, { delay = 2500, effect = "fade", alpha = 0, time = 1000})

	-- 캐릭터 --
	local c1 = display.newImageRect("image/image3/child1-1.png", 439*0.36, 761*0.36)
	c1.x, c1.y = display.contentWidth*0.735, display.contentHeight*0.69

	local c2 = display.newImageRect("image/image3/child2-1.png", 308*0.38, 679*0.38)
	c2.x, c2.y = display.contentWidth*0.815, display.contentHeight*0.69

	local c3 = display.newImageRect("image/image3/child3-1.png", 335*0.36, 793*0.36)
	c3.x, c3.y = display.contentWidth*0.89, display.contentHeight*0.68

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
	nero.x, nero.y = display.contentWidth * 0.1, display.contentHeight * 0.75

	local nero2 = display.newImageRect("image/char/nero_default2.png", 400, 440)
	nero2.x, nero2.y = display.contentWidth * 0.2, display.contentHeight * 0.255
	sceneGroup:insert(nero2)
	nero2.alpha = 0

	sceneGroup:insert(bg2)
	sceneGroup:insert(c1)
	sceneGroup:insert(c2)
	sceneGroup:insert(c3)
	sceneGroup:insert(bg)
	sceneGroup:insert(nero)
	sceneGroup:insert(title)

	local stone = display.newImageRect("image/image3/stone3.png", 100, 80)
	stone.x, stone.y = 840, 420
	sceneGroup:insert(stone)
	stone.alpha = 0
	
	-- 대화창 --
	local text1 = display.newImageRect("image/char/text2.png", 1150, 340)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text1)
	text1.alpha = 0

	local text2 = display.newImageRect("image/char/text_nero.png", 1170, 315)
	text2.x, text2.y = display.contentWidth * 0.501, display.contentHeight * 0.745
	sceneGroup:insert(text2)
	text2.alpha = 0

	-- 대화창 이름 --
	local name = display.newText("???", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(name)
	name.alpha = 0

	local neroName = display.newText("네로", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(neroName)
	neroName.alpha = 0

	-- 대사 --
	local text = { }
	text[1] = display.newText("나쁘고 못된 어른은 나가라! 여기는 우리 아이들의 영역이다!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)	
	text[1]:setFillColor(0)
	sceneGroup:insert(text[1])
	text[1].alpha = 0

	local function talk()
		-- 돌 던지기 --
		transition.fadeIn( stone, { time = 900 } )
		transition.to( stone, { delay = 1500, x = 490, y = 590, time = 500 } )
		-- 대화창 --
		transition.fadeIn( text[1], { delay = 3000, time = 900 } )
		transition.fadeIn( text1, { delay = 3000, time = 900 } )
		transition.fadeIn( name, { delay = 3000, time = 900 } )
	end

	-- 대화 제거 --
	local function remove()
		transition.fadeOut( text1, { time = 800 } )
		transition.fadeOut( text[1], { time = 800 } )
		transition.fadeOut( name, { time = 800 } )
		text1:removeEventListener("tap", remove)

		-- 돌 피하기 게임으로 넘어감 -- 
		--composer.gotoScene("game4_stone")
	end

	text1:addEventListener("tap", remove)

	local flag = 0
	---- 방향키 입력시 움직이는 이벤트리스너 --
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				if (nero.x < 420) then
					transition.moveBy(nero, { x = 420 - nero.x, time = (420 - nero.x) * 7 })
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
			if (nero.x == 420 and flag ~= 1) then
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
		composer.removeScene("map2_1")
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