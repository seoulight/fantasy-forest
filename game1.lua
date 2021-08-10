-----------------------------------------------------------------------------------------
--
-- game1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local bg = display.newImageRect("image1_1/bg_puzzle.png", 1280, 720)
	bg.x, bg.y = display.contentWidth*0.5, display.contentHeight*0.5
	sceneGroup:insert(bg)
	
	local piece = { }
	local pieceGroup = display.newGroup()
	local puzzleImg = {"image1_1/1.png", "image1_1/2.png", "image1_1/3.png", "image1_1/4.png", "image1_1/5.png", 
						"image1_1/6.png", "image1_1/7.png", "image1_1/8.png", "image1_1/9.png", "image1_1/10.png", 
						"image1_1/11.png", "image1_1/12.png", "image1_1/13.png", "image1_1/14.png", "image1_1/15.png", 
						"image1_1/16.png", "image1_1/17.png", "image1_1/18.png", "image1_1/19.png", "image1_1/20.png", 
						"image1_1/21.png", "image1_1/22.png", "image1_1/23.png", "image1_1/24.png", "image1_1/25.png", 
	}

	for i = 1, 25 do
		piece[i] = display.newImageRect(pieceGroup, puzzleImg[i], 240, 240)
		piece[i].x, piece[i].y = bg.x + math.random(-300, 300), bg.y + math.random(-300, 300)
	end

	sceneGroup:insert(pieceGroup)

	-- 퍼즐 맞추기 --
	local function match( event )
		if ( event.phase == "began" ) then
			display.getCurrentStage():setFocus( event.target )
			event.target.isFocus = true
		elseif ( event.phase == "moved" ) then
			if ( event.target.isFocus ) then
				event.target.x = event.xStart + event.xDelta
				event.target.y = event.yStart + event.yDelta
			end
		elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
			if ( event.target.isFocus ) then
				display.getCurrentStage():setFocus( nil )
				event.target.isFocus = false
			end
			display.getCurrentStage():setFocus( nil )
			event.target.isFocus = false
		end
	end
	
    for i = 1, 25 do
		piece[i]:addEventListener("touch", match)
	end

	-- 조각끼리 맞았을 때 



	-- 다 맞추면 흐려지면서 완성본으로 전환
	--[[local function nextView( event )
		local options = {
					    effect = "fade",
					    time = 900
					}
    	composer.gotoScene("game1_ending", options)
 	 end

 	 bg:addEventListener("tap", nextView)]] --임의로 설정. 다 맞추면 혹은 탭하면 넘어가게
	
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
