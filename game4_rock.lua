-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth*0.5, display.contentHeight*0.5
	local physics = require("physics")
	math.randomseed(os.time())


	local gravity = 7;
	physics.start()
	physics.setGravity(0, gravity)
	-- physics.setDrawMode( "hybrid" )
	
	local bg = display.newImageRect("image/image3/1-1.png", 1280, 720)
	bg.x, bg.y = cx, cy

	local bg2 = display.newImageRect("image/image3/1-2.png", 1280, 720)
	bg2.x, bg2.y = cx, cy

	sceneGroup:insert(bg2)
	sceneGroup:insert(bg)

	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites45.png", { width = 100, height = 166, numFrames = 4})
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
	sceneGroup:insert(nero)
	physics.addBody(nero, "static", {bounce = 0, friction = 0})

	local time = 60

	local text_num = display.newText(
	{	text = "남은 시간 : "..tostring(time),
		x = 1150,
		y = 50,
		font = "fonts/SeoulNamsanB.ttf",
		fontSize = 25 })
	text_num:setFillColor(0)
	sceneGroup:insert(text_num)

	local count = 1
	local obs = { }

	local rock_img = {"image/image3/stone1.png", "image/image3/stone2.png", "image/image3/stone3.png"}
	local rock_line = {graphics.newOutline(10, rock_img[1]), graphics.newOutline(10, rock_img[2]), graphics.newOutline(10, rock_img[3])}
	

	local function create_rock()
		
		local n = math.random(1, 3)
		obs[count] = display.newImageRect(rock_img[n], 1004 * 0.1, 576 * 0.1)
		obs[count].x, obs[count].y = cx + math.random(-650, 650), 20
		sceneGroup:insert(obs[count])
		physics.addBody(obs[count], {bounce = 0, outline = rock_line[n]})
		count = count + 1
	end

	local t1 = timer.performWithDelay(math.random(500, 1000), create_rock, -1)
	local t2 = timer.performWithDelay(math.random(1000, 1500), create_rock, -1)


	local function faster()
		gravity = gravity + 2
		physics.setGravity(0, gravity)
	end
	
	local ft = timer.performWithDelay(15000, faster, -1)
	
	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.moveBy(nero, { x = 1280 - nero.x, time = (1280 - nero.x) * 5 })			
			elseif (event.keyName == "left") then
				nero:setSequence("walkLeft")
				nero:play()
				transition.moveBy(nero, {x = -nero.x, time = nero.x * 5})
			end
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
		end
	end

	Runtime:addEventListener("key", move)
	
	local gt

	local function nextScene( result )
		transition.cancel(nero)
		nero:pause()
		nero:removeSelf()
		timer.pause(t1)
		timer.pause(t2)
		timer.pause(ft)
		timer.pause(gt)
		Runtime:removeEventListener("key", move)
		if (result == "fail") then
			composer.gotoScene("game4_fail", {effect = "fade", time = 900})
		else
			composer.gotoScene("map2_2", {effect = "fade", time = 900})
		end
	end


	local function gameTimer()
		time = time - 1
		if (time == 0) then	
			nextScene("succes")
		end
		text_num.text = "남은 시간 : "..tostring(time)
	end

	gt = timer.performWithDelay(1000, gameTimer, -1)

	local function collision( self, event )
		if (event.phase == "began") then
			nextScene("fail")
		elseif (event.phase == "ended") then
		end
	end

	nero.collision = collision
	nero:addEventListener("collision")
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
		composer.removeScene("game4_rock")
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