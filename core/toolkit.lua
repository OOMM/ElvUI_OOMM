local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local LSM = LibStub("LibSharedMedia-3.0")

local function RemoveShadow(fs)
fs:SetShadowColor(0, 0, 0, 0)
end

if ElvUF_Player.customTexts.NameText then hooksecurefunc(ElvUF_Player.customTexts.NameText, "FontTemplate", RemoveShadow) end
if ElvUF_Player.customTexts.HealthText then hooksecurefunc(ElvUF_Player.customTexts.HealthText, "FontTemplate", RemoveShadow) end
if ElvUF_Player.customTexts.PowerText then hooksecurefunc(ElvUF_Player.customTexts.PowerText, "FontTemplate", RemoveShadow) end
if ElvUF_Player.customTexts.AltPowerText then hooksecurefunc(ElvUF_Player.customTexts.AltPowerText, "FontTemplate", RemoveShadow) end
if ElvUF_Target.customTexts.NameText then hooksecurefunc(ElvUF_Target.customTexts.NameText, "FontTemplate", RemoveShadow) end
if ElvUF_Target.customTexts.HealthText then hooksecurefunc(ElvUF_Target.customTexts.HealthText, "FontTemplate", RemoveShadow) end
if ElvUF_TargetTarget.customTexts.NameText then hooksecurefunc(ElvUF_TargetTarget.customTexts.NameText, "FontTemplate", RemoveShadow) end


local A = E:GetModule('Auras', 'AceHook-3.0', 'AceEvent-3.0');
function A:CreateIcon(button)
	local font = LSM:Fetch("font", self.db.font)

	button:SetTemplate('Default')

	button.texture = button:CreateTexture(nil, "BORDER")
	button.texture:SetInside()
	button.texture:SetTexCoord(unpack(E.TexCoords))

	button.count = button:CreateFontString(nil, "ARTWORK")
	button.count:SetPoint("BOTTOMRIGHT", -1 + self.db.countXOffset, 1 + self.db.countYOffset)
	button.count:FontTemplate(font, self.db.fontSize, self.db.fontOutline)

	button.time = button:CreateFontString(nil, "ARTWORK")
	button.time:SetPoint("TOP", button, 'BOTTOM', 1 + self.db.timeXOffset, 0 + self.db.timeYOffset)
	button.time:FontTemplate(font, self.db.fontSize, self.db.fontOutline)

	button.highlight = button:CreateTexture(nil, "HIGHLIGHT")
	button.highlight:SetTexture(1, 1, 1, 0.45)
	button.highlight:SetInside()

  button.black = button:CreateTexture(nil, "BACKGROUND")
	button.black:SetPoint("CENTER",button,"CENTER",0,0)
  button.black:SetTexture(E["media"].blankTex)
  button.black:SetVertexColor(0,0,0,0.5)
  button.black:SetWidth(E.db.auras.buffs.size+4)
  button.black:SetHeight(E.db.auras.buffs.size+4)
  
  button.blackBorder = button:CreateTexture(nil, "BACKGROUND")
	button.blackBorder:SetPoint("CENTER",button,"CENTER",0,0)
  button.blackBorder:SetTexture(E["media"].blankTex)
  button.blackBorder:SetVertexColor(0,0,0,0.2)
  button.blackBorder:SetWidth(E.db.auras.buffs.size+8)
  button.blackBorder:SetHeight(E.db.auras.buffs.size+8)

	E:SetUpAnimGroup(button)

	button:SetScript("OnAttributeChanged", A.OnAttributeChanged)
end

local AB = E:GetModule('ActionBars', 'AceHook-3.0', 'AceEvent-3.0');
function AB:StyleButton(button, noBackdrop, adjustChecked)
	local name = button:GetName();
	local icon = _G[name.."Icon"];
	local count = _G[name.."Count"];
	local flash	 = _G[name.."Flash"];
	local hotkey = _G[name.."HotKey"];
	local border  = _G[name.."Border"];
	local macroName = _G[name.."Name"];
	local normal  = _G[name.."NormalTexture"];
	local normal2 = button:GetNormalTexture()
	local shine = _G[name.."Shine"];
	local combat = InCombatLockdown()

	if flash then flash:SetTexture(nil); end
	if normal then normal:SetTexture(nil); normal:Hide(); normal:SetAlpha(0); end
	if normal2 then normal2:SetTexture(nil); normal2:Hide(); normal2:SetAlpha(0); end
	if border then border:Kill(); end

	if not button.noBackdrop then
		button.noBackdrop = noBackdrop;
	end

	if count then
		count:ClearAllPoints();
		count:SetPoint("BOTTOMRIGHT", 0, 2);
		count:FontTemplate(LSM:Fetch("font", self.db.font), self.db.fontSize, self.db.fontOutline)
	end

	if not button.noBackdrop and not button.backdrop then
		button:CreateBackdrop('Default', true)
		button.backdrop:SetAllPoints()
	end

	if icon then
		icon:SetTexCoord(unpack(E.TexCoords));
		icon:SetInside()
	end

	if shine then
		shine:SetAllPoints()
	end

	if self.db.hotkeytext then
		hotkey:FontTemplate(LSM:Fetch("font", self.db.font), self.db.fontSize, self.db.fontOutline)
	end

	--Extra Action Button
	if button.style then
		--button.style:SetParent(button.backdrop)
		button.style:SetDrawLayer('BACKGROUND', -7)
	end

	button.FlyoutUpdateFunc = AB.StyleFlyout
	self:FixKeybindText(button);
	button:StyleButton();

	if(not self.handledbuttons[button]) then
		E:RegisterCooldown(button.cooldown)

		self.handledbuttons[button] = true;
	end
  
  if not button.black then
  button.black = button:CreateTexture(nil, "BACKGROUND")
  end
	button.black:SetPoint("CENTER",button,"CENTER",0,0)
  button.black:SetTexture(E["media"].blankTex)
  button.black:SetVertexColor(0,0,0,0.5)
  button.black:SetWidth(E.db.auras.buffs.size+4)
  button.black:SetHeight(E.db.auras.buffs.size+4)
  button.black:SetDrawLayer("BACKGROUND", -1)
  
  if not button.blackBorder then
  button.blackBorder = button:CreateTexture(nil, "BACKGROUND")
  end
	button.blackBorder:SetPoint("CENTER",button,"CENTER",0,0)
  button.blackBorder:SetTexture(E["media"].blankTex)
  button.blackBorder:SetVertexColor(0,0,0,0.2)
  button.blackBorder:SetWidth(E.db.auras.buffs.size+8)
  button.blackBorder:SetHeight(E.db.auras.buffs.size+8)
  
  LeftChatPanel.backdrop:SetAlpha(0)
  if not LeftChatPanel.black then
  LeftChatPanel.black = LeftChatPanel:CreateTexture(nil, "BACKGROUND")
  end
  LeftChatPanel.black:SetPoint("CENTER",LeftChatPanel,"CENTER",0,0)
  LeftChatPanel.black:SetTexture(E["media"].blankTex)
  LeftChatPanel.black:SetVertexColor(0,0,0,0.2)
  LeftChatPanel.black:SetWidth(E.db.chat.panelWidth+8)
  LeftChatPanel.black:SetHeight(E.db.chat.panelHeight+8)

  if not LeftChatPanel.blackBorder then
  LeftChatPanel.blackBorder = LeftChatPanel:CreateTexture(nil, "BACKGROUND")
  end
  LeftChatPanel.blackBorder:SetPoint("CENTER",LeftChatPanel,"CENTER",0,0)
  LeftChatPanel.blackBorder:SetTexture(E["media"].blankTex)
  LeftChatPanel.blackBorder:SetVertexColor(0,0,0,0.2)
  LeftChatPanel.blackBorder:SetWidth(E.db.chat.panelWidth+16)
  LeftChatPanel.blackBorder:SetHeight(E.db.chat.panelHeight+16)
  
  RightChatPanel.backdrop:SetAlpha(0)
  if not RightChatPanel.black then
  RightChatPanel.black = RightChatPanel:CreateTexture(nil, "BACKGROUND")
  end
  RightChatPanel.black:SetPoint("CENTER",RightChatPanel,"CENTER",0,0)
  RightChatPanel.black:SetTexture(E["media"].blankTex)
  RightChatPanel.black:SetVertexColor(0,0,0,0.2)
  RightChatPanel.black:SetWidth(E.db.chat.panelWidth+8)
  RightChatPanel.black:SetHeight(E.db.chat.panelHeight+8)

  if not RightChatPanel.blackBorder then
  RightChatPanel.blackBorder = RightChatPanel:CreateTexture(nil, "BACKGROUND")
  end
  RightChatPanel.blackBorder:SetPoint("CENTER",RightChatPanel,"CENTER",0,0)
  RightChatPanel.blackBorder:SetTexture(E["media"].blankTex)
  RightChatPanel.blackBorder:SetVertexColor(0,0,0,0.2)
  RightChatPanel.blackBorder:SetWidth(E.db.chat.panelWidth+16)
  RightChatPanel.blackBorder:SetHeight(E.db.chat.panelHeight+16)
  
  Minimap.backdrop:SetAlpha(0)
  if not Minimap.black then
  Minimap.black = Minimap:CreateTexture(nil, "BACKGROUND")
  end
  Minimap.black:SetPoint("CENTER",Minimap,"CENTER",0,0)
  Minimap.black:SetTexture(E["media"].blankTex)
  Minimap.black:SetVertexColor(0,0,0,0.5)
  Minimap.black:SetWidth(E.db.general.minimap.size+8)
  Minimap.black:SetHeight(E.db.general.minimap.size+8)
  

end

local function AuraBorderUF(unit, index, filter)
  if unit == "player" then
    for i=1,12 do 
      local tarBuff = _G["ElvUF_TargetBuffsButton"..i]
      local plaDebuff = _G["ElvUF_PlayerDebuffsButton"..i]
      if tarBuff then
        local tarBuffsize = 16
        local tarBuffsizeOverride = E.db.unitframe.units.target.buffs.sizeOverride
        local tarBufficonSpace = tarBuffsizeOverride+tarBuffsize+1
        local tarBuffperrow = E.db.unitframe.units.target.buffs.perrow
        local tarBuffxstep = (i-1)% tarBuffperrow
        local tarBuffystep = floor((i-1)/tarBuffperrow)
          tarBuff:SetPoint("BOTTOMRIGHT",tarBuffxstep*-tarBufficonSpace,tarBuffystep*tarBufficonSpace)
        if not tarBuff.black then
          tarBuff.black = tarBuff:CreateTexture(nil, "BACKGROUND")
        end
        tarBuff.black:SetPoint("CENTER",tarBuff,"CENTER",0,0)
        tarBuff.black:SetTexture(E["media"].blankTex)
        tarBuff.black:SetVertexColor(0,0,0,0.5)
        tarBuff.black:SetWidth(tarBuffsizeOverride+(tarBuffsize/2))
        tarBuff.black:SetHeight(tarBuffsizeOverride+(tarBuffsize/2))
        
        if not tarBuff.blackBorder then
          tarBuff.blackBorder = tarBuff:CreateTexture(nil, "BACKGROUND")
        end
        tarBuff.blackBorder:SetPoint("CENTER",tarBuff,"CENTER",0,0)
        tarBuff.blackBorder:SetTexture(E["media"].blankTex)
        tarBuff.blackBorder:SetVertexColor(0,0,0,0.2)
        tarBuff.blackBorder:SetWidth(tarBuffsizeOverride+tarBuffsize)
        tarBuff.blackBorder:SetHeight(tarBuffsizeOverride+tarBuffsize)
      end
      if plaDebuff then
        local plaDebuffsize = 16
        local plaDebuffsizeOverride = E.db.unitframe.units.player.debuffs.sizeOverride
        local plaDebufficonSpace = plaDebuffsizeOverride+plaDebuffsize
        local plaDebuffperrow = E.db.unitframe.units.player.debuffs.perrow
        local plaDebuffxstep = (i-1)%plaDebuffperrow
        local plaDebuffystep = floor((i-1)/plaDebuffperrow)
          plaDebuff:SetPoint("BOTTOMRIGHT",plaDebuffxstep*-plaDebufficonSpace,plaDebuffystep*plaDebufficonSpace)
        if not plaDebuff.black then
          plaDebuff.black = plaDebuff:CreateTexture(nil, "BACKGROUND")
        end
        plaDebuff.black:SetPoint("CENTER",plaDebuff,"CENTER",0,0)
        plaDebuff.black:SetTexture(E["media"].blankTex)
        plaDebuff.black:SetVertexColor(0,0,0,0.5)
        plaDebuff.black:SetWidth(plaDebuffsizeOverride+(plaDebuffsize/2))
        plaDebuff.black:SetHeight(plaDebuffsizeOverride+(plaDebuffsize/2))
        
        if not plaDebuff.blackBorder then
          plaDebuff.blackBorder = plaDebuff:CreateTexture(nil, "BACKGROUND")
        end
        plaDebuff.blackBorder:SetPoint("CENTER",plaDebuff,"CENTER",0,0)
        plaDebuff.blackBorder:SetTexture(E["media"].blankTex)
        plaDebuff.blackBorder:SetVertexColor(0,0,0,0.2)
        plaDebuff.blackBorder:SetWidth(plaDebuffsizeOverride+plaDebuffsize)
        plaDebuff.blackBorder:SetHeight(plaDebuffsizeOverride+plaDebuffsize)
      end
    end
  end
end
hooksecurefunc("UnitAura", AuraBorderUF)