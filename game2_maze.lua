-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local physics = require( "physics" )

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5

	physics.start()
	physics.setGravity(0, 0)
	-- physics.setDrawMode( "hybrid" )

	local bg = display.newImage("image/image1/rabbitBurrow.png")
	bg.x, bg.y = cx, cy
	sceneGroup:insert(bg)

	local bg2 = display.newRect(cx, cy, 1100, 550)
	bg2:setFillColor(0.9)
	bg2.alpha = 0.7
	sceneGroup:insert(bg2)

	-- local bg3 = display.newRect(cx, cy, 300, 720)
	-- bg3:setFillColor(0.9)
	-- bg3.alpha = 0.7
	-- sceneGroup:insert(bg3)

	local maze_line1 = graphics.newOutline(4, "image/maze2.png")
	local maze_line2 = graphics.newOutline(4, "image/maze3.png")
	local maze_line3 = graphics.newOutline(7, "image/maze4.png")
	local maze_line4 = graphics.newOutline(4, "image/maze5.png")

	local maze1 = display.newImageRect("image/maze2.png", 1000, 482)
	maze1.x, maze1.y = cx, cy
	maze1.alpha = 0.8
	sceneGroup:insert(maze1)

	local maze2 = display.newImageRect("image/maze3.png", 1000, 482)
	maze2.x, maze2.y = cx, cy
	maze2.alpha = 0.8
	sceneGroup:insert(maze2)

	local maze3 = display.newImageRect("image/maze4.png", 1000, 482)
	maze3.x, maze3.y = cx, cy
	maze3.alpha = 0.8
	sceneGroup:insert(maze3)

	local maze4 = display.newImageRect("image/maze5.png", 1000, 482)
	maze4.x, maze4.y = cx, cy
	maze4.alpha = 0.8
	sceneGroup:insert(maze4)

	-- 네로 캐릭터

	local nero_sheet1 = graphics.newImageSheet("image/char/nero_sprites4.png", { width = 100, height = 166, numFrames = 4})


	local nero_sheet2 = graphics.newImageSheet("image/char/nero_sprites_mini.png", { width = 21, height = 34, numFrames = 4})
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
	local nero = display.newSprite(nero_sheet2, sequences_nero)
	-- local nero_big = display.newSprite(nero_sheet1, sequences_nero)
	-- nero_big.x, nero_big.y = cx, display.contentHeight * 0.15
	nero.x, nero.y = cx, display.contentHeight * 0.15
	sceneGroup:insert(nero);

	-- local test = display.newRect(cx, display.contentHeight * 0.15, 25, 25)
	-- test:setFillColor(0)
	-- sceneGroup:insert(test)

	-- 네로 줄이기
	-- transition.scaleTo(nero_big, {xScale = 0.1, yScale = 0.08, time = 0})
	physics.addBody(nero, "dynamic", {bounce=0.5, friction=0.1})

	-- 방향키 입력시 움직이는 이벤트리스너
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.to(nero, {x = nero.x + 15, time = 20})
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.to(nero, {x = nero.x - 15, time = 20})
			elseif (event.keyName == "up") then
				nero:play()
				transition.to(nero, {y = nero.y - 15, time = 20})
			elseif (event.keyName == "down") then
				nero:play()
				transition.to(nero, {y = nero.y + 15, time = 20})
				if (nero.y > 715) then
					Runtime:removeEventListener("key", move)
					composer.gotoScene("map1_3", { effect = "fade", time = 500 })
				end
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
		end
	end

	-- Runtime:addEventListener("key", move)

	-- local function move( event )
	-- 	if (event.phase == "down") then
	-- 		if (event.keyName == "right") then
	-- 			transition.to(test, {x = test.x + 15, time = 10})				
	-- 		elseif (event.keyName == "left") then
	-- 			transition.to(test, {x = test.x - 15, time = 10})
	-- 		elseif (event.keyName == "up") then
	-- 			transition.to(test, {y = test.y - 15, time = 10})
	-- 		elseif (event.keyName == "down") then
	-- 			transition.to(test, {y = test.y + 15, time = 10})
	-- 		end
	-- 	elseif (event.phase == "up") then
	-- 		transition.cancel(test) -- 이동 정지
	-- 	end
	-- end

	Runtime:addEventListener("key", move)

	-- physics.addBody(nero, "dynamic", {bounce=0.5, friction=0.1})
	physics.addBody(maze1, "static", {outline=maze_line1, bounce=0.5, friction=0.1})
	physics.addBody(maze2, "static", {outline=maze_line2, bountc=0.5, friction=0.1})
	physics.addBody(maze3, "static", {outline=maze_line3, bountc=0.5, friction=0.1})
	physics.addBody(maze4, "static", {outline=maze_line4, bountc=0.5, friction=0.1})
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
