-----------------------------------------------------------------------------------------
--
-- map1_9.lua
-- 장미정원_색 채취
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local bg = display.newImageRect("image/image1/garden2.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local door = display.newImageRect("image/image1/door.png", 200, 200)
	door.x, door.y = display.contentWidth*0.1, display.contentHeight*0.78
	sceneGroup:insert(door)

	-- 카드병정 --
	local black = display.newImageRect("image/char/black_default.png", 180, 230)
	black.x, black.y = bg.x*1.18, bg.y*1.53

	local red = display.newImageRect("image/char/red_default.png", 190, 220)
	red.x, red.y = bg.x*0.93, bg.y*1.56

	-- 풀 --
	local grass1 = display.newImageRect("image/image1/grass1.png", 110, 110)
	grass1.x, grass1.y = display.contentWidth*0.19, display.contentHeight*0.84

	local grass2 = display.newImageRect("image/image1/grass1.png", 110, 110)
	grass2.x, grass2.y = display.contentWidth*0.32, display.contentHeight*0.84

	local grass3 = display.newImageRect("image/image1/grass2.png", 110, 110)
	grass3.x, grass3.y = display.contentWidth*0.35, display.contentHeight*0.84

	local grass4 = display.newImageRect("image/image1/grass4.png", 110, 110)
	grass4.x, grass4.y = display.contentWidth*0.54, display.contentHeight*0.84
	
	-- 색 있는 장미 --
	local rose2 = { }
	local roseGroup2 = display.newGroup()

	for i = 1, 2 do
		rose2[i] = display.newImageRect(roseGroup2, "image/image1_2/rose2.png", 200, 100)
		rose2[i].x, rose2[i].y = bg.x + 195 * i, bg.y - 92 * i
	end

	roseGroup2.x = roseGroup2.x + 135
	roseGroup2.y = roseGroup2.y + 243

	-- 네로 움직이는 모습 --
	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 738 / 3, height = 648 * 0.5, numFrames = 6})
	local sequences_nero = {
		{
			name = "walkRight",
			frames = { 1, 2},
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "walkLeft",
			frames = { 5, 6 },
			time = 300,
			loopCount = 0,
			loopDirection = "forward"
		}
	}

	local nero = display.newSprite(nero_sheet, sequences_nero)
	nero.x, nero.y = display.contentWidth * 0.35, display.contentHeight * 0.72

	transition.scaleTo(nero, {xScale = 0.4, yScale = 0.4, time = 0})

	-- 팔레트, 브러쉬 --
	local palette1 = display.newImageRect("image/color/palette.png", 700, 700)
	palette1.x, palette1.y = display.contentWidth*0.27, display.contentHeight*0.52
	
	local palette2 = display.newImageRect("image/color/palette_red2.png", 700, 700)
	palette2.x, palette2.y = display.contentWidth*0.27, display.contentHeight*0.52
	palette2.alpha = 0

	transition.fadeIn( palette2, { delay = 8000, effect = "fade", time = 1500 } )

	local brush1 = display.newImageRect("image/color/brush.png", 450, 550)
	brush1.x, brush1.y = display.contentWidth*0.65, display.contentHeight*0.78
	brush1.rotation = 60

	local brush2 = display.newImageRect("image/color/brush_red.png", 450, 550)
	brush2.x, brush2.y = display.contentWidth*0.65, display.contentHeight*0.78
	brush2.rotation = 60
	brush2.alpha = 0

	transition.fadeIn( brush2, { delay = 3000, effect = "fade", time = 1000 } )
	transition.to( brush1, { delay = 4000, alpha = 0, time = 0 } )

	local bx, by = display.contentWidth*0.33, display.contentHeight*0.78
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
		text[1] = display.newText("와!! 빨리 호수로 돌아가 빛을 돌려놓자!", text1.x, text1.y + 20, "fonts/SeoulNamsanB.ttf", 28)
		text[1]:setFillColor(0)
		sceneGroup:insert(text[1])
		text[1].alpha = 0

		transition.fadeIn( nero2, { time = 1000 } )
		transition.to( text1, { effect = "fade", alpha = 0.8, time = 1000 } )
		transition.fadeIn( name, { time = 1000 } )
		transition.fadeIn( text[1], { time = 1000 } )

		local function nextScene()
			composer.gotoScene("map0_3", { effect = "fade", time = 900 }) --무지개 호수 맵으로 이동
		end
		text1:addEventListener("tap", nextScene)

	end
	palette2:addEventListener("tap", textScene)
	

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

	sceneGroup:insert(grass1)
	sceneGroup:insert(grass2)
	sceneGroup:insert(grass3)
	sceneGroup:insert(grass4)
	sceneGroup:insert(b1Group)
	sceneGroup:insert(b3)
	sceneGroup:insert(b6Group)
	for i = 1, 2 do
		sceneGroup:insert(b2[i])
		sceneGroup:insert(b4[i])
		sceneGroup:insert(b5[i])
		sceneGroup:insert(b7[i])
	end
	sceneGroup:insert(roseGroup2)
	sceneGroup:insert(nero)
	sceneGroup:insert(black)
	sceneGroup:insert(red)
	sceneGroup:insert(palette1)
	sceneGroup:insert(brush1)
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
		composer.removeScene("map1_9")
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