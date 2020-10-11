local myname, Squeenix = ...

Squeenix.borders = {
	["Rounded"] = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16, edgeSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", insets = {left = 5, right = 5, top = 5, bottom = 5}},

	["Square"] = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16, edgeSize = 16,
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", insets = {left = 5, right = 5, top = 5, bottom = 5}},

	["Black"] = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		edgeFile = "", edgeSize = 0, insets = {left = 3, right = 3, top = 3, bottom = 3}},
}

local border = CreateFrame("Button", nil, Minimap, BackdropTemplate)
border:SetPoint("TOPLEFT","Minimap",-5,5)
border:SetPoint("BOTTOMRIGHT","Minimap",5,-5)
border:SetFrameStrata("BACKGROUND")
border:SetFrameLevel(1)

function Squeenix:SetBorder(v) -- TODO: figure out how to apply different border in Shadowlands
	if v then self.db.border = v end
	border:SetAllPoints()
	border.backdropInfo = {
		edgeFile = self.borders[self.db.border or "Rounded"],
		tile = true,
	}
end
