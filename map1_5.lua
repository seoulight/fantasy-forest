-----------------------------------------------------------------------------------------
--
-- map1_5.lua
-- 장미정원_카드병정 싸움
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local bg = display.newImageRect("image/image1/garden.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local door = display.newImageRect("image/image1/door.png", 200, 200)
	door.x, door.y = display.contentWidth*0.1, display.contentHeight*0.78
	sceneGroup:insert(door)

	-- 카드병정 --
	local black1 = display.newImageRect("image/char/black_02.png", 140, 215)
	black1.x, black1.y = bg.x*1.22, bg.y*1.53
	sceneGroup:insert(black1)

	local red1 = display.newImageRect("image/char/red_04.png", 140, 267)
	red1.x, red1.y = bg.x*1, bg.y*1.53
	sceneGroup:insert(red1)

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
	nero.x, nero.y = display.contentWidth * 0.22, display.contentHeight * 0.81

	
	-- 1층 --
	local b1 = { }
	local b1Group = display.newGroup()

	for i = 1, 9 do
		b1[i] = display.newImageRect(b1Group,"image/image1_2/6.png", 100, 100) 
		b1[i].x, b1[i].y = bg.x + 100 * i, bg.y
	end

	b1Group.x, b1Group.y = b1Group.x - 725, b1Group.y + 345

	-- img 5: 계단 시작(2, 3층 순) --
	local b2 = { }

	for i = 1, 2 do
		b2[i] = display.newImageRect("image/image1_2/5.png", 100, 100) 
	end

	b2[1].x, b2[1].y = display.contentWidth*0.712, display.contentHeight*0.85
	b2[2].x, b2[2].y = display.contentWidth*0.865, display.contentHeight*0.72

	-- img 6: 2층 계단 중간 --
	local b3 = display.newImageRect("image/image1_2/6.png", 100, 100) 
	b3.x, b3.y = display.contentWidth*0.79, display.contentHeight*0.85

	-- img 6: 3층 계단 중간 --
	local b4 = { }
	for i = 1, 2 do
		b4[i] = display.newImageRect("image/image1_2/6.png", 100, 100) 
	end
	b4[1].x, b4[1].y = display.contentWidth*0.943, display.contentHeight*0.72
	b4[2].x, b4[2].y = display.contentWidth*1.02, display.contentHeight*0.72

	-- img 7: 층 사이 이음새 --
	local b5 = { }

	for i = 1, 2 do
		b5[i] = display.newImageRect("image/image1_2/7.png", 100, 100) 
	end

	b5[1].x, b5[1].y = display.contentWidth*0.712, display.contentHeight*0.98
	b5[2].x, b5[2].y = display.contentWidth*0.865, display.contentHeight*0.85


	-- img 1: 흰 블록 채워넣기  --
	local b6 = { } 
	local b6Group = display.newGroup()

	for i = 1, 4 do
		b6[i] = display.newImageRect(b6Group,"image/image1_2/1.png", 100, 100) 
		b6[i].x, b6[i].y = bg.x + 100 * i, bg.y
	end

	b6Group.x, b6Group.y = b6Group.x + 272, b6Group.y + 350

	local b7 = { }
	for i = 1, 2 do
		b7[i]= display.newImageRect("image/image1_2/1.png", 100, 100) 
	end

	b7[1].x, b7[1].y = display.contentWidth*0.95, display.contentHeight*0.85
	b7[2].x, b7[2].y = display.contentWidth*1.02, display.contentHeight*0.85

	-- 색 없는 장미 --
	local rose = { }
	local roseGroup = display.newGroup()

	for i = 1, 2 do
		rose[i] = display.newImageRect(roseGroup, "image/image1_2/rose1.png", 200, 100)
		rose[i].x, rose[i].y = bg.x + 195 * i, bg.y - 92 * i
	end

	roseGroup.x = roseGroup.x + 135
	roseGroup.y = roseGroup.y + 243

	sceneGroup:insert(door)
	sceneGroup:insert(b1Group)
	sceneGroup:insert(b3)
	sceneGroup:insert(b6Group)
	for i = 1, 2 do
		sceneGroup:insert(b2[i])
		sceneGroup:insert(b4[i])
		sceneGroup:insert(b5[i])
		sceneGroup:insert(b7[i])
	end
	sceneGroup:insert(roseGroup)
	sceneGroup:insert(nero)

	-- 카드병정 싸움 --
	local text1 = display.newImageRect("image/char/text1.png", 1150, 340)
	text1.x, text1.y = display.contentWidth * 0.5, display.contentHeight * 0.75
	text1.alpha = 0
	sceneGroup:insert(text1)
	

	local rName, bName, black2, red2, red3, nero2, text

	local function textScene() 
		-- 대화창 --
		text1.alpha = 1
		-- 대화창 이름 --
		rName = display.newText("하트 3", 282, 437, "fonts/SeoulNamsanB.ttf", 32)

		bName = display.newText("스페이드 5", 282, 437, "fonts/SeoulNamsanB.ttf", 32)
		bName.alpha = 0

		black2 = display.newImageRect("image/char/black_01.png", 370, 360)
		black2.x, black2.y = bg.x*1.55, bg.y*0.77
		sceneGroup:insert(black2)

		red2 = display.newImageRect("image/char/red_03.png", 360, 400)
		red2.x, red2.y = bg.x*0.5, bg.y*0.57
		sceneGroup:insert(red2)

		red3 = display.newImageRect("image/char/red_01.png", 360, 400)
		red3.x, red3.y = bg.x*0.5, bg.y*0.57
		red3.alpha = 0

		nero2 = display.newImageRect("image/char/nero_default2.png", 360, 400)
		nero2.x, nero2.y = display.contentWidth * 0.23, display.contentHeight * 0.285
		nero2.alpha = 0

		-- 대사 --
		text = { }
		text[1] = display.newText("이 장미가 늘 붉은색일 때까지 나를 사랑한다고 했으면서!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[2] = display.newText("이제는 나를 사랑하지 않는 건가요!?", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[3] = display.newText("오, 나의 심장, 3. 내 얘기를 들어주오. 나는 그저...", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[4] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[5] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[6] = display.newText("3을 사랑하는 마음은 진심이에요.", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[7] = display.newText("과거에 했던 말은 단지 3을 평생토록 사랑하겠다는 은유적인 표현이었는데..", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[8] = display.newText(" ", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)

		text[1]:setFillColor(0)

		for i = 2, 8 do
			text[i].alpha = 0
			text[i]:setFillColor(0)
		end
	end	

	-- 탭 하면 다음 text --
	local j = 2
	local function nextText()
		-- 대사에 따라 이름 변경 --
		if j == 2 then
			bName.alpha = 0
			rName.alpha = 1
		-- 하트3 우는 모습 --
		elseif j == 4 then
			bName.alpha = 0
			rName.alpha = 1
			red2.alpha = 0
			red3.alpha = 1	
		else
			rName.alpha = 0
			bName.alpha = 1
		end
		
		if j == 5 then
			red3.alpha = 0
			red1.alpha = 0
		elseif j == 6 then
			nero2.alpha = 1
		end

		if j == 1 then
			text[j].alpha = 0
		end

		if j > 1 then
			text[j - 1].alpha = 0
		end

		-- 오솔길로 돌아감 --
		if j == 8 then
			text[j].alpha = 1
			nero2.alpha = 0
			black2.alpha = 0
			text1.alpha = 0
			bName.alpha = 0
			composer.removeScene("map1_5")
			composer.gotoScene("map1_6", { effect = "fade", time = 900 })
		end

		if j < 8 then
			text[j].alpha = 1
			j = j + 1
		end
	end

	text1:addEventListener("tap", nextText)	

	-- 방향키 입력시 움직이는 이벤트리스너 --
	local function move( event )
		if(nero.x >= display.contentWidth * 0.36) then
			Runtime:removeEventListener("key", move)
			textScene()
		end
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.to(nero, {x = nero.x + 1000, time = 7000})
				
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.to(nero, {x = nero.x - 1000, time = 7000})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
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
		composer.removeScene("map1_5")
		Runtime:addEventListener("key", move)
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