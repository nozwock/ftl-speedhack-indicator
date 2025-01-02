local speedHackImg = Hyperspace.Resources:GetImageId("statusUI/speedhack.png")
local whiteColor = Graphics.GL_Color(1, 1, 1, 1)

-- References-
-- FTL Insurrection+ for Hyperspace- speedcontrol.lua, events.xml:351, events.xml:396

script.on_init(function()
	-- Metavars needs be accessed on init seemingly, will give wrong value otherwise
	Hyperspace.FPS.speedLevel = Hyperspace.metaVariables.speedHackIndicatorSpeedLevel
	Hyperspace.FPS.speedEnabled = false
end)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function()
	local speedLevel = Hyperspace.FPS.speedLevel
	if Hyperspace.FPS.speedEnabled and speedLevel ~= 0 then
		Hyperspace.metaVariables.speedHackIndicatorSpeedLevel = speedLevel
		Hyperspace.Resources:RenderImage(speedHackImg, 1218, 622, 0, whiteColor, 1.0, false)
	end
end, function() end)

-- todo: tooltip
