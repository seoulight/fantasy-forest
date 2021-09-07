-----------------------------------------------------------------------------------------
--
-- map3_6.lua
-- 색 돌아오는 장면
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5
	
	local bg = display.newImageRect("image/image2/4-1.png", 1280, 720)
	bg.x, bg.y = cx, cy
	sceneGroup:insert(bg)

	local bg2 = display.newImageRect("image/image2/4-2.png", 1280, 720)
	bg2.x, bg2.y = cx, cy
	sceneGroup:insert(bg2)
	bg2.alpha = 0

	transition.fadeIn(bg2, {delay = 2200, time = 2000, alpha = 1})

	-- 네로 캐릭터
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
	nero.x, nero.y = 400, display.contentHeight * 0.8
	sceneGroup:insert(nero)

	-- 언니 인어 --
	local m1 = display.newImageRect("image/image2/m1_smile.png", 577 * 0.35, 856 * 0.35)
	m1.x, m1.y = display.contentWidth * 0.65, display.contentHeight * 0.7
	sceneGroup:insert(m1)

	-- 막내 인어 --
	local m5 = display.newImageRect("image/image2/m2_smile.png", 483 * 0.35, 856 * 0.35)
	m5.x, m5.y = display.contentWidth * 0.78, display.contentHeight * 0.7
	sceneGroup:insert(m5)

	local w2 = display.newImageRect("image/image2/witch_smile.png", 664 * 0.35, 1080 * 0.35)
	w2.x, w2.y = display.contentWidth * 0.9, display.contentHeight * 0.7
	sceneGroup:insert(w2)

	local function gotoGame()
		composer.gotoScene("game3_puzzle", { effect = "fade", time = 900 })
	end
	bg2:addEventListener("tap", gotoGame)

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
		composer.removeScene("map3_6")
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