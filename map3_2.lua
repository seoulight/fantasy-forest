-----------------------------------------------------------------------------------------
--
-- map3_2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	local cx, cy = display.contentWidth * 0.5, display.contentHeight * 0.5
	

	-- 아이템 이미지 파일 목록
	local item_img = {"image/item/깨진램프.png", "image/item/낡은유리병편지.png", "image/item/녹슨회중시계.png", "image/item/빛바랜거울.png",
	"image/item/얼룩진동전.png", "image/item/작은티아라.png", "image/item/푸른진주목걸이.png"}
	-- 아이템 이름 이미지 파일 목록
	local title_img = {"image/item/깨진램프_타이틀.png", "image/item/낡은유리병편지_타이틀.png", "image/item/녹슨회중시계_타이틀.png",
	"image/item/빛바랜거울_타이틀.png", "image/item/얼룩진동전_타이틀.png", "image/item/작은티아라_타이틀.png", "image/item/푸른진주목걸이_타이틀.png"}

	item = {}
	item_pos = {{659, 655}, {1176, 563}, {515, 534}, {316, 185}, {95, 225}, {288, 501}, {1004, 562}}
	title = {}
	-- 아이템 설명 텍스트
	item_text = {"설명1", "설명2", "설명3", "설명4", "설명5", "설명6", "설명7"}
	text_obj = {}
	for i = 1, 7 do
		item[i] = display.newImageRect(item_img[i], 100, 100)
		item[i].name = i
		item[i].x, item[i].y = item_pos[i][1], item_pos[i][2]
		sceneGroup:insert(item[i])

		title[i] = display.newImageRect(title_img[i], 848 * 0.8, 275 * 0.8)
		title[i].x, title[i].y = cx, cy * 0.5
		title[i].alpha = 0
		sceneGroup:insert(title[i])

		text_obj[i] = display.newText(
		{
			text = item_text[i],
			x = cx,
			y = cy * 1.6,
			width = 400,
			font = "fonts/SeoulNamsanB.ttf",
			fontSize = 25,
			align = "center"  -- Alignment parameter
		} )
		text_obj[i]:setFillColor(0.9)
		text_obj[i].alpha = 0
		sceneGroup:insert(text_obj[i])
	end

	local layer_img = {"image/image2/2-5.png", "image/image2/2-4.png", "image/image2/2-3.png", "image/image2/2-2.png",
	"image/image2/2-1.png"}
	local layer = {}

	for i = 1, 5 do
		layer[i] = display.newImageRect(layer_img[i], 1280, 720)
		layer[i].x, layer[i].y = cx, cy
		sceneGroup:insert(layer[i])
	end
	
	sceneGroup:insert(1, layer[2])
	sceneGroup:insert(1, layer[1])
	transition.to(item[6], {time = 0, rotation = -45})
	transition.to(item[1], {time = 0, rotation = -30})

	local find_num = 7

	local text_num = display.newText(
	{	text = "찾아야 할 물건 : "..tostring(find_num),
		x = 1150,
		y = 50,
		font = "fonts/SeoulNamsanB.ttf",
		fontSize = 25 })
	text_num:setFillColor(0)
	sceneGroup:insert(text_num)

	local item_bg = display.newRect(cx, cy, 1280, 720)
	item_bg:setFillColor(0.3)
	item_bg.alpha = 0
	sceneGroup:insert(item_bg)
	
	local function textChange()
		find_num = find_num - 1
		text_num.text = "찾아야 할 물건 : "..tostring(find_num)
	end

	local function pick( event )
		local obj = event.target
		local idx = obj.name
		
		print(idx)
		
		sceneGroup:remove( item[idx] )
		item_bg.alpha = 0.9
		
		title[idx].alpha = 1
		title[idx]:toFront()
		
		item[idx] = display.newImageRect(item_img[idx], 300, 300)
		item[idx].x, item[idx].y = cx, cy
		sceneGroup:insert(item[idx])
		
		text_obj[idx].alpha = 1
		text_obj[idx]:toFront()
		
		-- 아이템 설명 화면에서 탭 누르면 화면 사라짐
		local function hide_item( event )
			item_bg:removeEventListener("tap", hide_item)
			item_bg.alpha = 0
			title[idx].alpha = 0
			item[idx].alpha = 0
			text_obj[idx].alpha = 0
			textChange()
		end

		item_bg:addEventListener("tap", hide_item)
	end

	for i = 1, 7 do
		item[i]:addEventListener("tap", pick)
	end

	-- 좌표 알아내기용 이벤트
	-- local function tab( event )
	-- 	if ( event.phase == "began" ) then
	-- 		print("touched")
	-- 	elseif ( event.phase == "moved" ) then
	-- 		print(event.x .. ", " .. event.y)
	-- 	elseif ( event.phase == "ended") then
	-- 		print("ended")
	-- 	end
	-- 	return true
	-- end

	-- layer[5]:addEventListener("touch", tab)

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
		composer.removeScene("map3_2")
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