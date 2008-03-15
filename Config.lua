

if not Squeenix then return end
local Squeenix = Squeenix


----------------------
--      Locals      --
----------------------

local tekcheck = LibStub("tekKonfig-Checkbox")
local tekbutton = LibStub("tekKonfig-Button")
local tekslider = LibStub("tekKonfig-Slider")
local GAP = 8


---------------------
--      Panel      --
---------------------

local frame = CreateFrame("Frame", nil, UIParent)
frame.name = "Squeenix"
frame:Hide()
frame:SetScript("OnShow", function(frame)
	local Squeenix = Squeenix
	local title, subtitle = LibStub("tekKonfig-Heading").new(frame, "Squeenix", "General settings for the Squeenix square minimap.")


	local lockpos = tekcheck.new(frame, nil, "Lock minimap", "TOPLEFT", subtitle, "BOTTOMLEFT", -2, -GAP)
	lockpos.tiptext = "Locks the minimap to prevent accidental movement"
	local checksound = lockpos:GetScript("OnClick")
	lockpos:SetScript("OnClick", function(self) checksound(self); Squeenix.db.unlocked = not Squeenix.db.unlocked; Squeenix:SetPosition() end)
	lockpos:SetChecked(not Squeenix.db.unlocked)


	local resetpos = tekbutton.new_small(frame, "TOP", lockpos, "CENTER", 0, 11)
	resetpos:SetPoint("RIGHT", -16, 0)
	resetpos:SetText("Reset")
	resetpos.tiptext = "Reset the minimap to the default position"
	resetpos:SetScript("OnClick", function(self) Squeenix.db.x, Squeenix.db.y, Squeenix.db.anchorframe, Squeenix.db.anchor = nil; Squeenix:SetPosition() end)


	local showcompass = tekcheck.new(frame, nil, "Show full compass", "TOPLEFT", lockpos, "BOTTOMLEFT", 0, -GAP)
	showcompass.tiptext = "Add 'ESW' compass directions to the map"
	showcompass:SetScript("OnClick", function(self) checksound(self); Squeenix.db.hidecompass = not Squeenix.db.hidecompass; Squeenix:ShowCompass() end)
	showcompass:SetChecked(not Squeenix.db.hidecompass)


--~ 	local threshslider, threshslidertext, threshcontainer = tekslider.new(frame, "Break Threshold: "..ControlFreak.db.char.breakthreshold.." sec", 0, 10, "LEFT", frame, "TOP", GAP, 0)
--~ 	threshcontainer:SetPoint("TOP", lockpos, "TOP", 0, 0)
--~ 	threshslider.tiptext = "Time (in seconds) before spell breaks to unfade frame."
--~ 	threshslider:SetValue(ControlFreak.db.char.breakthreshold)
--~ 	threshslider:SetValueStep(1)
--~ 	threshslider:SetScript("OnValueChanged", function()
--~ 		ControlFreak.db.char.breakthreshold = threshslider:GetValue()
--~ 		threshslidertext:SetText("Break Threshold: "..ControlFreak.db.char.breakthreshold.." sec")
--~ 	end)


--~ 	local alpha = math.floor(ControlFreak.db.char.alpha*100 + .5)
--~ 	local alphaslider, alphaslidertext = tekslider.new(frame, "Alpha: "..alpha.."%", "0%", "100%", "TOP", threshcontainer, "BOTTOM", 0, -GAP)
--~ 	alphaslider.tiptext = "Alpha level to fade frame to when focus is controlled, dead, or not set."
--~ 	alphaslider:SetValue(ControlFreak.db.char.alpha)
--~ 	alphaslider:SetValueStep(0.05)
--~ 	alphaslider:SetScript("OnValueChanged", function()
--~ 		ControlFreak.db.char.alpha = alphaslider:GetValue()
--~ 		local alpha = math.floor(ControlFreak.db.char.alpha*100 + .5)
--~ 		alphaslidertext:SetText("Alpha: "..alpha.."%")
--~ 		ControlFreak:OnUpdate(true)
--~ 	end)


	frame:SetScript("OnShow", LibStub("tekKonfig-FadeIn").FadeIn)
	LibStub("tekKonfig-FadeIn").FadeIn(frame)
end)

InterfaceOptions_AddCategory(frame)


-----------------------------
--      Slash command      --
-----------------------------

SLASH_SQUEENIX1 = "/squee"
SLASH_SQUEENIX2 = "/squeenix"
SlashCmdList.SQUEENIX = function() InterfaceOptionsFrame_OpenToFrame(frame) end

