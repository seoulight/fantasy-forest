-- 첫번째 장면

local composer = require( "composer" )
local physics = require( "physics" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local nero_sheet = graphics.newImageSheet("image/char/nero_sprites.png", { width = 300, height = 500, numFrames = 2})
	local sequences_nero = {
		{
			name = "walking",
			start = 1,
			count = 2,
			time = 500,
			loopCount = 0,
			loopDirection = "forward"
		}
	}
	local nero = display.newSprite(nero_sheet, sequences_nero)
	nero.x, nero.y = display.contentWidth * 0.2, display.contentHeight * 0.4
	
	local block = display.newImageRect("image/image1/1.png", 400, 400);
	block.x, block.y = display.contentWidth * 0.7, display.contentHeight * 0.4

	--네로 줄이기
	transition.scaleTo(nero, {xScale = 0.4, yScale = 0.4, time = 0})


	physics.start()
	physics.addBody(nero, "static", { friction = 0.2, bounce = 0.1})
	physics.addBody(block, "static", { friction = 0.3, bounce = 0.1})
 

	

	local function move( event )
		if (event.phase == "down" and event.keyName == "right") then
			nero:play()
			transition.to(nero, {x = nero.x + 1000, time = 7000})
		elseif (event.phase == "up") then
			transition.cancel(nero) -- 이동 정지
			nero:pause()
			nero:setFrame(1)
		end
	end

	Runtime:addEventListener("key", move)
	

	-- local function touchAction( event )
 
	-- 	if ( event.phase == "began" and nero.sensorOverlaps > 0 ) then
	-- 		-- Jump procedure here
	-- 		local vx, vy = nero:getLinearVelocity()
	-- 		nero:setLinearVelocity( vx, 0 )
	-- 		nero:applyLinearImpulse( nil, -75, nero.x, nero.y )
	-- 	end
	-- end
	-- Runtime:addEventListener( "touch", touchAction )

	local function sensorCollide( self, event )
 
		-- Confirm that the colliding elements are the foot sensor and a ground object
		if ( event.selfElement == 2 and event.other.objType == "ground" ) then
	 
			-- Foot sensor has entered (overlapped) a ground object
			if ( event.phase == "began" ) then
				self.sensorOverlaps = self.sensorOverlaps + 1
			-- Foot sensor has exited a ground object
			elseif ( event.phase == "ended" ) then
				self.sensorOverlaps = self.sensorOverlaps - 1
			end
		end
	end
	-- Associate collision handler function with nero
	nero.collision = sensorCollide
	nero:addEventListener( "collision" )
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
		composer.removeScene("view1")
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
