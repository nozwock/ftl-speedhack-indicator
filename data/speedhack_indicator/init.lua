local speedHackImg = Hyperspace.Resources:GetImageId("statusUI/speedhack.png")
local whiteColor = Graphics.GL_Color(1, 1, 1, 1)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function()
	if Hyperspace.FPS.speedEnabled and Hyperspace.FPS.speedLevel ~= 0 then
		Hyperspace.Resources:RenderImage(speedHackImg, 1208, 606, 0, whiteColor, 1.0, false)
	end
end, function() end)
