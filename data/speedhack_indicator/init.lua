---@class GL_Texture

---@class Point
---@field x integer
---@field y integer

---@class Image
---@field data? ImageData
local Image = {}

do
	local imageMetaTable = { __index = Image }
	local defaultColor = Graphics.GL_Color(1, 1, 1, 1)

	---@param texture GL_Texture
	---@param position Point
	function Image.new(texture, position)
		local img = {
			---@class ImageData
			data = {
				texture = texture,
				position = position,
			},
		}
		setmetatable(img, imageMetaTable)
		---@cast img Image

		return img
	end

	function Image:render()
		if not self.data then
			log("Can't render an image without texture and position")
			return
		end
		Hyperspace.Resources:RenderImage(
			self.data.texture,
			self.data.position.x,
			self.data.position.y,
			0,
			defaultColor,
			1,
			false
		)
	end
end

local Global = Hyperspace.Global.GetInstance()
local CApp = Global:GetCApp()

---@param text string
---@param x integer
---@param y integer
---@param width integer
---@param height integer
---@param show_on_menu_pause? boolean
local function renderTooltip(text, x, y, width, height, show_on_menu_pause)
	if not show_on_menu_pause and CApp.gui.menu_pause then
		return
	end

	local mousePos = Hyperspace.Mouse.position
	if (mousePos.x >= x and mousePos.x <= x + width) and (mousePos.y >= y and mousePos.y <= y + height) then
		Hyperspace.Mouse:SetTooltip(text)
	end
end

local indicatorImage = Image.new(Hyperspace.Resources:GetImageId("statusUI/speedhack.png"), Hyperspace.Point(1218, 622))
local indicatorImageSize = Hyperspace.Point(32, 33)

-- References-
-- FTL Insurrection+ for Hyperspace- speedcontrol.lua, events.xml:351, events.xml:396

script.on_init(function()
	-- Seemingly, metavars needs to be accessed on init, they'll give wrong value otherwise
	Hyperspace.FPS.speedLevel = Hyperspace.metaVariables.speedHackIndicatorSpeedLevel
	Hyperspace.FPS.speedEnabled = false
end)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function()
	local speedLevel = Hyperspace.FPS.speedLevel
	if Hyperspace.FPS.speedEnabled and speedLevel ~= 0 then
		Hyperspace.metaVariables.speedHackIndicatorSpeedLevel = speedLevel

		indicatorImage:render()
		renderTooltip(
			string.format("Speed Level: %dx", speedLevel),
			indicatorImage.data.position.x,
			indicatorImage.data.position.y,
			indicatorImageSize.x,
			indicatorImageSize.y
		)
	end
end, function() end)
