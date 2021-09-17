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

	local nero1 = display.newSprite(nero_sheet1, sequences_nero)
	nero1.x, nero1.y = cx, display.contentHeight * 0.06
	sceneGroup:insert(nero1)

	local nero2 = display.newSprite(nero_sheet2, sequences_nero)
	nero2.alpha = 0
	sceneGroup:insert(nero2)

	local item = display.newImageRect("image/item/orange.png", 75, 75)
	item.x, item.y = cx - 200, cy * 0.24
	sceneGroup:insert(item)

	-- 방향키 입력시 움직이는 이벤트리스너

	-- 작아진 후
	local function move2( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero2:setSequence("walkRight")
				nero2:play()
				transition.to(nero2, {x = nero2.x + 15, time = 20})
			elseif (event.keyName == "left") then
				nero2:setSequence("walkLeft")
				nero2:play()
				transition.to(nero2, {x = nero2.x - 15, time = 20})
			elseif (event.keyName == "up") then
				nero2:play()
				transition.to(nero2, {y = nero2.y - 15, time = 20})
			elseif (event.keyName == "down") then
				nero2:play()
				transition.to(nero2, {y = nero2.y + 15, time = 20})
				if (nero2.y > 715) then
					Runtime:removeEventListener("key", move2)
					physics.stop()
					composer.gotoScene("map1_3", { effect = "fade", time = 500 })
				end
			end
		elseif (event.phase == "up") then
			transition.cancel(nero2) -- 이동 정지
			nero2:pause()
		end
	end

	-- 클 때
	local function move1( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero1:setSequence("walkRight")
				nero1:play()
				transition.moveBy(nero1, {x = 1280 - nero1.x, time = (1280 - nero1.x) * 7})
			elseif (event.keyName == "left") then
				nero1:setSequence("walkLeft")
				nero1:play()
				transition.moveBy(nero1, {x = -(nero1.x - item.x), time = (nero1.x - item.x) * 7})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero1) 
			nero1:pause()
			if (nero1.x <= item.x) then
				local item_bg = display.newRect(cx, cy, 1280, 720)
				item_bg:setFillColor(0)
				item_bg.alpha = 0
				sceneGroup:insert(item_bg)
				
				local item_name = display.newImageRect("image/item/orange_name.png", 848 * 0.7, 275 * 0.7)
				item_name.x, item_name.y = cx, cy * 0.5
				item_name.alpha = 0
				sceneGroup:insert(item_name)
				
				local item2 = display.newImageRect("image/item/orange.png", 300, 300)
				item2.x, item2.y = cx, cy
				item2.alpha = 0
				sceneGroup:insert(item2)

				local options = 
				{
					text = "누군가 마시다 만 흔적이 있다..\n몸을 가볍게 해준다. ▼",     
					x = cx,
					y = cy * 1.6,
					width = 400,
					font = "fonts/SeoulNamsanB.ttf",   
					fontSize = 25,
					align = "center"  -- Alignment parameter
				}
				local item_desc = display.newText(options)
				item_desc:setFillColor(0.9)
				item_desc.alpha = 0
				sceneGroup:insert(item_desc)

				transition.to(item_bg, {effect = "fade", alpha = 0.8, time = 800})
				transition.to(item_name, {delay = 800, effect = "fade", alpha = 1, time = 1000})
				transition.fadeIn(item2, {delay = 800, time = 1000})
				transition.fadeIn(item_desc, {delay = 1800, time = 1000})


				local function itemTap( event )
					sceneGroup:remove(item_bg)
					sceneGroup:remove(item2)
					sceneGroup:remove(item_name)
					sceneGroup:remove(item_desc)

					nero2.x, nero2.y = nero1.x, 720 * 0.15
					sceneGroup:remove(nero1)
					sceneGroup:remove(item)
					nero2.alpha = 1
					Runtime:removeEventListener("key", move1)
					Runtime:addEventListener("key", move2)
					physics.addBody(nero2, "dynamic", {bounce = 0.2, friction = 0.1})

					local wall1 = display.newRect(340, 60, 120, 120)
					wall1.alpha = 0
					sceneGroup:insert(wall1)

					local wall2 = display.newRect(940, 60, 120, 120)
					wall2.alpha = 0
					sceneGroup:insert(wall2)

					local wall3 = display.newRect(340, 660, 120, 120)
					wall3.alpha = 0
					sceneGroup:insert(wall3)

					local wall4 = display.newRect(940, 660, 120, 120)
					wall4.alpha = 0
					sceneGroup:insert(wall4)

					physics.addBody(wall1, "static", {bounce = 0.5, friction = 0.1})
					physics.addBody(wall2, "static", {bounce = 0.5, friction = 0.1})
					physics.addBody(wall3, "static", {bounce = 0.5, friction = 0.1})
					physics.addBody(wall4, "static", {bounce = 0.5, friction = 0.1})
				end

				local function tap_event()
					item_bg:addEventListener("tap", itemTap)
				end

				timer.performWithDelay(2800, tap_event)
			end
		end
	end

	Runtime:addEventListener("key", move1)

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
