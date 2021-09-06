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

	physics.start()
	physics.setGravity(0, 5)
	physics.setDrawMode( "hybrid" )
	
	local bg = display.newImageRect("image/image3/1-1.png", 1280, 720)
	bg.x, bg.y = cx, cy

	local bg2 = display.newImageRect("image/image3/1-2.png", 1280, 720)
	bg2.x, bg2.y = cx, cy

	sceneGroup:insert(bg2)
	sceneGroup:insert(bg)

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
	sceneGroup:insert(nero)

	physics.addBody(nero, "static", {bounce = 0, friction = 0});

	-- local rock = display.newImageRect("image/image3/stone1.png", 1004 * 0.1, 576 * 0.1)
	-- rock.x, rock.y = nero.x, 20
	-- sceneGroup:insert(rock)

	-- physics.addBody(rock, {bounce = 0, friction = 0})

	local rock_img = {"image/image3/stone1.png", "image/image3/stone2.png", "image/image3/stone3.png"}
	
	local function create_rock()
		
	end


	local function move( event )
		if (event.phase == "down") then
			if (event.keyName == "right") then
				nero:setSequence("walkRight")
				nero:play()
				transition.moveBy(nero, { x = 1280 - nero.x, time = (1280 - nero.x) * 7 })			
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

	local function collision( self, event )
		if (event.phase == "began") then
			physics.stop()
			local black = display.newRect(cx, cy, 1280, 720)
			sceneGroup:insert(black)
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