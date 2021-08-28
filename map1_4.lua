-----------------------------------------------------------------------------------------
--
-- map1_4.lua
-- 체셔_문 선택
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image1/wonderland.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local cat = display.newImageRect("image/char/cat_default.png", 428, 300)
	cat.x, cat.y = display.contentWidth * 0.7, display.contentHeight * 0.2
	sceneGroup:insert(cat)

	local stdCat = display.newImageRect("image/char/cat_02.png", 190, 230)
	stdCat.x, stdCat.y = display.contentWidth * 0.63, display.contentHeight * 0.61
	sceneGroup:insert(stdCat)

	local neroDefault = display.newImageRect("image/char/nero_default2.png", 400, 440)
	neroDefault.x, neroDefault.y = display.contentWidth * 0.2, display.contentHeight * 0.255
	sceneGroup:insert(neroDefault)

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
	nero.x, nero.y = display.contentWidth * 0.5, display.contentHeight * 0.65

	-- 대화창 --
	local text1 = display.newImageRect("image/char/text1.png", 1150, 340)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	sceneGroup:insert(text1)

	-- 대화창 이름 --
	local catName = display.newText("체셔", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
	sceneGroup:insert(catName)

	-- 문 힌트 --
	local text = { }
	text[1] = display.newText("힌트: ...", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

	text[1]:setFillColor(0)

	-- 블록--
	local bl1 = { }
	local bl1Group = display.newGroup()

	for i = 1, 13 do
		bl1[i] = display.newImageRect(bl1Group,"image/image1/1.png", 100, 100) 
		bl1[i].x, bl1[i].y = bg.x + 100 * i, bg.y
	end

	bl1Group.x = bl1Group.x - 710
	bl1Group.y = bl1Group.y + 220

	local bl2 = { }
	local bl2Group = display.newGroup()

	for i = 1, 13 do
		bl2[i] = display.newImageRect(bl2Group,"image/image1/6.png", 100, 100) 
		bl2[i].x, bl2[i].y = bg.x + 100 * i, bg.y
	end

	bl2Group.x = bl2Group.x - 710
	bl2Group.y = bl2Group.y + 310

	-- 풀 --
	local g1 = display.newImageRect("image/image1/grass1.png", 110, 110)
	g1.x, g1.y = display.contentWidth*0.12, display.contentHeight*0.66
	sceneGroup:insert(g1)

	local g2 = display.newImageRect("image/image1/grass2.png", 110, 110)
	g2.x, g2.y = display.contentWidth*0.3, display.contentHeight*0.66
	sceneGroup:insert(g2)

	local g3 = display.newImageRect("image/image1/grass1.png", 110, 110)
	g3.x, g3.y = display.contentWidth*0.327, display.contentHeight*0.66
	sceneGroup:insert(g3)

	local g4 = display.newImageRect("image/image1/grass4.png", 110, 110)
	g4.x, g4.y = display.contentWidth*0.55, display.contentHeight*0.66
	sceneGroup:insert(g4)

	local g5 = display.newImageRect("image/image1/grass1.png", 110, 110)
	g5.x, g5.y = display.contentWidth*0.73, display.contentHeight*0.66
	sceneGroup:insert(g5)

	local g6 = display.newImageRect("image/image1/grass2.png", 110, 110)
	g6.x, g6.y = display.contentWidth*0.8, display.contentHeight*0.66
	sceneGroup:insert(g6)

	sceneGroup:insert(bl1Group)
	sceneGroup:insert(bl2Group)
	sceneGroup:insert(cat)
	sceneGroup:insert(nero)
	sceneGroup:insert(text1)
	sceneGroup:insert(catName)

	-- 탭 하면 대화창 사라짐 --
	local function nextScene()
		sceneGroup:remove(bl1Group)
		sceneGroup:remove(bl2Group)
		sceneGroup:remove(text1)
		sceneGroup:remove(cat)
		sceneGroup:remove(neroDefault)
		sceneGroup:remove(stdCat)

		text[1].alpha = 0

		-- 스탠딩 체셔 --
		local cat2 = display.newImageRect("image/char/cat_02.png", 190, 230)
		cat2.x, cat2.y = display.contentWidth * 0.875, display.contentHeight * 0.595
		sceneGroup:insert(cat2)

		nero.x, nero.y = display.contentWidth * 0.12, display.contentHeight * 0.65

		-- 왼쪽 블록--
		local b1 = { }
		local b1Group = display.newGroup()

		for i = 1, 9 do
			b1[i] = display.newImageRect(b1Group,"image/image1/1.png", 100, 100) 
			b1[i].x, b1[i].y = bg.x + 100 * i, bg.y
		end

		b1Group.x = b1Group.x - 710
		b1Group.y = b1Group.y + 220

		local b2 = display.newImageRect("image/image1/2.png", 100, 100) 
		b2.x, b2.y = display.contentWidth*0.725, display.contentHeight*0.805

		local b3 = { }
		local b3Group = display.newGroup()

		for i = 1, 9 do
			b3[i] = display.newImageRect(b3Group,"image/image1/6.png", 100, 100) 
			b3[i].x, b3[i].y = bg.x + 100 * i, bg.y
		end

		b3Group.x = b3Group.x - 710
		b3Group.y = b3Group.y + 310

		local b4 = display.newImageRect("image/image1/4.png", 100, 100) 
		b4.x, b4.y = display.contentWidth*0.725, display.contentHeight*0.94
		
		-- 오른쪽 블록 --
		local b5 = display.newImageRect("image/image1/8.png", 100, 100) 
		b5.x, b5.y = display.contentWidth*0.85, display.contentHeight*0.805

		local b6 = display.newImageRect("image/image1/7.png", 100, 100) 
		b6.x, b6.y = display.contentWidth*0.92, display.contentHeight*0.805

		-- 풀: 오른쪽 --
		local grass1 = display.newImageRect("image/image1/grass4.png", 110, 110)
		grass1.x, grass1.y = display.contentWidth*0.925, display.contentHeight*0.66
		sceneGroup:insert(grass1)

		local grass2 = display.newImageRect("image/image1/grass2.png", 110, 110)
		grass2.x, grass2.y = display.contentWidth*0.94, display.contentHeight*0.66
		sceneGroup:insert(grass2)

		-- 풀: 왼쪽 --
		local grass3 = display.newImageRect("image/image1/grass1.png", 110, 110)
		grass3.x, grass3.y = display.contentWidth*0.07, display.contentHeight*0.66

		local grass4 = display.newImageRect("image/image1/grass3.png", 110, 110)
		grass4.x, grass4.y = display.contentWidth*0.05, display.contentHeight*0.66
		sceneGroup:insert(grass4)
		sceneGroup:insert(grass3)

		local grass5 = display.newImageRect("image/image1/grass1.png", 110, 110)
		grass5.x, grass5.y = display.contentWidth*0.327, display.contentHeight*0.66
		sceneGroup:insert(grass5)

		local grass6 = display.newImageRect("image/image1/grass2.png", 110, 110)
		grass6.x, grass6.y = display.contentWidth*0.525, display.contentHeight*0.66
		sceneGroup:insert(grass6)

		local grass7 = display.newImageRect("image/image1/grass4.png", 110, 110)
		grass7.x, grass7.y = display.contentWidth*0.55, display.contentHeight*0.66
		sceneGroup:insert(grass7)

		local grass8 = display.newImageRect("image/image1/grass1.png", 110, 110)
		grass8.x, grass8.y = display.contentWidth*0.73, display.contentHeight*0.66
		sceneGroup:insert(grass8)


		-- 문 배치 --
		local door = { }
		local doorGroup = display.newGroup()
		for i = 1, 3 do
			door[i] = display.newImageRect(doorGroup, "image/image1/door.png", 200, 200)
			door[i].x, door[i].y = bg.x + 250 * i, bg.y
		end

		doorGroup.x = doorGroup.x - 580
		doorGroup.y = doorGroup.y + 85

		sceneGroup:insert(doorGroup)
		sceneGroup:insert(b1Group)
		sceneGroup:insert(b3Group)
		sceneGroup:insert(b2)
		sceneGroup:insert(b4)
		sceneGroup:insert(b5)
		sceneGroup:insert(b6)
		sceneGroup:insert(nero)

		-- 방향키 입력시 움직이는 이벤트리스너 --
		local function move( event )
			if (event.phase == "down") then
				if (event.keyName == "right") then
					nero:setSequence("walkRight")
					nero:play()
					transition.to(nero, {x = nero.x + 1000, time = 7000})
					
				elseif (event.keyName == "left") then
					nero:setSequence("walkLeft")
					nero:play()
					transition.to(nero, {x = nero.x - 1000, time = 7000})

				elseif (event.keyName == "enter") then
					-- 첫 번째 문, 세 번째 문 / 오답->재시도
					if((nero.x > display.contentWidth * 0.18 and nero.x < display.contentWidth * 0.29) or (nero.x > display.contentWidth * 0.58 and nero.x < display.contentWidth * 0.69)) then
						scene:create() 
					-- 두 번째 문 / 정답->장미정원으로 이동
					elseif(nero.x > display.contentWidth * 0.4 and nero.x < display.contentWidth * 0.49) then
						composer.removeScene("map1_4")
						composer.gotoScene("map1_5", { effect = "fade", time = 900 })		
					end
				end
			elseif (event.phase == "up") then
				transition.cancel(nero) -- 이동 정지
				nero:pause()
			end
		end

		Runtime:addEventListener("key", move)
	end

	text1:addEventListener("tap", nextScene)
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
		composer.removeScene("map1_4")
		Runtime:removeEventListener("key", move)
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