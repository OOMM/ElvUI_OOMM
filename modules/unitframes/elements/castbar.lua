local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local _, mod = ...
local SPELL_SCHOOL_LOG = {}
--Settings
local settings = {
	['hideText'] = {
		['player'] = true,		-- true | false
		['target'] = false,		-- true | false
		['focus'] = true,		-- true | false
		['arena'] = true,		-- true | false
		['boss'] = true,		-- true | false
	},
	['backdropAlpha'] = .2,		-- Number between 0 and 1
	['backdropColor'] = {0.16, 0.16, 0.16},		-- {r, g, b} | 'HEXCODE'
}

--[[
	Don't edit below this line unless you know what you are doing
--]]
local units = {
	['player'] = ElvUF_Player,
	['target'] = ElvUF_Target,
	['focus'] = ElvUF_Focus,
	['pet'] = ElvUF_Pet,
	['targettarget'] = ElvUF_TargetTarget,
	['arena'] = false,
	['boss'] = false,
}

if not CUSTOM_CLASS_COLORS then
  CUSTOM_CLASS_COLORS = {}
  CUSTOM_CLASS_COLORS["DEATHKNIGHT"] = {r = 0.890196078431373,g = 0.203921568627451, b = 0.301960784313726, colorStr = "ffe3344d",}    
  CUSTOM_CLASS_COLORS["WARRIOR"] = {r = 0.835294117647059,g = 0.619607843137255, b = 0.490196078431373, colorStr = "ffd59e7d",}    
  CUSTOM_CLASS_COLORS["PALADIN"] = {r = 1.000000000000000,g = 0.431372549019608, b = 0.713725490196079, colorStr = "ffff6eb6",}    
  CUSTOM_CLASS_COLORS["MAGE"] = {r = 0.364705882352941,g = 0.776470588235294, b = 0.941176470588235, colorStr = "ff5cc5ef",}    
  CUSTOM_CLASS_COLORS["PRIEST"] = {r = 0.854901960784314,g = 0.882352941176471, b = 0.866666666666667, colorStr = "ffdae1dd",}    
  CUSTOM_CLASS_COLORS["WARLOCK"] = {r = 0.662745098039216,g = 0.298039215686275, b = 0.956862745098039, colorStr = "ffa94cf3",}    
  CUSTOM_CLASS_COLORS["ROGUE"] = {r = 1.000000000000000,g = 0.890196078431373, b = 0.415686274509804, colorStr = "ffffe36a",}    
  CUSTOM_CLASS_COLORS["HUNTER"] = {r = 0.63921568627451,g = 0.831372549019608, b = 0.215686274509804, colorStr = "ffa3d437",}    
  CUSTOM_CLASS_COLORS["DRUID"] = {r = 1.000000000000000,g = 0.454901960784314, b = 0.243137254901961, colorStr = "ffff743e",}    
  CUSTOM_CLASS_COLORS["MONK"] = {r = 0.219607843137255,g = 0.850980392156863, b = 0.713725490196079, colorStr = "ff38d9b6",}    
  CUSTOM_CLASS_COLORS["SHAMAN"] = {r = 0.145098039215686,g = 0.396078431372549, b = 0.937254901960784, colorStr = "ff2465ee",}    
end
if not SPELL_SCHOOL_COLORS then
  SPELL_SCHOOL_COLORS = {}
  SPELL_SCHOOL_COLORS[0] = {[1] = "HUNTER"} --DEFAULT
  SPELL_SCHOOL_COLORS[1] = {[1] = "PRIEST"} --PHYSICAL
  SPELL_SCHOOL_COLORS[2] = {[1] = "ROGUE"} -- HOLY
  SPELL_SCHOOL_COLORS[4] = {[1] = "DRUID"} -- FIRE
  SPELL_SCHOOL_COLORS[8] = {[1] = "MONK"} -- NATURE
  SPELL_SCHOOL_COLORS[16] = {[1] = "MAGE"} -- FROST
  SPELL_SCHOOL_COLORS[32] = {[1] = "WARLOCK"} -- SHADOW
  SPELL_SCHOOL_COLORS[64] = {[1] = "PALADIN"} -- ARCANE
  SPELL_SCHOOL_COLORS[3] = {[1] = "ROGUE",[2] = "PRIEST"} -- HOLYSTRIKE
  SPELL_SCHOOL_COLORS[5] = {[1] = "DRUID",[2] = "PRIEST"} -- FLAMESTRIKE
  SPELL_SCHOOL_COLORS[6] = {[1] = "DRUID",[2] = "ROGUE"} -- HOLYFIRE
  SPELL_SCHOOL_COLORS[9] = {[1] = "MONK",[2] = "PRIEST"} -- STORMSTRIKE
  SPELL_SCHOOL_COLORS[10] = {[1] = "MONK",[2] = "ROGUE"} -- HOLYSTORM
  SPELL_SCHOOL_COLORS[12] = {[1] = "MONK",[2] = "DRUID"} -- FIRESTORM
  SPELL_SCHOOL_COLORS[17] = {[1] = "MAGE",[2] = "PRIEST"} -- FROSTSTRIKE
  SPELL_SCHOOL_COLORS[18] = {[1] = "MAGE",[2] = "ROGUE"} -- HOLYFROST
  SPELL_SCHOOL_COLORS[20] = {[1] = "MAGE",[2] = "DRUID"} -- FROSTFIRE
  SPELL_SCHOOL_COLORS[24] = {[1] = "MAGE",[2] = "MONK"} -- FROSTSTORM
  SPELL_SCHOOL_COLORS[33] = {[1] = "WARLOCK",[2] = "PRIEST"} -- SHADOWSTRIKE
  SPELL_SCHOOL_COLORS[34] = {[1] = "WARLOCK",[2] = "ROGUE"} -- SHADOWLIGHT (TWILIGHT)
  SPELL_SCHOOL_COLORS[36] = {[1] = "WARLOCK",[2] = "DRUID"} -- SHADOWFLAME
  SPELL_SCHOOL_COLORS[40] = {[1] = "WARLOCK",[2] = "MONK"} -- SHADOWSTORM (PLAGUE)
  SPELL_SCHOOL_COLORS[48] = {[1] = "WARLOCK",[2] = "MAGE"} -- SHADOWFROST
  SPELL_SCHOOL_COLORS[65] = {[1] = "PALADIN",[2] = "PRIEST"} -- SPELLSTRIKE
  SPELL_SCHOOL_COLORS[66] = {[1] = "PALADIN",[2] = "ROGUE"} -- DIVINE
  SPELL_SCHOOL_COLORS[68] = {[1] = "PALADIN",[2] = "DRUID"} -- SPELLFIRE
  SPELL_SCHOOL_COLORS[72] = {[1] = "PALADIN",[2] = "MONK"} -- SPELLSTORM
  SPELL_SCHOOL_COLORS[80] = {[1] = "PALADIN",[2] = "MAGE"} -- SPELLFROST
  SPELL_SCHOOL_COLORS[96] = {[1] = "PALADIN",[2] = "WARLOCK"} -- SPELLSHADOW
  --only creating two color gradients for now, including all colors for future use
  SPELL_SCHOOL_COLORS[28] = {[1] = "MAGE",[2] = "MONK",[3] = "DRUID"} -- ELEMENTAL
  SPELL_SCHOOL_COLORS[124] = {[1] = "PALADIN",[2] = "WARLOCK",[3] = "MAGE",[4] = "MONK",[5] = "DRUID"} -- CHROMATIC
  SPELL_SCHOOL_COLORS[126] = {[1] = "PALADIN",[2] = "WARLOCK",[3] = "MAGE",[4] = "MONK",[5] = "DRUID",[6] = "ROGUE"} -- MAGIC
  SPELL_SCHOOL_COLORS[127] = {[1] = "PALADIN",[2] = "WARLOCK",[3] = "MAGE",[4] = "MONK",[5] = "DRUID",[6] = "ROGUE",[7] = "PRIEST"} -- CHAOS
end
    
local function HideCastbarText(unit)
	local hide = settings.hideText[unit];
	if not hide then 
  if unit == 'player' or unit == 'target' or unit == 'focus' then
  local unitframe = units[unit];
    unitframe.Castbar.Text:SetPoint("LEFT", unitframe.Castbar, "LEFT", 11, 0)
    unitframe.Castbar.Text:SetTextColor(1, 1, 1)
    unitframe.Castbar.Text:SetFont("Interface\\AddOns\\ElvUI_OOMM\\media\\fonts\\ConduitITC.ttf",32,"NONE")
    unitframe.Castbar.Text:SetShadowColor(0, 0, 0, 0)
    if unit == 'target' then
      if not unitframe.Castbar.TextFrame then
        unitframe.Castbar.TextFrame = CreateFrame("StatusBar","CastbarTextFrame",unitframe.Castbar)
      end
      unitframe.Castbar.TextFrame:SetAllPoints(unitframe.Castbar)
      unitframe.Castbar.TextFrame:SetFrameStrata("MEDIUM")
      unitframe.Castbar.TextFrame:SetFrameLevel(18)
      unitframe.Castbar.Text:SetParent(unitframe.Castbar.TextFrame)

      unitframe.Castbar.Text:SetAlpha(1)
      unitframe.Castbar:ClearAllPoints()
      unitframe.Castbar:SetPoint("BOTTOMRIGHT",unitframe.Power,"BOTTOMRIGHT",7,-7)
      unitframe.Castbar:SetFrameStrata("MEDIUM")
      unitframe.Castbar:SetFrameLevel(3)
    end
  end
  return; end

	if unit == 'player' or unit == 'target' or unit == 'focus' then
		local unitframe = units[unit];
		unitframe.Castbar.Text:SetAlpha(0)
		unitframe.Castbar.Time:SetAlpha(0)
	elseif unit == 'arena' then
		for i = 1, 5 do
			local unitframe = _G["ElvUF_Arena"..i]
			unitframe.Castbar.Text:SetAlpha(0)
			unitframe.Castbar.Time:SetAlpha(0)
		end
	elseif unit == 'boss' then
		for i = 1, MAX_BOSS_FRAMES do
			local unitframe = _G["ElvUF_Boss"..i]
			unitframe.Castbar.Text:SetAlpha(0)
			unitframe.Castbar.Time:SetAlpha(0)
		end
	end
end

function mod:COMBAT_LOG_EVENT_UNFILTERED(_, _, event, _, sourceGUID, _, _, _, _, destName, _, _, spellID, spellName, spellSchool)
  if event == "SPELL_CAST_START" or event == "SPELL_CHANNEL_START" then
    SPELL_SCHOOL_LOG[sourceGUID] = spellSchool
    local school = SPELL_SCHOOL_LOG[UnitGUID("player")] or 0
    local classColor1 = SPELL_SCHOOL_COLORS[school][1]
    local classColor2 = SPELL_SCHOOL_COLORS[school][2] or classColor1
    if ElvUF_Player.Castbar.Blendbar then
      ElvUF_Player.Castbar.Blendbar:SetGradientAlpha("HORIZONTAL", CUSTOM_CLASS_COLORS[classColor1].r, CUSTOM_CLASS_COLORS[classColor1].g, CUSTOM_CLASS_COLORS[classColor1].b,0.8,CUSTOM_CLASS_COLORS[classColor2].r, CUSTOM_CLASS_COLORS[classColor2].g, CUSTOM_CLASS_COLORS[classColor2].b,0.8)
    end
    --todo
    --texture for tri school+
    --spell color vs school color (wrath = yellow etc)
  end
end
function mod:PostCastStart(unit, name, castid)
	local db = self:GetParent().db
	if not db or not db.castbar then return; end
  local unitframe = units[unit];
  unitframe.Castbar:SetAlpha(1)
  if self.Text then
  HideCastbarText(unit)
    --[[if unit == 'target' then
      if not unitframe.Castbar.TextFrame then
        unitframe.Castbar.TextFrame = CreateFrame("StatusBar","CastbarTextFrame",unitframe.Castbar)
      end
        unitframe.Castbar.TextFrame:SetAllPoints(unitframe.Castbar)
        unitframe.Castbar.TextFrame:SetFrameStrata("DIALOG")
        unitframe.Castbar.TextFrame:SetAlpha(1)
        unitframe.Castbar.TextFrame:SetFrameLevel(20)
        unitframe.Castbar.Text:SetParent(unitframe.Castbar.TextFrame)
      end
      ]]--
  end
  if self.Blendbar == nil then self.Blendbar = self:CreateTexture(nil, 'OVERLAY') end
  self.Blendbar:SetBlendMode('ADD')
  self.Blendbar:SetTexture("Interface\\buttons\\white8x8")
  self.Blendbar:SetVertexColor(1,1,1,0.8)
  self:SetStatusBarTexture(self.Blendbar)
  self.backdrop:Hide()
end

function mod:PostCastStop(unit, name, castid)
	local db = self:GetParent().db
	if not db or not db.castbar then return; end
  --if unit == 'target' and self.Text then
  --self.Text:SetAlpha(0)
  --end
end

function mod:PostChannelStart(unit, name, castid)
	local db = self:GetParent().db
	if not db or not db.castbar then return; end

	local r, g, b
	local color = settings.backdropColor
	local alpha = settings.backdropAlpha
	if type(color) == 'table' then
		r, g, b = unpack(color)
	elseif type(color) == 'string' then
		r, g, b = E:HexToRGB(color)
	end

	if self.bg and self.bg:IsShown() then
		self.bg:SetTexture(r, g, b)
	else
		if self.backdrop then
			self.backdrop:SetBackdropColor(r, g, b, alpha)

			if self.backdrop.backdropTexture then
				self.backdrop.backdropTexture:SetVertexColor(r, g, b)
				self.backdrop.backdropTexture:SetAlpha(alpha)
			end
		end
	end
  if self.Blendbar == nil then  self.Blendbar = self:CreateTexture(nil, 'OVERLAY') end
  self.Blendbar:SetBlendMode('ADD')
  self.Blendbar:SetTexture("Interface\\buttons\\white8x8")
  self.Blendbar:SetVertexColor(CUSTOM_CLASS_COLORS[E.myclass].r, CUSTOM_CLASS_COLORS[E.myclass].g, CUSTOM_CLASS_COLORS[E.myclass].b,0.8)
  self:SetStatusBarTexture(self.Blendbar)
  self.backdrop:Hide()
end

function mod:PostCastInterruptible(unit)
	if unit == "vehicle" or unit == "player" then return end
	
	local r, g, b
	local color = settings.backdropColor
	local alpha = settings.backdropAlpha
	if type(color) == 'table' then
		r, g, b = unpack(color)
	elseif type(color) == 'string' then
		r, g, b = E:HexToRGB(color)
	end
	
	if self.bg and self.bg:IsShown() then
		self.bg:SetTexture(r, g, b)
	else
		if self.backdrop then
			self.backdrop:SetBackdropColor(r, g, b, alpha)

			if self.backdrop.backdropTexture then
				self.backdrop.backdropTexture:SetVertexColor(r, g, b)
				self.backdrop.backdropTexture:SetAlpha(alpha)
			end
		end
	end
end

function mod:NewBorder(...)
  local unit, bartype = ...
  local direction = ""
  
  self.backdrop:Hide() -- Not using this backdrop
  
  if self.black == nil then 
  self.black = self:CreateTexture(nil, 'BORDER')
  self.black:SetTexture(E["media"].blankTex)
  end
  if self.black and self.blackSpark == nil then 
  self.blackSpark = self:CreateTexture(nil, 'BORDER')
  self.blackSpark:SetTexture(E["media"].blankTex)
  end
  
  local size,xFix, yFix, BDyFix = 8, 0, 0, 0 -- a lot of single px tweaks
  local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
  if point == "TOPLEFT" then xOfs= xOfs-size-1; yOfs = yOfs+size+1; xFix=1; direction="LEFT" --player
  elseif point == "TOPRIGHT" then xOfs= xOfs+size+2; yOfs = yOfs+size+1; xFix=2; direction="RIGHT" --target, targettarget
  elseif point == "BOTTOMRIGHT" then xOfs= xOfs+size; yOfs = yOfs-size; direction="RIGHT"
  elseif point == "BOTTOMLEFT" then xOfs= xOfs-size; yOfs = yOfs-size; yFix=2; direction="LEFT"--target.power,player.power
  end

  self.bg:ClearAllPoints()
  self.bg:SetPoint(point,self,relativePoint,xOfs,yOfs)
  self.bg:SetVertexColor(0,0,0,0.2)
  self.bg:SetWidth(self:GetWidth()+(size*2)+xFix)
  self.bg:SetHeight(self:GetHeight()+(size*2)+yFix)
  
  if point == "TOPLEFT" then xOfs= xOfs+(size/2); yOfs = yOfs-(size*1.5); xFix=0 --player
  elseif point == "TOPRIGHT" then xOfs= xOfs-(size*1.75); yOfs = yOfs-(size*1.5); xFix=0 --target, targettarget
  elseif point == "BOTTOMRIGHT" then xOfs= xOfs+(size/2); yOfs = yOfs-size; 
  elseif point == "BOTTOMLEFT" then xOfs= xOfs+(size/2); yOfs = yOfs+(size/2); yFix=-1; BDyFix = 1--target.power,player.power
  end 
  
  local scale = 1
  if bartype == "power" then scale = UnitPower(unit)/UnitPowerMax(unit) end
  if bartype == "health" then scale = UnitHealth(unit)/UnitHealthMax(unit) end

  self.black:SetPoint("BOTTOMLEFT",self,"BOTTOMLEFT",xOfs,yOfs)
  self.black:SetVertexColor(0,0,0,0.5)
  self.black:SetWidth(self:GetWidth()*scale+xFix)
  self.black:SetHeight(self.bg:GetHeight()-size+yFix)
  
  self.blackSpark:SetPoint("LEFT",self.black,"RIGHT",0,0)
  self.blackSpark:SetVertexColor(0,0,0,0.5)
  self.blackSpark:SetWidth(8)
  self.blackSpark:SetHeight(self.black:GetHeight())
  
  local tooSmall = self.black:GetWidth()
  if tooSmall < 10 then 
  self.blackSpark:SetVertexColor(0,0,0,0)
  self.black:SetVertexColor(0,0,0,0)
  end
  
  if self.blackBackdrop == nil then 
  self.blackBackdrop = self:CreateTexture(nil, 'BACKGROUND')
  self.blackBackdrop:SetTexture(E["media"].blankTex)
  end
  self.blackBackdrop:SetPoint("BOTTOMLEFT",self,"BOTTOMLEFT",xOfs,yOfs)
  self.blackBackdrop:SetWidth(self:GetWidth()+size+xFix)
  self.blackBackdrop:SetHeight(self:GetHeight()+size+BDyFix)
  self.blackBackdrop:SetVertexColor(0,0,0,0.2)
  

end

function mod:PostUpdatePower(unit, name, castid)
	local db = self:GetParent().db
	if not db or not db.power then return; end
  mod.NewBorder(self,unit,"power")
end

function mod:PostUpdateHealth(unit, name, castid)
	local db = self:GetParent().db
	if not db or not db.health then return; end
  mod.NewBorder(self,unit,"health")
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", function(...)
local self, event = ...
if event == "PLAYER_ENTERING_WORLD" then mod.PLAYER_ENTERING_WORLD(...) end
if event == "COMBAT_LOG_EVENT_UNFILTERED" then mod.COMBAT_LOG_EVENT_UNFILTERED(...) end
end)

function mod:PLAYER_ENTERING_WORLD(self)
	f:UnregisterEvent("PLAYER_ENTERING_WORLD")

	for unit in pairs(units) do
		local unitframe = units[unit]
		local castbar = unitframe and unitframe.Castbar
		local power = unitframe and unitframe.Power
		local health = unitframe and unitframe.Health

		if castbar then
			hooksecurefunc(castbar, "PostCastStart", mod.PostCastStart)
			hooksecurefunc(castbar, "PostCastStop", mod.PostCastStop)
			hooksecurefunc(castbar, "PostCastInterruptible", mod.PostCastInterruptible)
			hooksecurefunc(castbar, "PostChannelStart", mod.PostChannelStart)
    end
    if power then
        --print(unitframe,power.PostUpdate)
			hooksecurefunc(power, "PostUpdate", mod.PostUpdatePower)
		end
    if health then
      --print(unitframe,power.PostUpdate)
			hooksecurefunc(health, "PostUpdate", mod.PostUpdateHealth)
		end

		HideCastbarText(unit)
	end

	for i = 1, 5 do
		local castbar = _G["ElvUF_Arena"..i].Castbar
		if castbar then
			hooksecurefunc(castbar, "PostCastStart", mod.PostCastStart)
			hooksecurefunc(castbar, "PostCastInterruptible", mod.PostCastInterruptible)
		end
	end

	for i = 1, MAX_BOSS_FRAMES do
		local castbar = _G["ElvUF_Boss"..i].Castbar
		if castbar then
			hooksecurefunc(castbar, "PostCastStart", mod.PostCastStart)
			hooksecurefunc(castbar, "PostCastInterruptible", mod.PostCastInterruptible)
		end
	end
end



