-- 첫번째 장면

local composer = require( "composer" )
local physics = require( "physics" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	-- local character_sheet = graphics.newImageSheet("image/char/character_sprites.png", { width = 300, height = 500, numFrames = 2})
	-- local sequences_character = {
	-- 	{
	-- 		name = "walking",
	-- 		start = 1,
	-- 		count = 2,
	-- 		time = 500,
	-- 		loopCount = 0,
	-- 		loopDirection = "forward"
	-- 	}
	-- }
	-- local character = display.newSprite(character_sheet, sequences_character)
	-- character.x, character.y = display.contentWidth * 0.2, display.contentHeight * 0.6
	
	-- local block = display.newImageRect("image/image1/1.png", 400, 400);
	-- block.x, block.y = display.contentWidth * 0.2, display.contentHeight * 0.9

	-- 네로 줄이기
	-- transition.scaleTo(character, {xScale = 0.4, yScale = 0.4, time = 0})

	physics.start()
	physics.setDrawMode( "hybrid" )
 
	-- Create ground object
	local cw, ch = display.actualContentWidth, display.actualContentHeight
	local ground = display.newRect( display.contentCenterX, ch-64, cw, 64 )
	ground:setFillColor( 0.4, 0.4, 0.8 )
	ground.objType = "ground"
	physics.addBody( ground, "static", { bounce=0.0, friction=0.3 } )
	-- physics.addBody( character, "dynamic", { density = 1.0, bounce=0.0 },  { box={ halfWidth=30, halfHeight=10, x=0, y=60 }, isSensor=true })
	-- character.isFixedRotation = true
	-- character.sensoroverlaps = 0
	-- physics.addBody( block, "static", { density= 1.0, friction=0.1, bounce=0.2 } )


	-- Create character
	local character = display.newRect( display.contentCenterX, ground.y-150, 80, 120 )
	character:setFillColor( 1, 0.2, 0.4 )
	
	physics.addBody( character, "dynamic",
		{ density=1.0, bounce=0.0 },  -- Main body element
		{ box={ halfWidth=30, halfHeight=10, x=0, y=60 }, isSensor=true }  -- Foot sensor element
	)
	character.isFixedRotation = true
	character.sensorOverlaps = 0

	

	-- local function move( event )
	-- 	if (event.phase == "down" and event.keyName == "right") then
	-- 		local vx, vy = character:getLinearVelocity()
	-- 		character:play()
	-- 		-- transition.to(character, {x = character.x + 1000, time = 7000})
	-- 		character:setLinearVelocity(vx + 40, 0)

	-- 	elseif (event.phase == "up") then
	-- 		transition.cancel(character) -- 이동 정지
	-- 		character:pause()
	-- 		character:setFrame(1)
	-- 	end
	-- end

	-- Runtime:addEventListener("key", move)
	

	local function touchAction( event )
 
		if ( event.phase == "began" and character.sensorOverlaps > 0 ) then
			-- Jump procedure here
			local vx, vy = character:getLinearVelocity()
			character:setLinearVelocity( vx, 0 )
			character:applyLinearImpulse( nil, -75, character.x, character.y )
		end
	end
	Runtime:addEventListener( "touch", touchAction )

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
	-- Associate collision handler function with character
	character.collision = sensorCollide
	character:addEventListener( "collision" )
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
