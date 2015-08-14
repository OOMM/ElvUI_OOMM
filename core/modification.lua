--[[
	This is a framework showing how to create a plugin for ElvUI.
	It creates some default options and inserts a GUI table to the ElvUI Config.
	If you have questions then ask in the Tukui lua section: http://www.tukui.org/forums/forum.php?id=27
]]

local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local OOMM = E:NewModule('OOMMName', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0'); --Create a plugin within ElvUI and adopt AceHook-3.0, AceEvent-3.0 and AceTimer-3.0. We can make use of these later.
local EP = LibStub("LibElvUIPlugin-1.0") --We can use this to automatically insert our GUI tables when ElvUI_Config is loaded.
local addonName, addonTable = ... --See http://www.wowinterface.com/forums/showthread.php?t=51502&p=304704&postcount=2

--Default options
P["OOMM"] = {
	["BagPositionToggle"] = true,

}

--Function we can call when a setting changes.
--In this case it just checks if "BagPositionToggle" is enabled. If it is it prints the value of "SomeRangeOption", otherwise it tells you that "BagPositionToggle" is disabled.
function OOMM:Update()
	local enabled = E.db.OOMM.BagPositionToggle
	
	if enabled then
		print(range)
    hooksecurefunc("UpdateContainerFrameAnchors", function() 
    ContainerFrame1:SetPoint('BOTTOMRIGHT', UIParent, 'BOTTOMRIGHT', -8, 8) 
    for i=2, NUM_CONTAINER_FRAMES do
		_G['ContainerFrame'..i]:SetPoint('BOTTOMRIGHT', _G['ContainerFrame'..i-1], 'BOTTOMRIGHT', (_G['ContainerFrame'..i-1]:GetWidth()*-1)-4, 0) 
	end
    end)
	else
		print("Bag Position is disabled")
	end
end

--This function inserts our GUI table into the ElvUI Config. You can read about AceConfig here: http://www.wowace.com/addons/ace3/pages/ace-config-3-0-options-tables/
function OOMM:InsertOptions()
	E.Options.args.OOMM = {
		order = 100,
		type = "group",
		name = "OOMM",
		args = {
			BagPositionToggle = {
				order = 1,
				type = "toggle",
				name = "Enable OOMM Config",
				get = function(info)
					return E.db.OOMM.BagPositionToggle
				end,
				set = function(info, value)
					E.db.OOMM.BagPositionToggle = value
					OOMM:Update() --We changed a setting, call our Update function
				end,
			},
		},
	}
end

function OOMM:Initialize()
	--Register plugin so options are properly inserted when config is loaded
	EP:RegisterPlugin(addonName, OOMM.InsertOptions)
  OOMM:Update()
end

E:RegisterModule(OOMM:GetName()) --Register the module with ElvUI. ElvUI will now call OOMM:Initialize() when ElvUI is ready to load our plugin.