-----------------------------------------------------------------------------------------
--
-- game1.puzzle.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local centerX, centerY = display.contentWidth * 0.5, display.contentHeight * 0.5
	
	local bg = display.newImageRect("image/image1_1/bg_puzzle.png", 1280, 720)
	bg.x, bg.y = centerX, centerY
	sceneGroup:insert(bg)
	
	-- 퍼즐판
	local boardGroup = display.newGroup()
	local rects = { }

	local newX = centerX - 240
	local newY = centerY - 240
	for i = 1, 25 do
		rects[i] = display.newRect(boardGroup, newX, newY, 120, 120)
		rects[i]:setFillColor(0.5)
		newX = newX + 120
		if i % 5 == 0 then
			newX = newX - 600
			newY = newY + 120
		end
	end

	sceneGroup:insert(boardGroup)

	-- 퍼즐 조각
	local piece = { }
	local pieceGroup = display.newGroup()
	local puzzleImg = {"image/image1_1/1.png", "image/image1_1/2.png", "image/image1_1/3.png", "image/image1_1/4.png", "image/image1_1/5.png", 
						"image/image1_1/6.png", "image/image1_1/7.png", "image/image1_1/8.png", "image/image1_1/9.png", "image/image1_1/10.png", 
						"image/image1_1/11.png", "image/image1_1/12.png", "image/image1_1/13.png", "image/image1_1/14.png", "image/image1_1/15.png", 
						"image/image1_1/16.png", "image/image1_1/17.png", "image/image1_1/18.png", "image/image1_1/19.png", "image/image1_1/20.png", 
						"image/image1_1/21.png", "image/image1_1/22.png", "image/image1_1/23.png", "image/image1_1/24.png", "image/image1_1/25.png"
					}

	
	for i = 1, 25 do
		piece[i] = display.newImageRect(pieceGroup, puzzleImg[i], 240, 240)
		piece[i].x, piece[i].y = bg.x + math.random(-500, 500), bg.y + math.random(-300, 300)
		piece[i].name = i;
	end

	sceneGroup:insert(pieceGroup)

	-- 다 맞추면 흐려지면서 완성본으로 전환
	local function complete()
		local rose = display.newImageRect("image/image1_1/rose.png", 600, 600);
		rose.x, rose.y = centerX, centerY
		sceneGroup:insert(rose)
		rose.alpha = 0
		transition.fadeOut(pieceGroup, {time = 700})
		transition.fadeIn(rose, {time = 800})
		composer.gotoScene("game1_ending")
 	end

	-- 퍼즐 조각이 제대로된 위치인지 확인, 퍼즐이 완성되면 다음 장면으로 넘어가는 함수 포출
	local cnt = 0
	local function correct( target )
		local num = target.name
		if target.x <= rects[num].x + 10 and target.x >= rects[num].x - 10
		and target.y <= rects[num].y + 10 and target.y >= rects[num].y - 10 then
			target.x, target.y = rects[num].x, rects[num].y
			pieceGroup:insert(1, target) -- 다른 퍼즐조각보다 아래 있도록 옮김
			target:removeEventListener("touch", match)
			cnt = cnt + 1
			if cnt == 25 then
				complete()
			end
		end
	end

	-- 퍼즐 맞추기 --
	function match( event )
		local object = event.target;
		if ( event.phase == "began") then
			display.getCurrentStage():setFocus( object )
			object.isFocus = true
		elseif ( event.phase == "moved" ) then
			if ( object.isFocus ) then
				object.x = event.xStart + event.xDelta
				object.y = event.yStart + event.yDelta
			end
		elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
			correct(object)
			display.getCurrentStage():setFocus( nil )
			object.isFocus = false
		end
	end
	
    for i = 1, 25 do
		piece[i]:addEventListener("touch", match)
	end
	
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
