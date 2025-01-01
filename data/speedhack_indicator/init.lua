local speedHackImg = Hyperspace.Resources:GetImageId("statusUI/speedhack.png")
local whiteColor = Graphics.GL_Color(1, 1, 1, 1)

local showIndicator = false

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function()
	if showIndicator then
		Hyperspace.Resources:RenderImage(speedHackImg, 1208, 606, 0, whiteColor, 1.0, false)
	end
end, function() end)

script.on_internal_event(Defines.InternalEvents.ON_TICK, function()
	showIndicator = Hyperspace.FPS.speedEnabled and Hyperspace.FPS.speedLevel ~= 0
end)
