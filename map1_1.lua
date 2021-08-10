-----------------------------------------------------------------------------------------
--
-- map1_1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image/image1/rabbitBurrow.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)

	local player = display.newImageRect("image/player.png", 130, 260)
	player.x, player.y = display.contentWidth*0.1, display.contentHeight*0.41

	--[[ 걷는 모습 - 나중에 추가
	local sheetOptions =
	{
	    width = 512,
	    height = 256,
	    numFrames = 1,
	}

	local sheet_player = graphics.newImageSheet( "image/player.png", sheetOptions )
	]]

	-- 키보드 입력받기: 위 아래 왼쪽 오른쪽 --
	local function move( event )
		
		local move = 50

		if (event.phase == "up") then
			if (event.keyName == "up") then
				player.y = player.y-move
			elseif (event.keyName == "down") then
				player.y = player.y+move
			elseif (event.keyName == "left") then
				player.x = player.x-move
			elseif (event.keyName == "right") then
				player.x = player.x+move
			end
		end

		return false
	end

	Runtime:addEventListener( "key", move )
	sceneGroup:insert( player )

	-- 맵 블록 설치 --
	-- 왼쪽 블록 --
	local b1 = display.newImageRect("image/image1/1.png", 200, 200) 
	b1.x, b1.y = display.contentWidth*0.07, display.contentHeight*0.7

	local b2 = display.newImageRect("image/image1/2.png", 200, 200) 
	b2.x, b2.y = display.contentWidth*0.2, display.contentHeight*0.7

	local b3 = display.newImageRect("image/image1/4.png", 200, 200) 
	b3.x, b3.y = display.contentWidth*0.2, display.contentHeight*0.9

	local b4 = display.newImageRect("image/image1/6.png", 200, 200) 
	b4.x, b4.y = display.contentWidth*0.07, display.contentHeight*0.9

	-- 오른쪽 블록 --
	local b5 = display.newImageRect("image/image1/3.png", 200, 200) 
	b5.x, b5.y = display.contentWidth*0.79, display.contentHeight*0.7

	local b6 = display.newImageRect("image/image1/1.png", 200, 200) 
	b6.x, b6.y = display.contentWidth*0.92, display.contentHeight*0.7

	local b7 = display.newImageRect("image/image1/6.png", 200, 200) 
	b7.x, b7.y = display.contentWidth*0.92, display.contentHeight*0.9

	local b8 = display.newImageRect("image/image1/5.png", 200, 200) 
	b8.x, b8.y = display.contentWidth*0.79, display.contentHeight*0.9

	sceneGroup:insert( b1 )
	sceneGroup:insert( b2 )
	sceneGroup:insert( b3 )
	sceneGroup:insert( b4 )
	sceneGroup:insert( b5 )
	sceneGroup:insert( b6 )
	sceneGroup:insert( b7 )
	sceneGroup:insert( b8 )
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
		composer.removeScene("map1_1")
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