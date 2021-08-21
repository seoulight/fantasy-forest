-----------------------------------------------------------------------------------------
--
-- map1_8.lua
-- (오솔길) -> 장미정원_빨강
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local bg = display.newImageRect("image/image1/garden.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local redBg = display.newImageRect("image/image1/garden2.png", 1280, 720)
	redBg.x, redBg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(redBg)
	redBg.alpha = 0

	local door = display.newImageRect("image/image1/door.png", 200, 200)
	door.x, door.y = display.contentWidth*0.1, display.contentHeight*0.78
	sceneGroup:insert(door)

	-- 카드병정 --
	local black = display.newImageRect("image/char/black_default.png", 180, 230)
	black.x, black.y = bg.x*1.18, bg.y*1.53

	local red = display.newImageRect("image/char/red_default.png", 190, 220)
	red.x, red.y = bg.x*0.93, bg.y*1.56

	-- 색 없는 장미 --
	local rose = { }
	local roseGroup = display.newGroup()

	for i = 1, 2 do
		rose[i] = display.newImageRect(roseGroup, "image/image1_2/rose1.png", 200, 100)
		rose[i].x, rose[i].y = bg.x + 195 * i, bg.y - 92 * i
	end

	roseGroup.x = roseGroup.x + 135
	roseGroup.y = roseGroup.y + 243

	-- 색 있는 장미 --
	local rose2 = { }
	local roseGroup2 = display.newGroup()

	for i = 1, 2 do
		rose2[i] = display.newImageRect(roseGroup2, "image/image1_2/rose2.png", 200, 100)
		rose2[i].x, rose2[i].y = bg.x + 195 * i, bg.y - 92 * i
	end

	roseGroup2.x = roseGroup2.x + 135
	roseGroup2.y = roseGroup2.y + 243

	roseGroup2.alpha = 0
	transition.fadeIn(roseGroup2, {delay = 1900, time = 1300, alpha = 1})
	transition.fadeIn(redBg, {delay = 2400, time = 2000, alpha = 1})

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
	sceneGroup:insert(black)
	sceneGroup:insert(red)

	-- 아이템 제거 --
	local function removeItems() 
		door.alpha = 0
		roseGroup.alpha = 0
		roseGroup2.alpha = 0
		b1Group.alpha = 0
		b3.alpha = 0
		b6Group.alpha = 0
				
		for i = 1, 2 do
			b2[i].alpha = 0
			b4[i].alpha = 0
			b5[i].alpha = 0
			b7[i].alpha = 0
		end
		black.alpha = 0
		red.alpha = 0
		nero.alpha = 0
	end

	-- 장미 아이템 클릭하면 퍼즐 게임 시작 --
	local function gameStart()
		removeItems()
		composer.gotoScene("game1_puzzle", { effect = "fade", time = 900 })
	end

	roseGroup2:addEventListener("tap", gameStart)
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
		composer.removeScene("map1_8")
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