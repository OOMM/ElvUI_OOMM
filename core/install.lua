local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

L['LOGIN_MSG'] = "Welcome to |cffa94cf3OOMM's UI |cffffffffversion |cffa94cf313.0.1 |cffa94cf3ALPHA. |cffffffffType |cffa94cf3/oomm |cffffffffto access the in-game configuration menu."

SLASH_OOMM1, SLASH_OOMM2, SLASH_OOMM3 = '/om', '/oomm', '/oommui';
function SlashCmdList.OOMM(msg, editbox)
  if msg == 'install' then
  E:SetupTheme('OOMMUI')
  elseif msg == 'addon' then
    E:SetupAddon('all')
  elseif msg == 'chat' then
    E:SetupChat()
  elseif msg == 'finish' then
    E:InstallComplete()
  else
    print('|cffa94cf3OOMM UI |cffffffffusage:');
    print('|cffa94cf3/oomm install |cffffffffInstall ElvUI_OOMM.');
    print('|cffa94cf3/oomm addon |cffffffffCreate Profiles for Skada, !ClassColors, xCT, MSBT, DBM.');
    print('|cffa94cf3/oomm chat |cffffffffSetup chat frames.');
    print('|cffa94cf3/oomm finish |cffffffffComplete installation and reload ui.');
    print('|cffffffffVisit|cffa94cf3 http://www.strongauras.com |cfffffffffor Warlock WeakAura strings.');    
  end
end

function E:SetupChat()
  InstallStepComplete.message = L["Chat Settings installed"]
  InstallStepComplete:Show()
  FCF_ResetChatWindows()
  FCF_SetLocked(ChatFrame1, 1)
  FCF_DockFrame(ChatFrame2)
  FCF_SetLocked(ChatFrame2, 1)
  FCF_OpenNewWindow(All)
  FCF_SetLocked(ChatFrame3, 1)
      
  for i = 1, NUM_CHAT_WINDOWS do
    local frame = _G[format("ChatFrame%s", i)]
    local chatFrameId = frame:GetID()
    local chatName = FCF_GetChatWindowInfo(chatFrameId)
    
    FCF_SavePositionAndDimensions(frame)
    FCF_StopDragging(frame)
    
    -- set default Elvui font size
    FCF_SetChatWindowFontSize(nil, frame, 11, "OUTLINE")
    
    -- rename windows general because moved to chat #3
    if i == 1 then
      FCF_SetWindowName(frame, "Some")
    elseif i == 2 then
      FCF_SetWindowName(frame, GUILD_EVENT_LOG)
    elseif i == 3 then 
      FCF_SetWindowName(frame, "All") 
    end
  end
  
  ChatFrame_RemoveAllMessageGroups(ChatFrame3)
  ChatFrame_AddMessageGroup(ChatFrame3, "SAY")
  ChatFrame_AddMessageGroup(ChatFrame3, "EMOTE")
  ChatFrame_AddMessageGroup(ChatFrame3, "YELL")
  ChatFrame_AddMessageGroup(ChatFrame3, "GUILD")
  ChatFrame_AddMessageGroup(ChatFrame3, "OFFICER")
  ChatFrame_AddMessageGroup(ChatFrame3, "GUILD_ACHIEVEMENT")
  ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_SAY")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_EMOTE")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_YELL")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_BOSS_EMOTE")
  ChatFrame_AddMessageGroup(ChatFrame3, "PARTY")
  ChatFrame_AddMessageGroup(ChatFrame3, "PARTY_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame3, "RAID")
  ChatFrame_AddMessageGroup(ChatFrame3, "RAID_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame3, "RAID_WARNING")
  ChatFrame_AddMessageGroup(ChatFrame3, "BATTLEGROUND")
  ChatFrame_AddMessageGroup(ChatFrame3, "BATTLEGROUND_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame3, "BG_HORDE")
  ChatFrame_AddMessageGroup(ChatFrame3, "BG_ALLIANCE")
  ChatFrame_AddMessageGroup(ChatFrame3, "BG_NEUTRAL")
  ChatFrame_AddMessageGroup(ChatFrame3, "SYSTEM")
  ChatFrame_AddMessageGroup(ChatFrame3, "ERRORS")
  ChatFrame_AddMessageGroup(ChatFrame3, "AFK")
  ChatFrame_AddMessageGroup(ChatFrame3, "DND")
  ChatFrame_AddMessageGroup(ChatFrame3, "IGNORED")
  ChatFrame_AddMessageGroup(ChatFrame3, "ACHIEVEMENT")
  ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")
  ChatFrame_AddMessageGroup(ChatFrame3, "BN_INLINE_TOAST_ALERT")
  ChatFrame_AddMessageGroup(ChatFrame3, "INSTANCE_CHAT")
  ChatFrame_AddMessageGroup(ChatFrame3, "INSTANCE_CHAT_LEADER")  
  ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
  ChatFrame_AddMessageGroup(ChatFrame3, "CHANNEL")
  ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
  ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY ")
  ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame3, "BOSS_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame3, "CURRENCY")
  
  ChatFrame_RemoveAllMessageGroups(ChatFrame1)
  ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
  ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
  ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
  ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")  
  ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
  ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame1, "DND")
  ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
  ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
  ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
  ChatFrame_AddMessageGroup(ChatFrame1, "BN_INLINE_TOAST_ALERT")
  ChatFrame_AddMessageGroup(ChatFrame1, "CHANNEL")
  ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
  ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
  ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
  ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
  ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
  ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
  ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS") 
  ChatFrame_AddMessageGroup(ChatFrame1, "LOOT")  
  
  ChatFrame_AddChannel(ChatFrame3, GENERAL)
  ChatFrame_AddChannel(ChatFrame3, TRADE)
  ChatFrame_RemoveChannel(ChatFrame1, GENERAL)
  ChatFrame_RemoveChannel(ChatFrame1, TRADE)
  ChatFrame_RemoveChannel(ChatFrame1, "LocalDefense")

  -- enable classcolor automatically on login and on each character without doing /configure each time.
  ToggleChatColorNamesByClassGroup(true, "SAY")
  ToggleChatColorNamesByClassGroup(true, "EMOTE")
  ToggleChatColorNamesByClassGroup(true, "YELL")
  ToggleChatColorNamesByClassGroup(true, "GUILD")
  ToggleChatColorNamesByClassGroup(true, "OFFICER")
  ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
  ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
  ToggleChatColorNamesByClassGroup(true, "WHISPER")
  ToggleChatColorNamesByClassGroup(true, "PARTY")
  ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
  ToggleChatColorNamesByClassGroup(true, "RAID")
  ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
  ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
  ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
  ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")  
  ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")  
  ToggleChatColorNamesByClassGroup(true, "CHANNEL11")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
  ToggleChatColorNamesByClassGroup(true, "CHANNEL11")
  
  --Adjust Chat Colors
  --General
  ChangeChatColor("CHANNEL1", 195/255, 230/255, 232/255)
  --Trade
  ChangeChatColor("CHANNEL2", 232/255, 158/255, 121/255)
  --Local Defense
  ChangeChatColor("CHANNEL3", 232/255, 228/255, 121/255)
end

function E:GetColor(r, b, g, a)  
  return { r = r, b = b, g = g, a = a }
end

function E:SetupTheme(theme, noDisplayMsg)
  local classColor = CUSTOM_CLASS_COLORS[E.myclass]
  InstallStepComplete.message = L["Interface Installed"]
  InstallStepComplete:Show()    
  E.private.theme = theme
  if not E.db.movers then E.db.movers = {}; end
    if theme == "OOMMUI" then
    
    --Frame Placement
    E.db.movers["PetAB"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT493247"
    E.db.movers["ElvUF_RaidMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT8468"
    E.db.movers["LeftChatMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT8286"
    E.db.movers["GMMover"] = "TOPLEFTElvUIParentTOPLEFT244-8"
    E.db.movers["BuffsMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-88"
    E.db.movers["TargetPowerBarMover"] = "BOTTOMElvUIParentBOTTOM350354"
    E.db.movers["BossButton"] = "BOTTOMElvUIParentBOTTOM342"
    E.db.movers["LootFrameMover"] = "TOPLEFTElvUIParentTOPLEFT467-7"
    E.db.movers["ElvUF_RaidpetMover"] = "TOPLEFTElvUIParentBOTTOMLEFT448651"
    E.db.movers["ElvUF_FocusMover"] = "BOTTOMElvUIParentBOTTOM31276"
    E.db.movers["MicrobarMover"] = "TOPElvUIParentTOP-20"
    E.db.movers["ElvUF_PetCastbarMover"] = "BOTTOMElvUIParentBOTTOM-340131"
    E.db.movers["ExperienceBarMover"] = "BOTTOMElvUIParentBOTTOM-340131"
    E.db.movers["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM350404"
    E.db.movers["ElvUF_Raid40Mover"] = "TOPLEFTElvUIParentBOTTOMLEFT8700"
    E.db.movers["ElvAB_1"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT00"
    E.db.movers["ElvAB_2"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT040"
    E.db.movers["MinimapMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-8286"
    E.db.movers["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM350306"
    E.db.movers["ElvAB_4"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT24040"
    E.db.movers["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM-350346"
    E.db.movers["RightChatMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-8286"
    E.db.movers["ElvAB_3"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT12040"
    E.db.movers["ReputationBarMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-8276"
    E.db.movers["TotemBarMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT246197"
    E.db.movers["ConsolidatedBuffsMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-44"
    E.db.movers["PlayerPowerBarMover"] = "BOTTOMElvUIParentBOTTOM-350354"
    E.db.movers["ObjectiveFrameMover"] = "TOPRIGHTElvUIParentTOPRIGHT-57-87"
    E.db.movers["BNETMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-12460"
    E.db.movers["ShiftAB"] = "TOPLEFTElvUIParentBOTTOMLEFT41196"
    E.db.movers["ElvAB_6"] = "BOTTOMElvUIParentBOTTOM00"
    E.db.movers["ElvUF_TargetCastbarMover"] = "BOTTOMElvUIParentBOTTOM350346"
    E.db.movers["ArenaHeaderMover"] = "TOPRIGHTElvUIParentTOPRIGHT0-233"
    E.db.movers["TooltipMover"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-9409"
    E.db.movers["ElvUF_TankMover"] = "TOPLEFTElvUIParentBOTTOMLEFT8759"
    E.db.movers["BossHeaderMover"] = "BOTTOMElvUIParentBOTTOM0450"
    E.db.movers["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM-350306"
    E.db.movers["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-350404"
    E.db.movers["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT8468"
    E.db.movers["ElvAB_5"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT36040"
    E.db.movers["DebuffsMover"] = "TOPRIGHTElvUIParentTOPRIGHT-4-4"
    E.db.movers["ElvUF_AssistMover"] = "TOPLEFTElvUIParentBOTTOMLEFT303759"
    
    
    -- Texture and Font
    E.private.general.normTex = "HalT"
    E.private.general.namefont = "ConduitITC"
    E.private.general.glossTex = "HalT"
    E.db.general.font = "VarelaRound"
    E.db.general.fontSize = 12
    
    -- Minimap
    E.db.general.minimap.icons.lfgEye.position = "BOTTOMLEFT"
    E.db.general.minimap.icons.garrison.scale = 0.65
    E.db.general.minimap.icons.garrison.position = "BOTTOMRIGHT"
    E.db.general.minimap.icons.garrison.hideGarrison = true
    E.db.general.bottomPanel = false
    E.db.general.minimap.size = 150
    -- Map
    E.db.general.smallerWorldMap = true
    
    -- Experience and Reputation Bars
    E.db.general.experience.width = 148
    E.db.general.experience.height = 10
    E.db.general.experience.orientation = "Horizontal"
    E.db.general.experience.enable = false
    E.db.general.reputation.width = 148
    E.db.general.reputation.height = 10
    E.db.general.reputation.orientation = "Horizontal"
    E.db.general.reputation.enable = false
    
    -- Misc
    E.db.general.threat.enable = false
    E.db.general.interruptAnnounce = "SAY"
    E.db.general.afk = false
    E.db.general.stickyFrames = false
    E.db.general.backdropcolor = { r = 0.286274509803922, g = 0.231372549019608, b = 0.0666666666666667}
    E.db.general.backdropfadecolor = { r = 0, g = 0, b = 0, a = 1}
    E.db.general.valuecolor = { r = 0.58, g = 0.51, b = 0.79}
    E.db.general.totems.enable = true
    E.db.general.totems.growthDirection = "HORIZONTAL"
    E.db.general.totems.size = 43
    E.private.general.chatBubbles = "nobackdrop"
    E.private.general.chatBubbleFont = "ConduitITC"
    E.db.general.dmgfont = "ConduitITC"
    E.db.auras.disableBlizzard = true
    
    -- Set Color Templates for use on some frames if !ClassColors addon is not loaded
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
    
    -- Unitframe Settings
    E.db.unitframe.statusbar = "HalT"
    E.db.unitframe.font = "ConduitITC"
    E.db.unitframe.fontSize = 12
    E.db.unitframe.fontOutline = "NONE"
    E.db.unitframe.debuffHighlighting = false
    E.db.unitframe.colors.healthclass = true
    E.db.unitframe.colors.colorhealthbyvalue = false
    E.db.unitframe.colors.castColor = {r = 0.0666666666666667, g = 0.0666666666666667, b= 0.0666666666666667}
    E.db.unitframe.colors.health = { r = CUSTOM_CLASS_COLORS["HUNTER"].r*0.9, g = CUSTOM_CLASS_COLORS["HUNTER"].g*0.9, b = CUSTOM_CLASS_COLORS["HUNTER"].b*0.9 }
    E.db.unitframe.colors.health_backdrop = { r = 0, g = 0, b = 0, a = 0.5}
    E.db.unitframe.colors.tapped = { r = 0.627450980392157, g = 0.627450980392157, b = 0.627450980392157 }
    E.db.unitframe.colors.disconnected = { r = 0.627450980392157, g = 0.627450980392157, b = 0.627450980392157 }
    E.db.unitframe.colors.power.MANA = { r = CUSTOM_CLASS_COLORS["MAGE"].r, g = CUSTOM_CLASS_COLORS["MAGE"].g, b = CUSTOM_CLASS_COLORS["MAGE"].b }
    E.db.unitframe.colors.power.RAGE = { r = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].r, g = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].g, b = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].b }
    E.db.unitframe.colors.power.FOCUS = { r = CUSTOM_CLASS_COLORS["HUNTER"].r, g = CUSTOM_CLASS_COLORS["HUNTER"].g, b = CUSTOM_CLASS_COLORS["HUNTER"].b }
    E.db.unitframe.colors.power.ENERGY = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g, b = CUSTOM_CLASS_COLORS["ROGUE"].b }
    E.db.unitframe.colors.power.RUNIC_POWER = { r = CUSTOM_CLASS_COLORS["PRIEST"].r, g = CUSTOM_CLASS_COLORS["PRIEST"].g, b = CUSTOM_CLASS_COLORS["PRIEST"].b }
    E.db.unitframe.colors.reaction.BAD = { r = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].r*0.9, g = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].g*0.9, b = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].b*0.9 }
    E.db.unitframe.colors.reaction.NEUTRAL = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g*0.9, b = CUSTOM_CLASS_COLORS["ROGUE"].b*0.9 }
    E.db.unitframe.colors.reaction.GOOD = { r = CUSTOM_CLASS_COLORS["HUNTER"].r*0.9, g = CUSTOM_CLASS_COLORS["HUNTER"].g*0.9, b = CUSTOM_CLASS_COLORS["HUNTER"].b*0.9 }
    E.db.unitframe.colors.castNoInterrupt = { r = 1, g = 0.137777777777778, b = 0.195555555555556 }
    E.db.unitframe.colors.classResources.bgColor = { r = 0, g = 0, b = 0, a = 0.5}
    
    --Resource Colours
    E.db.unitframe.colors.classResources.MONK[1] = { r = CUSTOM_CLASS_COLORS["MONK"].r, g = CUSTOM_CLASS_COLORS["MONK"].g, b = CUSTOM_CLASS_COLORS["MONK"].b }
    E.db.unitframe.colors.classResources.MONK[2] = { r = CUSTOM_CLASS_COLORS["MONK"].r, g = CUSTOM_CLASS_COLORS["MONK"].g, b = CUSTOM_CLASS_COLORS["MONK"].b }
    E.db.unitframe.colors.classResources.MONK[3] = { r = CUSTOM_CLASS_COLORS["MONK"].r, g = CUSTOM_CLASS_COLORS["MONK"].g, b = CUSTOM_CLASS_COLORS["MONK"].b }
    E.db.unitframe.colors.classResources.MONK[4] = { r = CUSTOM_CLASS_COLORS["MONK"].r, g = CUSTOM_CLASS_COLORS["MONK"].g, b = CUSTOM_CLASS_COLORS["MONK"].b }
    E.db.unitframe.colors.classResources.MONK[5] = { r = CUSTOM_CLASS_COLORS["MONK"].r, g = CUSTOM_CLASS_COLORS["MONK"].g, b = CUSTOM_CLASS_COLORS["MONK"].b }
    E.db.unitframe.colors.classResources.MONK[6] = { r = CUSTOM_CLASS_COLORS["MONK"].r, g = CUSTOM_CLASS_COLORS["MONK"].g, b = CUSTOM_CLASS_COLORS["MONK"].b }
    
    E.db.unitframe.colors.classResources.DEATHKNIGHT[1] = { r = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].r, g = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].g, b = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].b }
    E.db.unitframe.colors.classResources.DEATHKNIGHT[2] = { r = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].r, g = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].g, b = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].b }
    E.db.unitframe.colors.classResources.DEATHKNIGHT[3] = { r = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].r, g = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].g, b = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].b }
    E.db.unitframe.colors.classResources.DEATHKNIGHT[4] = { r = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].r, g = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].g, b = CUSTOM_CLASS_COLORS["DEATHKNIGHT"].b }
    
    E.db.unitframe.colors.classResources.ROGUE[1] = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g, b = CUSTOM_CLASS_COLORS["ROGUE"].b }
    E.db.unitframe.colors.classResources.ROGUE[2] = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g, b = CUSTOM_CLASS_COLORS["ROGUE"].b }
    E.db.unitframe.colors.classResources.ROGUE[3] = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g, b = CUSTOM_CLASS_COLORS["ROGUE"].b }
    E.db.unitframe.colors.classResources.ROGUE[4] = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g, b = CUSTOM_CLASS_COLORS["ROGUE"].b }
    E.db.unitframe.colors.classResources.ROGUE[5] = { r = CUSTOM_CLASS_COLORS["ROGUE"].r, g = CUSTOM_CLASS_COLORS["ROGUE"].g, b = CUSTOM_CLASS_COLORS["ROGUE"].b }
    
    E.db.unitframe.colors.castClassColor = true
    E.db.unitframe.colors.customhealthbackdrop = true
    E.db.unitframe.smartRaidFilter = false
    
    -- Player
    E.db.unitframe.units.player.customTexts = {}
    E.db.unitframe.units.player.customTexts.HealthText = {}
    E.db.unitframe.units.player.customTexts.AltPowerText = {}
    E.db.unitframe.units.player.customTexts.PowerText = {}
    E.db.unitframe.units.player.restIcon = false
    E.db.unitframe.units.player.width = 222
    E.db.unitframe.units.player.height = 32
    E.db.unitframe.units.player.healPrediction = false
    E.db.unitframe.units.player.threatStyle = "NONE"
    E.db.unitframe.units.player.health.text_format = ""
    E.db.unitframe.units.player.power.text_format = ""
    E.db.unitframe.units.player.power.offset = -20
    E.db.unitframe.units.player.power.detachFromFrame = true
    E.db.unitframe.units.player.power.detachedWidth = 222
    E.db.unitframe.units.player.power.height = 32
    E.db.unitframe.units.player.power.druidMana = false
    E.db.unitframe.units.player.pvp.text_format = ""
    E.db.unitframe.units.player.buffs.enable = false
    E.db.unitframe.units.player.debuffs.enable = true
    E.db.unitframe.units.player.debuffs.sizeOverride = 43
    E.db.unitframe.units.player.debuffs.yOffset = 17
    E.db.unitframe.units.player.debuffs.xOffset = 1
    E.db.unitframe.units.player.debuffs.fontSize = 12
    E.db.unitframe.units.player.debuffs.attachTo = "Frame"
    E.db.unitframe.units.player.debuffs.anchorPoint = "TOPRIGHT"
    E.db.unitframe.units.player.debuffs.numrows = 2
    E.db.unitframe.units.player.debuffs.perrow = 4
    E.db.unitframe.units.player.debuffs.useFilter = "RaidDebuffs"
    E.db.unitframe.units.player.castbar.enable = true
    E.db.unitframe.units.player.castbar.width = 238
    E.db.unitframe.units.player.castbar.height = 48
    E.db.unitframe.units.player.castbar.icon = false
    E.db.unitframe.units.player.castbar.latency = false
    E.db.unitframe.units.player.castbar.format = "CURRENT"
    E.db.unitframe.units.player.castbar.ticks = true
    E.db.unitframe.units.player.castbar.spark = true
    E.db.unitframe.units.player.classbar.enable = false
    E.db.unitframe.units.player.stagger.enable = false
    E.db.unitframe.units.player.aurabar.enable = false
    E.db.unitframe.units.player.customTexts.HealthText.font = "ConduitITC"
    E.db.unitframe.units.player.customTexts.HealthText.justifyH = "RIGHT"
    E.db.unitframe.units.player.customTexts.HealthText.fontOutline = "NONE"
    E.db.unitframe.units.player.customTexts.HealthText.xOffset = -5
    E.db.unitframe.units.player.customTexts.HealthText.yOffset = 0
    E.db.unitframe.units.player.customTexts.HealthText.size = 24
    E.db.unitframe.units.player.customTexts.HealthText.text_format = "[mouseover][health:current]"
    E.db.unitframe.units.player.customTexts.AltPowerText.font = "ConduitITC"
    E.db.unitframe.units.player.customTexts.AltPowerText.justifyH = "RIGHT"
    E.db.unitframe.units.player.customTexts.AltPowerText.fontOutline = "NONE"
    E.db.unitframe.units.player.customTexts.AltPowerText.xOffset = -5
    E.db.unitframe.units.player.customTexts.AltPowerText.yOffset = -50
    E.db.unitframe.units.player.customTexts.AltPowerText.size = 24
    E.db.unitframe.units.player.customTexts.AltPowerText.text_format = "[altpower:current-max]"
    E.db.unitframe.units.player.customTexts.PowerText.font = "ConduitITC"
    E.db.unitframe.units.player.customTexts.PowerText.justifyH = "RIGHT"
    E.db.unitframe.units.player.customTexts.PowerText.fontOutline = "NONE"
    E.db.unitframe.units.player.customTexts.PowerText.xOffset = -5
    E.db.unitframe.units.player.customTexts.PowerText.yOffset = -50
    E.db.unitframe.units.player.customTexts.PowerText.size = 24
    E.db.unitframe.units.player.customTexts.PowerText.text_format = "[mouseover][power:current]"
    
    -- Target
    E.db.unitframe.units.target.customTexts = {}
    E.db.unitframe.units.target.customTexts.HealthText = {}
    E.db.unitframe.units.target.customTexts.NameText = {}
    E.db.unitframe.units.target.rangeCheck = false
    E.db.unitframe.units.target.width = 222
    E.db.unitframe.units.target.height = 32
    E.db.unitframe.units.target.healPrediction = false
    E.db.unitframe.units.target.threatStyle = "NONE"
    E.db.unitframe.units.target.health.text_format = ""
    E.db.unitframe.units.target.power.text_format = ""
    E.db.unitframe.units.target.power.position = "LEFT"
    E.db.unitframe.units.target.power.height = 32
    E.db.unitframe.units.target.power.offset = -20
    E.db.unitframe.units.target.power.detachFromFrame = true
    E.db.unitframe.units.target.power.detachedWidth = 222
    E.db.unitframe.units.target.power.hideonnpc = false
    E.db.unitframe.units.target.name.position = "LEFT"
    E.db.unitframe.units.target.name.text_format = ""
    E.db.unitframe.units.target.name.xOffset = 0
    E.db.unitframe.units.target.name.yOffset = 0
    E.db.unitframe.units.target.buffs.enable = true
    E.db.unitframe.units.target.buffs.sizeOverride = 43
    E.db.unitframe.units.target.buffs.fontSize = 12
    E.db.unitframe.units.target.buffs.yOffset = 18
    E.db.unitframe.units.target.buffs.xOffset = 1
    E.db.unitframe.units.target.buffs.numrows = 2
    E.db.unitframe.units.target.buffs.perrow = 4
    E.db.unitframe.units.target.buffs.noConsolidated.friendly = true
    E.db.unitframe.units.target.buffs.noConsolidated.enemy = true
    E.db.unitframe.units.target.debuffs.enable = false
    E.db.unitframe.units.target.castbar.enable = true
    E.db.unitframe.units.target.castbar.width = 238
    E.db.unitframe.units.target.castbar.height = 48
    E.db.unitframe.units.target.castbar.icon = false
    E.db.unitframe.units.target.castbar.format = "Remaining"
    E.db.unitframe.units.target.castbar.spark = true
    E.db.unitframe.units.target.aurabar.enable = false
    E.db.unitframe.units.target.customTexts.HealthText.font = "ConduitITC"
    E.db.unitframe.units.target.customTexts.HealthText.justifyH = "RIGHT"
    E.db.unitframe.units.target.customTexts.HealthText.fontOutline = "NONE"
    E.db.unitframe.units.target.customTexts.HealthText.xOffset = -5
    E.db.unitframe.units.target.customTexts.HealthText.yOffset = 0
    E.db.unitframe.units.target.customTexts.HealthText.size = 24
    E.db.unitframe.units.target.customTexts.HealthText.text_format = "[health:percent-h]"
    E.db.unitframe.units.target.customTexts.NameText.font = "ConduitITC"
    E.db.unitframe.units.target.customTexts.NameText.justifyH = "LEFT"
    E.db.unitframe.units.target.customTexts.NameText.fontOutline = "NONE"
    E.db.unitframe.units.target.customTexts.NameText.xOffset = 5
    E.db.unitframe.units.target.customTexts.NameText.yOffset = 0
    E.db.unitframe.units.target.customTexts.NameText.size = 24
    E.db.unitframe.units.target.customTexts.NameText.text_format = "[name:medium-u]"
    
    -- Target of Target
    E.db.unitframe.units.targettarget.customTexts = {}
    E.db.unitframe.units.targettarget.customTexts.NameText = {}
    E.db.unitframe.units.targettarget.enable = true
    E.db.unitframe.units.targettarget.rangeCheck = false
    E.db.unitframe.units.targettarget.debuffs.enable = false
    E.db.unitframe.units.targettarget.width = 222
    E.db.unitframe.units.targettarget.height = 32
    E.db.unitframe.units.targettarget.power.enable = false
    E.db.unitframe.units.targettarget.name.position = "CENTER"
    E.db.unitframe.units.targettarget.name.text_format = ""
    E.db.unitframe.units.targettarget.customTexts.NameText.font = "ConduitITC"
    E.db.unitframe.units.targettarget.customTexts.NameText.justifyH = "LEFT"
    E.db.unitframe.units.targettarget.customTexts.NameText.fontOutline = "NONE"
    E.db.unitframe.units.targettarget.customTexts.NameText.xOffset = 5
    E.db.unitframe.units.targettarget.customTexts.NameText.yOffset = 0
    E.db.unitframe.units.targettarget.customTexts.NameText.size = 24
    E.db.unitframe.units.targettarget.customTexts.NameText.text_format = "[name:medium-u]"
    
    -- Focus
    E.db.unitframe.units.focus.rangeCheck = false
    E.db.unitframe.units.focus.width = 80
    E.db.unitframe.units.focus.height = 32
    E.db.unitframe.units.focus.power.enable = false
    E.db.unitframe.units.focus.threatStyle = "NONE"
    E.db.unitframe.units.focus.name.position = "CENTER"
    E.db.unitframe.units.focus.name.text_format = "[name]"
    E.db.unitframe.units.focus.debuffs.enable = false
    E.db.unitframe.units.focus.castbar.width = 80
    E.db.unitframe.units.focus.castbar.height = 32
    E.db.unitframe.units.focus.castbar.icon = false
    E.db.unitframe.units.focus.castbar.format = "Remaining"
    E.db.unitframe.units.focus.castbar.spark = true
    
    -- Pet
    E.db.unitframe.units.pet.rangeCheck = false
    E.db.unitframe.units.pet.width = 222
    E.db.unitframe.units.pet.height = 32
    E.db.unitframe.units.pet.threatStyle = "NONE"
    E.db.unitframe.units.pet.healPrediction = false
    E.db.unitframe.units.pet.power.enable = false
    E.db.unitframe.units.pet.name.text_format = ""
    E.db.unitframe.units.pet.buffIndicator.enable = false
    
    -- Boss
    E.db.unitframe.units.boss.customTexts = {}
    E.db.unitframe.units.boss.customTexts.HealthText = {}
    E.db.unitframe.units.boss.customTexts.NameText = {}
    E.db.unitframe.units.boss.enable = true
    E.db.unitframe.units.boss.width = 80
    E.db.unitframe.units.boss.height = 20
    E.db.unitframe.units.boss.spacing = 5
    E.db.unitframe.units.boss.growthDirection= "LEFT"
    E.db.unitframe.units.boss.health.text_format = ""
    E.db.unitframe.units.boss.health.position = "BOTTOMRIGHT"
    E.db.unitframe.units.boss.power.enable = false
    E.db.unitframe.units.boss.name.text_format = ""
    E.db.unitframe.units.boss.name.position = "TOPLEFT"
    E.db.unitframe.units.boss.castbar.enable = false
    E.db.unitframe.units.boss.buffs.enable = false
    E.db.unitframe.units.boss.debuffs.enable = true
    E.db.unitframe.units.boss.debuffs.perrow = 5
    E.db.unitframe.units.boss.debuffs.numrows = 1
    E.db.unitframe.units.boss.debuffs.anchorPoint = "TOPRIGHT"
    E.db.unitframe.units.boss.debuffs.fontSize = 12
    E.db.unitframe.units.boss.debuffs.xOffset = -1
    E.db.unitframe.units.boss.debuffs.yOffset = 2
    E.db.unitframe.units.boss.debuffs.sizeOverride = 16
    E.db.unitframe.units.boss.customTexts.NameText.font = "ConduitITC"
    E.db.unitframe.units.boss.customTexts.NameText.justifyH = "LEFT"
    E.db.unitframe.units.boss.customTexts.NameText.fontOutline = "NONE"
    E.db.unitframe.units.boss.customTexts.NameText.xOffset = 3
    E.db.unitframe.units.boss.customTexts.NameText.yOffset = 0
    E.db.unitframe.units.boss.customTexts.NameText.size = 13
    E.db.unitframe.units.boss.customTexts.NameText.text_format = "[name:veryshort-u]"
    E.db.unitframe.units.boss.customTexts.HealthText.font = "ConduitITC"
    E.db.unitframe.units.boss.customTexts.HealthText.justifyH = "RIGHT"
    E.db.unitframe.units.boss.customTexts.HealthText.fontOutline = "NONE"
    E.db.unitframe.units.boss.customTexts.HealthText.xOffset = -3
    E.db.unitframe.units.boss.customTexts.HealthText.yOffset = 0
    E.db.unitframe.units.boss.customTexts.HealthText.size = 13
    E.db.unitframe.units.boss.customTexts.HealthText.text_format = "[health:percent]"
    
    -- Arena

    
    -- Party

    
    -- Raid
    E.db.unitframe.units.raid.customTexts = {}
    E.db.unitframe.units.raid.customTexts.NameText = {}
    E.db.unitframe.units.raid.width = 84
    E.db.unitframe.units.raid.height = 22
    E.db.unitframe.units.raid.rdebuffs.enable = false
    E.db.unitframe.units.raid.threatStyle = "NONE"
    E.db.unitframe.units.raid.colorOverride = "FORCE_ON"
    E.db.unitframe.units.raid.growthDirection = "RIGHT_UP"
    E.db.unitframe.units.raid.visibility = "[@raid6,noexists] hide;show"
    E.db.unitframe.units.raid.horizontalSpacing = 5
    E.db.unitframe.units.raid.verticalSpacing = 1
    E.db.unitframe.units.raid.health.text_format = ""
    E.db.unitframe.units.raid.power.enable = false
    E.db.unitframe.units.raid.name.text_format = ""
    E.db.unitframe.units.raid.GPSArrow.enable = false
    E.db.unitframe.units.raid.roleIcon.enable = false
    E.db.unitframe.units.raid.numGroups = 8
    E.db.unitframe.units.raid40.enable = false
    E.db.unitframe.units.raid40.width = 80
    E.db.unitframe.units.raid40.height = 32
    E.db.unitframe.units.tank.enable = false
    E.db.unitframe.units.assist.enable = false
    E.db.unitframe.units.raid.customTexts.NameText.font = "ConduitITC"
    E.db.unitframe.units.raid.customTexts.NameText.justifyH = "CENTER"
    E.db.unitframe.units.raid.customTexts.NameText.fontOutline = "NONE"
    E.db.unitframe.units.raid.customTexts.NameText.xOffset = 0
    E.db.unitframe.units.raid.customTexts.NameText.size = 12
    E.db.unitframe.units.raid.customTexts.NameText.text_format = "[name:short-u]"
    E.db.unitframe.units.raid.customTexts.NameText.yOffset = 0
    
    -- Bags
    E.db.bags.enable = true
    
    -- Nameplates
    E.db.nameplate.font = "ConduitITC"
    E.db.nameplate.fontSize = 12
    E.db.nameplate.fontOutline = "THICKOUTLINE"
    E.db.nameplate.targetIndicator.colorMatchHealthBar = true
    E.db.nameplate.nonTargetAlpha = 1
    E.db.nameplate.showLevel = false
    E.db.nameplate.healthBar.width = 90
    E.db.nameplate.healthBar.height = 12
    E.db.nameplate.healthBar.text.enable = false
    E.db.nameplate.buffs.font = "ConduitITC"
    E.db.nameplate.buffs.fontOutline = "OUTLINE"
    E.db.nameplate.debuffs.font = "ConduitITC"
    E.db.nameplate.debuffs.fontOutline = "OUTLINE"
    E.db.nameplate.threat.enable = false
    E.db.nameplate.reactions.tapped = {r = 0.627450980392157, g = 0.627450980392157, b = 0.627450980392157}
    E.db.nameplate.reactions.friendlyNPC = { r = 0.313725490196078, g = 0.980392156862745, b = 0.27843137254902 }
    E.db.nameplate.reactions.friendlyPlayer = { r = 0.313725490196078, g = 0.980392156862745, b = 0.27843137254902 }
    E.db.nameplate.reactions.neutral = { r = 1, g = 0.898039215686275, b = 0.227450980392157 }
    E.db.nameplate.reactions.enemy = { r = 0.937777777777778, g = 0.12, b = 0.177777777777778 } --do class color
    
    -- Auras
    E.db.auras.font = "ConduitITC"
    E.db.auras.fontSize = 14
    E.db.auras.fontOutline = "THICKOUTLINE"
    E.db.auras.consolidatedBuffs.enable = false
    E.db.auras.consolidatedBuffs.durations = false
    E.db.auras.consolidatedBuffs.reverseStyle = true
    E.db.auras.buffs.wrapAfter = 12
    E.db.auras.buffs.maxWraps = 4
    E.db.auras.buffs.horizontalSpacing = 8
    E.db.auras.buffs.verticalSpacing = 8
    E.db.auras.buffs.size = 32
    E.db.auras.buffs.growthDirection = "LEFT_UP"
    E.db.auras.debuffs.horizontalSpacing = 4
    E.db.auras.debuffs.wrapAfter = 12
    E.db.auras.debuffs.maxWraps = 4
    E.db.auras.debuffs.size = 40
    E.db.auras.timeYOffset = 23
    
    -- Custom Tweaks ElvUI Plugins
    if IsAddOnLoaded('ElvUI_CustomTweaks') then
      print("Configuring: ElvUI_CustomTweaks")
      E.db.auras.consolidatedBuffs.enable = true
      E.private.CustomTweaks.CBEnhanced = true
      E.db.CustomTweaks.CBEnhanced.buttonSize = 32
      E.db.CustomTweaks.CBEnhanced.buttonSpacing = 4
      E.db.CustomTweaks.CBEnhanced.backdrop = false
    else
      --print("Cannot find addon ElvUI_CustomTweaks, disabling consolidated buffs.")
      E.db.auras.consolidatedBuffs.enable = false
    end
    -- Chat
    E.db.chat.font = "VarelaRound"
    E.db.chat.fontOutline = "NONE"
    E.db.chat.editBoxPosition = 'BELOW_CHAT'
    E.db.chat.emotionIcons = false
    E.db.chat.panelWidth = 438
    E.db.chat.panelHeight = 150
    E.db.chat.panelTabBackdrop = false
    E.db.chat.tabFont = "VarelaRound"
    E.db.chat.tabFontSize = 10
    E.db.chat.tabFontOutline = "NONE"
    E.db.chat.panelTabTransparency = false
    E.db.chat.lfgIcons = false
    
    -- Datatexts
    E.db.datatexts.rightChatPanel = false
    E.db.datatexts.leftChatPanel = false
    E.db.datatexts.minimapPanels = false
    
    -- Tooltip
    E.db.tooltip.cursorAnchor = false
    E.db.tooltip.targetInfo = false
    E.db.tooltip.playerTitles = true
    E.db.tooltip.inspectInfo = false
    E.db.tooltip.guildRanks = true
    E.db.tooltip.talentInfo = false
    E.db.tooltip.itemCount = false
    E.db.tooltip.spellID = true
    E.db.tooltip.healthBar.height = 0
    E.db.tooltip.healthBar.text = false
    
    -- Actionbars
    E.db.cooldown.threshold = -1
    E.db.cooldown.expiringcolor = { r = 1, g = 1, b = 1 }
    E.db.cooldown.secondscolor = { r = 1, g = 1, b = 1 }
    E.db.cooldown.minutescolor = { r = 1, g = 1, b = 1 }
    E.db.cooldown.hourscolor = { r = 1, g = 1, b = 1 }
    E.db.cooldown.dayscolor = { r = 1, g = 1, b = 1 }
    E.db.actionbar.font = "ConduitITC"
    E.db.actionbar.fontSize = 12
    E.db.actionbar.fontOutline = "THICKOUTLINE"
    E.db.actionbar.hotkeytext = false
    E.db.actionbar.noRangeColor = {r = 0.984313725490196, g = 0.0352941176470588, b = 0.105882352941176}
    E.db.actionbar.noPowerColor = {r = 0.247058823529412, g = 0.345098039215686, b = 0.105882352941176}
    E.db.actionbar.microbar.enabled = true
    E.db.actionbar.microbar.mouseover = true
    E.db.actionbar.bar1.buttons = 12
    E.db.actionbar.bar1.buttonsPerRow = 12
    E.db.actionbar.bar1.buttonsize = 32
    E.db.actionbar.bar1.buttonspacing = 8
    E.db.actionbar.bar1.backdrop = false
    E.db.actionbar.bar2.mouseover = true
    E.db.actionbar.bar2.enabled = true
    E.db.actionbar.bar2.buttons = 12
    E.db.actionbar.bar2.buttonsPerRow = 3
    E.db.actionbar.bar2.buttonsize = 32
    E.db.actionbar.bar2.buttonspacing = 8
    E.db.actionbar.bar2.backdrop = false
    E.db.actionbar.bar3.mouseover = true
    E.db.actionbar.bar3.buttons = 12
    E.db.actionbar.bar3.buttonsPerRow = 3
    E.db.actionbar.bar3.buttonsize = 32
    E.db.actionbar.bar3.buttonspacing = 8
    E.db.actionbar.bar3.backdrop = false
    E.db.actionbar.bar4.mouseover = true
    E.db.actionbar.bar4.buttons = 12
    E.db.actionbar.bar4.buttonsPerRow = 3
    E.db.actionbar.bar4.backdrop = false
    E.db.actionbar.bar4.buttonsize = 32
    E.db.actionbar.bar4.buttonspacing = 8
    E.db.actionbar.bar5.mouseover = true
    E.db.actionbar.bar5.buttons = 12
    E.db.actionbar.bar5.buttonsPerRow = 3
    E.db.actionbar.bar5.buttonsize = 32
    E.db.actionbar.bar5.buttonspacing = 8
    E.db.actionbar.bar5.backdrop = false
    E.db.actionbar.bar6.enabled = true
    E.db.actionbar.bar6.buttons = 5
    E.db.actionbar.bar6.buttonsPerRow = 6
    E.db.actionbar.bar6.buttonsize = 32
    E.db.actionbar.bar6.buttonspacing = 8
    E.db.actionbar.bar6.backdrop = false
    E.db.actionbar.bar6.mouseover = true
    E.db.actionbar.barPet.mouseover = true
    E.db.actionbar.barPet.buttonsize = 16
    E.db.actionbar.barPet.buttonsPerRow = 10
    E.db.actionbar.barPet.buttonspacing = 1
    E.db.actionbar.stanceBar.mouseover = true
    E.db.actionbar.stanceBar.buttonsize = 32
    E.db.actionbar.stanceBar.buttonspacing = 8
  end
  
  if not noDisplayMsg then
    E:UpdateAll(true)
  end
end

function E:SetupAddon(addon)


  if addon == 'all' then
    if IsAddOnLoaded('Skada') then
      E:Print(L["A profile for Skada has been created. Type '/skada config' to change the profile."])
      InstallStepComplete.message = L["AddOn Profiles installed"]
      InstallStepComplete:Show()
      SkadaDB['profiles']["OOMM"] = {
			["windows"] = {
				{
					["titleset"] = false,
					["barheight"] = 13,
					["classicons"] = false,
					["barslocked"] = true,
					["background"] = {
						["borderthickness"] = 4,
						["color"] = {
							["a"] = 0,
							["b"] = 0.0784313725490196,
							["g"] = 0.0784313725490196,
							["r"] = 0.0784313725490196,
						},
						["height"] = 154.99951171875,
					},
					["wipemode"] = "Damage",
					["y"] = -242.499359130859,
					["barfont"] = "ConduitITC",
					["name"] = "Damage",
					["point"] = "RIGHT",
					["mode"] = "Damage",
					["modeincombat"] = "Damage",
					["bartexture"] = "HalT",
					["barwidth"] = 139.166687011719,
					["barspacing"] = 4,
					["barbgcolor"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["barcolor"] = {
						["b"] = 0.392156862745098,
						["g"] = 0.392156862745098,
						["r"] = 0.392156862745098,
					},
					["barfontsize"] = 12,
					["x"] = -164.167846679688,
					["enabletitle"] = false,
					["buttons"] = {
						["segment"] = false,
						["mode"] = false,
						["reset"] = false,
					},
					["title"] = {
						["color"] = {
							["a"] = 0.800000011920929,
							["b"] = 0.462745098039216,
							["g"] = 0.0823529411764706,
							["r"] = 1,
						},
						["font"] = "ValeraRound",
						["borderthickness"] = 0,
						["fontsize"] = 7,
						["height"] = 10,
						["texture"] = "HalT",
					},
				}, -- [1]
				{
					["titleset"] = false,
					["barheight"] = 13,
					["classicons"] = false,
					["barslocked"] = true,
					["enabletitle"] = false,
					["wipemode"] = "Healing",
					["set"] = "current",
					["hidden"] = false,
					["y"] = -242.083435058594,
					["barfont"] = "ConduitITC",
					["name"] = "Healing",
					["display"] = "bar",
					["barfontflags"] = "",
					["classcolortext"] = false,
					["scale"] = 1,
					["reversegrowth"] = false,
					["returnaftercombat"] = false,
					["roleicons"] = false,
					["barorientation"] = 1,
					["snapto"] = true,
					["mode"] = "Healing",
					["point"] = "RIGHT",
					["x"] = -307.49755859375,
					["bartexture"] = "HalT",
					["barwidth"] = 138.333206176758,
					["barspacing"] = 4,
					["buttons"] = {
						["segment"] = false,
						["menu"] = false,
						["mode"] = false,
						["report"] = false,
						["reset"] = false,
					},
					["title"] = {
						["color"] = {
							["a"] = 1,
							["b"] = 0.650980392156863,
							["g"] = 1,
							["r"] = 0,
						},
						["bordertexture"] = "None",
						["font"] = "ValeraRound",
						["borderthickness"] = 0,
						["fontsize"] = 7,
						["fontflags"] = "",
						["height"] = 10,
						["margin"] = 0,
						["texture"] = "HalT",
					},
					["barbgcolor"] = {
						["a"] = 0,
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["barcolor"] = {
						["a"] = 1,
						["b"] = 0.392156862745098,
						["g"] = 0.392156862745098,
						["r"] = 0.392156862745098,
					},
					["background"] = {
						["borderthickness"] = 0,
						["color"] = {
							["a"] = 0,
							["b"] = 0.0784313725490196,
							["g"] = 0.0784313725490196,
							["r"] = 0.0784313725490196,
						},
						["height"] = 154.166549682617,
						["bordertexture"] = "None",
						["margin"] = 0,
						["texture"] = "Solid",
					},
					["classcolorbars"] = true,
					["barfontsize"] = 12,
					["clickthrough"] = false,
					["modeincombat"] = "Healing",
					["version"] = 1,
				}, -- [2]
			},
			["icon"] = {
				["hide"] = true,
			},
			["report"] = {
				["number"] = 2,
				["chantype"] = "channel",
				["channel"] = "hbat",
			},
			["columns"] = {
				["Healing_Percent"] = false,
				["Damage_Percent"] = false,
				["Damage_Damage"] = false,
				["Healed players_Percent"] = true,
				["Healing_Healing"] = false,
				["Healing_HPS"] = true,
			},
			["showranks"] = false,
			["reset"] = {
				["join"] = 1,
			},
		}


    end

		if IsAddOnLoaded('!ClassColors') then
			E:Print(L["A profile for !ClassColors has been created."])
			InstallStepComplete.message = L["AddOn Profiles installed"]
			InstallStepComplete:Show()
  ClassColorsDB = {
    ["DEATHKNIGHT"] = {
      ["r"] = 0.890196078431373,
      ["colorStr"] = "ffe3344d",
      ["g"] = 0.203921568627451,
      ["b"] = 0.301960784313726,
    },
    ["WARRIOR"] = {
      ["r"] = 0.835294117647059,
      ["colorStr"] = "ffd59e7d",
      ["g"] = 0.619607843137255,
      ["b"] = 0.490196078431373,
    },
    ["PALADIN"] = {
      ["r"] = 1,
      ["colorStr"] = "ffff6eb6",
      ["g"] = 0.431372549019608,
      ["b"] = 0.713725490196079,
    },
    ["MAGE"] = {
      ["r"] = 0.364705882352941,
      ["colorStr"] = "ff5cc5ef",
      ["g"] = 0.776470588235294,
      ["b"] = 0.941176470588235,
    },
    ["PRIEST"] = {
      ["r"] = 0.854901960784314,
      ["colorStr"] = "ffdae1dd",
      ["g"] = 0.882352941176471,
      ["b"] = 0.866666666666667,
    },
    ["WARLOCK"] = {
      ["r"] = 0.662745098039216,
      ["colorStr"] = "ffa94cf3",
      ["g"] = 0.298039215686275,
      ["b"] = 0.956862745098039,
    },
    ["ROGUE"] = {
      ["r"] = 1,
      ["colorStr"] = "ffffe36a",
      ["g"] = 0.890196078431373,
      ["b"] = 0.415686274509804,
    },
    ["HUNTER"] = {
      ["r"] = 0.63921568627451,
      ["colorStr"] = "ffa3d437",
      ["g"] = 0.831372549019608,
      ["b"] = 0.215686274509804,
    },
    ["DRUID"] = {
      ["r"] = 1,
      ["colorStr"] = "ffff743e",
      ["g"] = 0.454901960784314,
      ["b"] = 0.243137254901961,
    },
    ["MONK"] = {
      ["r"] = 0.219607843137255,
      ["colorStr"] = "ff38d9b6",
      ["g"] = 0.850980392156863,
      ["b"] = 0.713725490196079,
    },
    ["SHAMAN"] = {
      ["r"] = 0.145098039215686,
      ["colorStr"] = "ff2465ee",
      ["g"] = 0.396078431372549,
      ["b"] = 0.937254901960784,
    },
  }
  end
    
    if IsAddOnLoaded('xCT+') then
      E:Print(L["A profile for xCT has been created. Type /xct to change the profile."])
      xCTSavedDB['profiles']['OOMM'] = {
			["frames"] = {
				["general"] = {
					["showBuffs"] = false,
					["font"] = "ConduitITC",
					["fontOutline"] = "5THICKOUTLINE",
					["showDebuffs"] = false,
					["Y"] = 319,
					["X"] = 1,
					["colors"] = {
						["auras"] = {
							["colors"] = {
								["debuffsGained"] = {
									["color"] = {
										1, -- [1]
										0.1, -- [2]
										0.1, -- [3]
									},
								},
								["buffsGained"] = {
									["color"] = {
										1, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["buffsFaded"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["debuffsFaded"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
						["killingBlow"] = {
							["enabled"] = true,
							["color"] = {
								1, -- [1]
								0.431372549019608, -- [2]
								0.713725490196079, -- [3]
							},
						},
						["combat"] = {
							["colors"] = {
								["combatLeaving"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.890196078431373, -- [2]
										0.411764705882353, -- [3]
									},
								},
								["combatEntering"] = {
									["enabled"] = true,
									["color"] = {
										0.63921568627451, -- [1]
										0.827450980392157, -- [2]
										0.215686274509804, -- [3]
									},
								},
							},
						},
						["interrupts"] = {
							["enabled"] = true,
							["color"] = {
								1, -- [1]
								0.454901960784314, -- [2]
								0.243137254901961, -- [3]
							},
						},
						["reputation"] = {
							["colors"] = {
								["reputationGain"] = {
									["enabled"] = true,
									["color"] = {
										0.63921568627451, -- [1]
										0.827450980392157, -- [2]
										0.215686274509804, -- [3]
									},
								},
								["reputationLoss"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.454901960784314, -- [2]
										0.243137254901961, -- [3]
									},
								},
							},
						},
						["lowResources"] = {
							["colors"] = {
								["lowResourcesMana"] = {
									["enabled"] = true,
									["color"] = {
										0.364705882352941, -- [1]
										0.776470588235294, -- [2]
										0.941176470588235, -- [3]
									},
								},
								["lowResourcesHealth"] = {
									["enabled"] = true,
									["color"] = {
										0.890196078431373, -- [1]
										0.203921568627451, -- [2]
										0.301960784313726, -- [3]
									},
								},
							},
						},
						["honorGains"] = {
							["enabled"] = true,
							["color"] = {
								0.141176470588235, -- [1]
								0.396078431372549, -- [2]
								0.937254901960784, -- [3]
							},
						},
						["dispells"] = {
							["colors"] = {
								["dispellBuffs"] = {
									["enabled"] = true,
									["color"] = {
										0.219607843137255, -- [1]
										0.850980392156863, -- [2]
										0.713725490196079, -- [3]
									},
								},
								["dispellStolen"] = {
									["enabled"] = true,
									["color"] = {
										0.364705882352941, -- [1]
										0.776470588235294, -- [2]
										0.941176470588235, -- [3]
									},
								},
								["dispellDebuffs"] = {
									["enabled"] = true,
									["color"] = {
										0.890196078431373, -- [1]
										0.203921568627451, -- [2]
										0.301960784313726, -- [3]
									},
								},
							},
						},
					},
					["fontSize"] = 16,
					["iconsSize"] = 22,
				},
				["power"] = {
					["fontOutline"] = "5THICKOUTLINE",
					["font"] = "ConduitITC",
					["enabledFrame"] = false,
					["colors"] = {
						["color_SOUL_SHARDS"] = {
							["color"] = {
								0.5, -- [1]
								0.32, -- [2]
								0.55, -- [3]
							},
						},
						["color_HOLY_POWER"] = {
							["color"] = {
								0.95, -- [1]
								0.9, -- [2]
								0.6, -- [3]
							},
						},
						["color_MANA"] = {
							["color"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
							},
						},
						["color_FOCUS"] = {
							["color"] = {
								1, -- [1]
								0.5, -- [2]
								0.25, -- [3]
							},
						},
						["color_CHI"] = {
							["color"] = {
								0.71, -- [1]
								1, -- [2]
								0.92, -- [3]
							},
						},
						["color_RAGE"] = {
							["color"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
							},
						},
						["color_ENERGY"] = {
							["color"] = {
								1, -- [1]
								1, -- [2]
								0, -- [3]
							},
						},
						["color_RUNIC_POWER"] = {
							["color"] = {
								0, -- [1]
								0.82, -- [2]
								1, -- [3]
							},
						},
						["color_RUNES"] = {
							["color"] = {
								0.5, -- [1]
								0.5, -- [2]
								0.5, -- [3]
							},
						},
						["color_ECLIPSE_positive"] = {
							["color"] = {
								0.8, -- [1]
								0.82, -- [2]
								0.6, -- [3]
							},
						},
						["color_ECLIPSE_negative"] = {
							["color"] = {
								0.3, -- [1]
								0.52, -- [2]
								0.9, -- [3]
							},
						},
					},
				},
				["healing"] = {
					["enableRealmNames"] = false,
					["showFriendlyHealers"] = false,
					["secondaryFrame"] = 4,
					["enabledFrame"] = false,
					["font"] = "ConduitITC",
					["fontOutline"] = "5THICKOUTLINE",
					["Y"] = -440,
					["colors"] = {
						["healingTakenCritical"] = {
							["enabled"] = true,
							["color"] = {
								0.219607843137255, -- [1]
								0.850980392156863, -- [2]
								0.713725490196079, -- [3]
							},
						},
						["healingTaken"] = {
							["enabled"] = true,
							["color"] = {
								0.219607843137255, -- [1]
								0.850980392156863, -- [2]
								0.713725490196079, -- [3]
							},
						},
						["healingTakenPeriodic"] = {
							["enabled"] = true,
							["color"] = {
								0.219607843137255, -- [1]
								0.850980392156863, -- [2]
								0.713725490196079, -- [3]
							},
						},
						["shieldTaken"] = {
							["enabled"] = true,
							["color"] = {
								0.854901960784314, -- [1]
								0.882352941176471, -- [2]
								0.866666666666667, -- [3]
							},
						},
						["healingTakenPeriodicCritical"] = {
							["enabled"] = true,
							["color"] = {
								0.219607843137255, -- [1]
								0.850980392156863, -- [2]
								0.713725490196079, -- [3]
							},
						},
					},
					["enableClassNames"] = false,
					["enableOverHeal"] = false,
				},
				["outgoing"] = {
					["font"] = "ConduitITC",
					["fontOutline"] = "5THICKOUTLINE",
					["Height"] = 150,
					["enableScrollable"] = true,
					["insertText"] = "top",
					["Width"] = 256,
					["Y"] = -437,
					["X"] = 368,
					["colors"] = {
						["genericDamage"] = {
							["enabled"] = true,
							["color"] = {
								0.854901960784314, -- [1]
								0.882352941176471, -- [2]
								0.866666666666667, -- [3]
							},
						},
						["healingSpells"] = {
							["colors"] = {
								["healingOut"] = {
									["enabled"] = true,
									["color"] = {
										0.219607843137255, -- [1]
										0.850980392156863, -- [2]
										0.713725490196079, -- [3]
									},
								},
								["shieldOut"] = {
									["enabled"] = true,
									["color"] = {
										0.854901960784314, -- [1]
										0.882352941176471, -- [2]
										0.866666666666667, -- [3]
									},
								},
								["healingOutPeriodic"] = {
									["enabled"] = true,
									["color"] = {
										0.219607843137255, -- [1]
										0.850980392156863, -- [2]
										0.713725490196079, -- [3]
									},
								},
							},
						},
						["spellSchools"] = {
							["colors"] = {
								["SpellSchool_Nature"] = {
									["enabled"] = true,
									["color"] = {
										0.219607843137255, -- [1]
										0.850980392156863, -- [2]
										0.713725490196079, -- [3]
									},
								},
								["SpellSchool_Arcane"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.431372549019608, -- [2]
										0.713725490196079, -- [3]
									},
								},
								["SpellSchool_Frost"] = {
									["enabled"] = true,
									["color"] = {
										0.364705882352941, -- [1]
										0.776470588235294, -- [2]
										0.941176470588235, -- [3]
									},
								},
								["SpellSchool_Physical"] = {
									["enabled"] = true,
									["color"] = {
										0.854901960784314, -- [1]
										0.882352941176471, -- [2]
										0.866666666666667, -- [3]
									},
								},
								["SpellSchool_Shadow"] = {
									["enabled"] = true,
									["color"] = {
										0.662745098039216, -- [1]
										0.298039215686275, -- [2]
										0.952941176470588, -- [3]
									},
								},
								["SpellSchool_Holy"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.890196078431373, -- [2]
										0.411764705882353, -- [3]
									},
								},
								["SpellSchool_Fire"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.454901960784314, -- [2]
										0.243137254901961, -- [3]
									},
								},
							},
						},
						["misstypesOut"] = {
							["color"] = {
								0.5, -- [1]
								0.5, -- [2]
								0.5, -- [3]
							},
						},
					},
					["scrollableLines"] = 60,
				},
				["critical"] = {
					["secondaryFrame"] = 2,
					["enabledFrame"] = false,
					["font"] = "ConduitITC",
					["fontOutline"] = "5THICKOUTLINE",
					["colors"] = {
						["genericDamageCritical"] = {
							["enabled"] = true,
							["color"] = {
								0.854901960784314, -- [1]
								0.882352941176471, -- [2]
								0.866666666666667, -- [3]
							},
						},
						["healingSpells"] = {
							["colors"] = {
								["healingOutCritical"] = {
									["enabled"] = true,
									["color"] = {
										0.219607843137255, -- [1]
										0.850980392156863, -- [2]
										0.713725490196079, -- [3]
									},
								},
							},
						},
					},
				},
				["procs"] = {
					["enabledFrame"] = false,
					["font"] = "ConduitITC",
					["fontOutline"] = "5THICKOUTLINE",
					["colors"] = {
						["spellReactive"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["spellProc"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
					},
				},
				["loot"] = {
					["filterItemQuality"] = 0,
					["showCurrency"] = true,
					["fontOutline"] = "5THICKOUTLINE",
					["secondaryFrame"] = 1,
					["enabledFrame"] = false,
					["font"] = "ConduitITC",
				},
				["class"] = {
					["colors"] = {
						["comboPoints"] = {
							["color"] = {
								1, -- [1]
								0.82, -- [2]
								0, -- [3]
							},
						},
						["comboPointsMax"] = {
							["color"] = {
								0, -- [1]
								0.82, -- [2]
								1, -- [3]
							},
						},
					},
					["enabledFrame"] = false,
					["font"] = "ConduitITC",
					["fontOutline"] = "5THICKOUTLINE",
				},
				["damage"] = {
					["scrollableLines"] = 60,
					["fontOutline"] = "5THICKOUTLINE",
					["enableScrollable"] = true,
					["font"] = "ConduitITC",
					["X"] = -350,
					["Width"] = 224,
					["Y"] = -437,
					["colors"] = {
						["missTypesTaken"] = {
							["colors"] = {
								["missTypeBlock"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeMiss"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeImmune"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.431372549019608, -- [2]
										0.713725490196079, -- [3]
									},
								},
								["missTypeDodge"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeParry"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeReflect"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.431372549019608, -- [2]
										0.713725490196079, -- [3]
									},
								},
								["missTypeResist"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeAbsorb"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeDeflect"] = {
									["color"] = {
										0.5, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeEvade"] = {
									["enabled"] = true,
									["color"] = {
										1, -- [1]
										0.454901960784314, -- [2]
										0.243137254901961, -- [3]
									},
								},
							},
						},
						["damageTakenCritical"] = {
							["enabled"] = true,
							["color"] = {
								0.854901960784314, -- [1]
								0.882352941176471, -- [2]
								0.866666666666667, -- [3]
							},
						},
						["spellDamageTaken"] = {
							["enabled"] = true,
							["color"] = {
								0.364705882352941, -- [1]
								0.776470588235294, -- [2]
								0.941176470588235, -- [3]
							},
						},
						["spellDamageTakenCritical"] = {
							["enabled"] = true,
							["color"] = {
								0.364705882352941, -- [1]
								0.776470588235294, -- [2]
								0.941176470588235, -- [3]
							},
						},
						["damageTaken"] = {
							["enabled"] = true,
							["color"] = {
								0.854901960784314, -- [1]
								0.882352941176471, -- [2]
								0.866666666666667, -- [3]
							},
						},
						["missTypesTakenPartial"] = {
							["colors"] = {
								["missTypeBlockPartial"] = {
									["color"] = {
										0.75, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeResistPartial"] = {
									["color"] = {
										0.75, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
								["missTypeAbsorbPartial"] = {
									["color"] = {
										0.75, -- [1]
										0.5, -- [2]
										0.5, -- [3]
									},
								},
							},
						},
					},
					["Height"] = 147,
				},
			}
    }
    end
    
    if IsAddOnLoaded('DBM-Profiles') then
    E:Print(L["A profile for DBM has been created. Type /dbm and go to options to change the profile."])
      DeadlyBossModsDB['namespaces']['DeadlyBarTimers']['profiles']['OOMM'] = {
        ["DBM"] = {
			["EndColorDB"] = 1,
			["EndColorG"] = 0,
			["StartColorPR"] = 1,
			["Decimal"] = 60,
			["Scale"] = 0.899999976158142,
			["EndColorPB"] = 0.286274509803922,
			["TimerY"] = 269.000549316406,
			["EndColorIB"] = 1,
			["HugeBarYOffset"] = 0,
			["EndColorPR"] = 0.501960784313726,
			["EndColorRB"] = 0.301960784313726,
			["TimerX"] = -290.499237060547,
			["EndColorIR"] = 0.0470588235294118,
			["EndColorPG"] = 0.411764705882353,
			["EndColorRR"] = 0.109803921568627,
			["Texture"] = "Interface\\AddOns\\ElvUI_OOMM\\media\\textures\\HalT.tga",
			["HugeTimerX"] = 24.9999675750732,
			["ExpandUpwards"] = false,
			["TimerPoint"] = "BOTTOMRIGHT",
			["StartColorDR"] = 0.901960784313726,
			["StartColorIR"] = 0.470588235294118,
			["EndColorDG"] = 0,
			["EndColorAB"] = 1,
			["Width"] = 291,
			["HugeTimerPoint"] = "BOTTOM",
			["StartColorAER"] = 1,
			["EndColorIG"] = 0.87843137254902,
			["EndColorAEG"] = 0.0431372549019608,
			["StartColorAEG"] = 0.466666666666667,
			["StartColorAEB"] = 0.458823529411765,
			["StartColorPG"] = 0.776470588235294,
			["StartColorPB"] = 0.419607843137255,
			["EndColorDR"] = 1,
			["StartColorAG"] = 0.545098039215686,
			["HugeTimerY"] = 272.832550048828,
			["HugeBarXOffset"] = 0,
			["EnlargeBarsTime"] = 8,
			["EndColorAR"] = 0.149019607843137,
			["StartColorG"] = 0.701960784313726,
			["StartColorRR"] = 0.501960784313726,
			["StartColorB"] = 0,
			["StartColorAB"] = 1,
			["HugeScale"] = 1.04999995231628,
			["BarYOffset"] = 0,
			["StartColorDG"] = 0.301960784313726,
			["StartColorAR"] = 0.376470588235294,
			["StartColorIG"] = 0.968627450980392,
			["StartColorR"] = 1,
			["FontSize"] = 14,
			["EndColorRG"] = 1,
			["Height"] = 35,
			["EndColorAER"] = 1,
			["StartColorIB"] = 1,
			["EnlargeBarsPercent"] = 0.125,
			["EndColorR"] = 1,
			["StartColorRG"] = 1,
			["StartColorRB"] = 0.501960784313726,
			["Font"] = "Interface\\AddOns\\ElvUI_OOMM\\media\\fonts\\ConduitITC.ttf",
			["EndColorAG"] = 0.384313725490196,
			["EndColorAEB"] = 0.247058823529412,
			["StartColorDB"] = 1,
			["HugeWidth"] = 200,
			["BarXOffset"] = 0,
			["EndColorB"] = 0,
		},
	}

      DeadlyBossModsDB['profiles']['OOMM'] = {
      ["SpecialWarningFont"] = "Interface\\AddOns\\ElvUI_OOMM\\media\\fonts\\ConduitITC.ttf",

    }
    end
      
    if IsAddOnLoaded('MikScrollingBattleText') then
      E:Print(L["A profile for MSBT has been created. Type /mbst to change the profile."])
      InstallStepComplete.message = L["AddOn profiles installed"]
      InstallStepComplete:Show()
      MSBTProfiles_SavedVars['profiles']['OOMM'] = {
			["frostfire"] = {
				["colorR"] = 0.141176470588235,
				["colorG"] = 0.396078431372549,
				["colorB"] = 0.937254901960784,
			},
			["nature"] = {
				["colorR"] = 0.219607843137255,
				["colorG"] = 0.850980392156863,
				["colorB"] = 0.713725490196079,
			},
			["frost"] = {
				["colorB"] = 0.941176470588235,
				["colorG"] = 0.776470588235294,
				["colorR"] = 0.364705882352941,
			},
			["mergeSwingsDisabled"] = true,
			["scrollAreas"] = {
				["Outgoing"] = {
					["direction"] = "Up",
					["scrollWidth"] = 10,
					["stickyTextAlignIndex"] = 3,
					["stickyBehavior"] = "Normal",
					["behavior"] = "MSBT_NORMAL",
					["stickyDirection"] = "Up",
					["scrollHeight"] = 200,
					["offsetX"] = 433,
					["animationStyle"] = "Straight",
					["offsetY"] = -550,
					["textAlignIndex"] = 3,
				},
				["Notification"] = {
					["stickyDirection"] = "Up",
					["offsetX"] = -148,
					["offsetY"] = 285,
					["stickyAnimationStyle"] = "Static",
				},
				["Static"] = {
					["stickyDirection"] = "Up",
					["direction"] = "Up",
					["offsetX"] = -865,
					["offsetY"] = -503,
					["stickyAnimationStyle"] = "Static",
				},
				["Incoming"] = {
					["direction"] = "Up",
					["scrollHeight"] = 200,
					["behavior"] = "MSBT_NORMAL",
					["stickyBehavior"] = "Normal",
					["stickyTextAlignIndex"] = 1,
					["stickyDirection"] = "Up",
					["scrollWidth"] = 10,
					["offsetX"] = -445,
					["animationStyle"] = "Straight",
					["offsetY"] = -550,
					["textAlignIndex"] = 1,
				},
			},
			["block"] = {
				["colorR"] = 0.662745098039216,
				["colorG"] = 0.298039215686275,
				["colorB"] = 0.952941176470588,
			},
			["triggers"] = {
				["MSBT_TRIGGER_KILL_SHOT"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_DECIMATION"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_ELUSIVE_BREW"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_BERSERK"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_SWORD_AND_BOARD"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_RIME"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_THE_ART_OF_WAR"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_VITAL_MISTS"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_FINGERS_OF_FROST"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_MANA_TEA"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_BLINDSIDE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_EXECUTE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_LOW_HEALTH"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_LOCK_AND_LOAD"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_TIDAL_WAVES"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_ULTIMATUM"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_PVP_TRINKET"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_LAVA_SURGE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_SUDDEN_DEATH"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_TASTE_FOR_BLOOD"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_SHOOTING_STARS"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_LOW_PET_HEALTH"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_KILLING_MACHINE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_LOW_MANA"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_MISSILE_BARRAGE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_VICTORY_RUSH"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_SHADOW_INFUSION"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_CLEARCASTING"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_PREDATORS_SWIFTNESS"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_MOLTEN_CORE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_NIGHTFALL"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_HAMMER_OF_WRATH"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_REVENGE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_MAELSTROM_WEAPON"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_BRAIN_FREEZE"] = {
					["disabled"] = true,
				},
				["MSBT_TRIGGER_BLOODSURGE"] = {
					["disabled"] = true,
				},
			},
			["physical"] = {
				["colorB"] = 0.866666666666667,
				["colorG"] = 0.882352941176471,
				["colorR"] = 0.854901960784314,
			},
			["critFontName"] = "ConduitITC",
			["critOutlineIndex"] = 2,
			["animationSpeed"] = 50,
			["dotThrottleDuration"] = 0,
			["critFontSize"] = 16,
			["shadow"] = {
				["colorR"] = 0.662745098039216,
				["colorG"] = 0.298039215686275,
				["colorB"] = 0.952941176470588,
			},
			["crushing"] = {
				["colorR"] = 0.890196078431373,
				["colorG"] = 0.203921568627451,
				["colorB"] = 0.301960784313726,
			},
			["glancing"] = {
				["colorR"] = 0.890196078431373,
				["colorG"] = 0.203921568627451,
				["colorB"] = 0.301960784313726,
			},
			["hideFullOverheals"] = true,
			["arcane"] = {
				["colorG"] = 0.431372549019608,
				["colorB"] = 0.713725490196079,
			},
			["shortenNumbers"] = true,
			["throttleList"] = {
				["Drain Life"] = 1,
			},
			["overheal"] = {
				["colorR"] = 0.219607843137255,
				["colorG"] = 0.850980392156863,
				["colorB"] = 0.713725490196079,
			},
			["absorb"] = {
				["colorG"] = 0.890196078431373,
				["colorB"] = 0.411764705882353,
			},
			["normalFontSize"] = 16,
			["shadowflame"] = {
				["colorR"] = 1,
				["colorG"] = 0.431372549019608,
				["colorB"] = 0.713725490196079,
			},
			["normalFontName"] = "ConduitITC",
			["creationVersion"] = "5.7.143",
			["resist"] = {
				["colorR"] = 0.662745098039216,
				["colorG"] = 0.298039215686275,
				["colorB"] = 0.952941176470588,
			},
			["hideSkills"] = true,
			["events"] = {
				["PET_INCOMING_HOT_CRIT"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_SPELL_DAMAGE"] = {
					["disabled"] = true,
				},
				["INCOMING_SPELL_DOT_CRIT"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["INCOMING_SPELL_PARRY"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["INCOMING_DEFLECT"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["OUTGOING_SPELL_MISS"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_INCOMING_PARRY"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_IMMUNE"] = {
					["fontSize"] = 24,
					["colorG"] = 0.431372549019608,
					["colorB"] = 0.713725490196079,
				},
				["PET_OUTGOING_SPELL_DOT_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
					["colorR"] = 1,
				},
				["OUTGOING_HEAL_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["INCOMING_HEAL"] = {
					["message"] = "+%a",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["PET_OUTGOING_SPELL_ABSORB"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_DEFLECT"] = {
					["disabled"] = true,
				},
				["INCOMING_SPELL_MISS"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_EVADE"] = {
					["fontSize"] = 24,
					["colorG"] = 0.454901960784314,
					["colorB"] = 0.243137254901961,
				},
				["PET_INCOMING_SPELL_DODGE"] = {
					["disabled"] = true,
				},
				["INCOMING_HOT_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["PET_OUTGOING_HEAL"] = {
					["message"] = "+%a",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["PET_OUTGOING_HEAL_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["PET_INCOMING_HEAL_CRIT"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_PARRY"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_IMMUNE"] = {
					["fontSize"] = 24,
					["colorR"] = 1,
					["colorG"] = 0.431372549019608,
					["colorB"] = 0.713725490196079,
				},
				["OUTGOING_SPELL_EVADE"] = {
					["fontSize"] = 24,
					["colorG"] = 0.454901960784314,
					["colorB"] = 0.243137254901961,
				},
				["INCOMING_ABSORB"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_INCOMING_SPELL_BLOCK"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_ENEMY_BUFF"] = {
					["colorR"] = 0.890196078431373,
					["colorG"] = 0.203921568627451,
					["colorB"] = 0.301960784313726,
				},
				["OUTGOING_PARRY"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_INCOMING_BLOCK"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_CP_GAIN"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_DEBUFF_FADE"] = {
					["disabled"] = true,
				},
				["INCOMING_SPELL_DAMAGE"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["NOTIFICATION_SKILL_GAIN"] = {
					["colorR"] = 0.141176470588235,
					["colorG"] = 0.396078431372549,
					["colorB"] = 0.937254901960784,
				},
				["PET_OUTGOING_SPELL_DAMAGE_SHIELD"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_MISS"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_DODGE"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_DODGE"] = {
					["disabled"] = true,
				},
				["OUTGOING_DAMAGE_CRIT"] = {
					["colorR"] = 0.854901960784314,
					["colorG"] = 0.882352941176471,
					["colorB"] = 0.866666666666667,
				},
				["PET_OUTGOING_DODGE"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_SPELL_ABSORB"] = {
					["disabled"] = true,
				},
				["OUTGOING_DISPEL"] = {
					["colorB"] = 0.941176470588235,
					["alwaysSticky"] = true,
					["colorG"] = 0.776470588235294,
					["colorR"] = 0.364705882352941,
					["fontSize"] = 24,
				},
				["PET_OUTGOING_DISPEL"] = {
					["fontSize"] = 24,
					["colorR"] = 0.364705882352941,
					["colorG"] = 0.776470588235294,
					["colorB"] = 0.941176470588235,
				},
				["NOTIFICATION_PC_KILLING_BLOW"] = {
					["colorB"] = 0.713725490196079,
					["fontSize"] = 24,
					["colorG"] = 0.431372549019608,
					["colorR"] = 1,
				},
				["NOTIFICATION_REP_LOSS"] = {
					["colorR"] = 1,
					["colorG"] = 0.454901960784314,
					["colorB"] = 0.243137254901961,
				},
				["INCOMING_HEAL_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["INCOMING_SPELL_INTERRUPT"] = {
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.431372549019608,
					["fontSize"] = 24,
				},
				["OUTGOING_IMMUNE"] = {
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.431372549019608,
					["fontSize"] = 24,
				},
				["NOTIFICATION_HOLY_POWER_CHANGE"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_REFLECT"] = {
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.431372549019608,
					["fontSize"] = 24,
				},
				["INCOMING_SPELL_DAMAGE_SHIELD"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["INCOMING_ENVIRONMENTAL"] = {
					["fontSize"] = 24,
					["colorR"] = 0.890196078431373,
					["colorG"] = 0.203921568627451,
					["colorB"] = 0.301960784313726,
				},
				["INCOMING_SPELL_RESIST"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_INCOMING_HOT"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_ABSORB"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_DOT"] = {
					["message"] = "+%a",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
				},
				["NOTIFICATION_ITEM_BUFF"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_DAMAGE"] = {
					["message"] = "+%a",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
					["colorR"] = 1,
				},
				["PET_INCOMING_IMMUNE"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_DEFLECT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_ALT_POWER_GAIN"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_DAMAGE_SHIELD_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
				},
				["OUTGOING_HEAL"] = {
					["message"] = "+%a",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["PET_OUTGOING_HOT_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["NOTIFICATION_CHI_FULL"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_BLOCK"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_HONOR_GAIN"] = {
					["colorR"] = 0.141176470588235,
					["colorG"] = 0.396078431372549,
					["colorB"] = 0.937254901960784,
				},
				["INCOMING_SPELL_ABSORB"] = {
					["colorB"] = 0.533333333333333,
					["colorG"] = 0.537254901960784,
					["colorR"] = 0.525490196078431,
				},
				["PET_INCOMING_HEAL"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_SPELL_DAMAGE_SHIELD_CRIT"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_RESIST"] = {
					["disabled"] = true,
				},
				["OUTGOING_DODGE"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["NOTIFICATION_POWER_LOSS"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_PARRY"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["INCOMING_PARRY"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_INCOMING_SPELL_IMMUNE"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_SPELL_DEFLECT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_COOLDOWN"] = {
					["skillColorR"] = 0.364705882352941,
					["skillColorG"] = 0.776470588235294,
					["skillColorB"] = 0.941176470588235,
				},
				["INCOMING_SPELL_DAMAGE_CRIT"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["PET_OUTGOING_SPELL_PARRY"] = {
					["disabled"] = true,
				},
				["INCOMING_DAMAGE"] = {
					["colorR"] = 0.854901960784314,
					["colorG"] = 0.882352941176471,
					["colorB"] = 0.866666666666667,
				},
				["INCOMING_DAMAGE_CRIT"] = {
					["colorR"] = 0.854901960784314,
					["colorG"] = 0.882352941176471,
					["colorB"] = 0.866666666666667,
				},
				["OUTGOING_SPELL_DOT_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
				},
				["OUTGOING_SPELL_DEFLECT"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["NOTIFICATION_CP_FULL"] = {
					["disabled"] = true,
				},
				["INCOMING_DODGE"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_SPELL_BLOCK"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_DAMAGE_SHIELD"] = {
					["message"] = "+%a",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
				},
				["OUTGOING_SPELL_BLOCK"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["INCOMING_SPELL_IMMUNE"] = {
					["colorB"] = 0.533333333333333,
					["colorG"] = 0.537254901960784,
					["colorR"] = 0.525490196078431,
				},
				["NOTIFICATION_BUFF_FADE"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_REP_GAIN"] = {
					["colorR"] = 0.63921568627451,
					["colorG"] = 0.827450980392157,
					["colorB"] = 0.215686274509804,
				},
				["INCOMING_HOT"] = {
					["message"] = "+%a",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["OUTGOING_HOT_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["INCOMING_SPELL_DAMAGE_SHIELD_CRIT"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["INCOMING_SPELL_REFLECT"] = {
					["fontSize"] = 24,
					["colorR"] = 1,
					["colorG"] = 0.431372549019608,
					["colorB"] = 0.713725490196079,
				},
				["PET_INCOMING_SPELL_DAMAGE_SHIELD"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_SPELL_EVADE"] = {
					["fontSize"] = 24,
					["colorG"] = 0.454901960784314,
					["colorB"] = 0.243137254901961,
				},
				["PET_OUTGOING_DEFLECT"] = {
					["disabled"] = true,
				},
				["OUTGOING_EVADE"] = {
					["colorB"] = 0.243137254901961,
					["colorG"] = 0.454901960784314,
					["fontSize"] = 24,
				},
				["INCOMING_IMMUNE"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["OUTGOING_SPELL_INTERRUPT"] = {
					["fontSize"] = 24,
					["colorG"] = 0.431372549019608,
					["colorB"] = 0.713725490196079,
				},
				["INCOMING_BLOCK"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["OUTGOING_SPELL_DODGE"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["OUTGOING_SPELL_ABSORB"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_HOT"] = {
					["message"] = "+%a",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["INCOMING_SPELL_DEFLECT"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["OUTGOING_MISS"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["NOTIFICATION_SHADOW_ORBS_FULL"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_DAMAGE"] = {
					["message"] = "+%a",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
				},
				["PET_OUTGOING_SPELL_DAMAGE_SHIELD_CRIT"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_IMMUNE"] = {
					["fontSize"] = 24,
					["colorR"] = 1,
					["colorG"] = 0.431372549019608,
					["colorB"] = 0.713725490196079,
				},
				["OUTGOING_DAMAGE"] = {
					["colorR"] = 0.854901960784314,
					["colorG"] = 0.882352941176471,
					["colorB"] = 0.866666666666667,
				},
				["PET_INCOMING_MISS"] = {
					["disabled"] = true,
				},
				["INCOMING_SPELL_DODGE"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_INCOMING_SPELL_RESIST"] = {
					["disabled"] = true,
				},
				["PET_OUTGOING_DAMAGE_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.866666666666667,
					["colorG"] = 0.882352941176471,
					["colorR"] = 0.854901960784314,
				},
				["NOTIFICATION_MONEY"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["PET_INCOMING_SPELL_MISS"] = {
					["disabled"] = true,
				},
				["INCOMING_SPELL_DOT"] = {
					["colorG"] = 0.890196078431373,
					["colorB"] = 0.411764705882353,
				},
				["PET_INCOMING_SPELL_DOT_CRIT"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_DAMAGE"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_SPELL_DOT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_NPC_KILLING_BLOW"] = {
					["colorR"] = 1,
					["colorG"] = 0.431372549019608,
					["fontSize"] = 24,
					["disabled"] = false,
					["colorB"] = 0.713725490196079,
				},
				["NOTIFICATION_COMBAT_ENTER"] = {
					["colorR"] = 0.63921568627451,
					["colorG"] = 0.827450980392157,
					["colorB"] = 0.215686274509804,
				},
				["NOTIFICATION_SHADOW_ORBS_CHANGE"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_BUFF"] = {
					["disabled"] = true,
				},
				["OUTGOING_SPELL_DAMAGE_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
				},
				["PET_OUTGOING_SPELL_DOT"] = {
					["message"] = "+%a",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
					["colorR"] = 1,
				},
				["INCOMING_SPELL_BLOCK"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_MISS"] = {
					["disabled"] = true,
				},
				["INCOMING_MISS"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_DAMAGE"] = {
					["message"] = "+%a",
					["colorB"] = 0.866666666666667,
					["colorG"] = 0.882352941176471,
					["colorR"] = 0.854901960784314,
				},
				["NOTIFICATION_ITEM_BUFF_FADE"] = {
					["disabled"] = true,
				},
				["OUTGOING_ABSORB"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_SPELL_DAMAGE_CRIT"] = {
					["message"] = "+%a!",
					["colorB"] = 0.411764705882353,
					["colorG"] = 0.890196078431373,
					["colorR"] = 1,
				},
				["NOTIFICATION_ITEM_COOLDOWN"] = {
					["skillColorR"] = 0.364705882352941,
					["skillColorG"] = 0.776470588235294,
					["skillColorB"] = 0.941176470588235,
				},
				["NOTIFICATION_CHI_CHANGE"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_DEBUFF_STACK"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_COMBAT_LEAVE"] = {
					["colorR"] = 0.835294117647059,
					["colorG"] = 0.619607843137255,
					["colorB"] = 0.490196078431373,
				},
				["PET_INCOMING_SPELL_PARRY"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_HOLY_POWER_FULL"] = {
					["disabled"] = true,
				},
				["OUTGOING_HOT"] = {
					["message"] = "+%a",
					["colorB"] = 0.713725490196079,
					["colorG"] = 0.850980392156863,
					["colorR"] = 0.219607843137255,
				},
				["OUTGOING_BLOCK"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["NOTIFICATION_POWER_GAIN"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_ALT_POWER_LOSS"] = {
					["disabled"] = true,
				},
				["PET_INCOMING_SPELL_DAMAGE_CRIT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_BUFF_STACK"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_EXTRA_ATTACK"] = {
					["disabled"] = true,
				},
				["OUTGOING_DEFLECT"] = {
					["colorR"] = 0.525490196078431,
					["colorG"] = 0.537254901960784,
					["colorB"] = 0.533333333333333,
				},
				["PET_OUTGOING_ABSORB"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_MONSTER_EMOTE"] = {
					["colorR"] = 0.854901960784314,
					["colorG"] = 0.882352941176471,
					["colorB"] = 0.866666666666667,
				},
				["PET_INCOMING_DAMAGE_CRIT"] = {
					["disabled"] = true,
				},
				["NOTIFICATION_PET_COOLDOWN"] = {
					["skillColorR"] = 0.364705882352941,
					["skillColorG"] = 0.776470588235294,
					["skillColorB"] = 0.941176470588235,
				},
				["NOTIFICATION_LOOT"] = {
					["colorR"] = 0.63921568627451,
					["colorG"] = 0.827450980392157,
					["colorB"] = 0.215686274509804,
				},
				["NOTIFICATION_DEBUFF"] = {
					["disabled"] = true,
				},
			},
			["holy"] = {
				["colorG"] = 0.890196078431373,
				["colorB"] = 0.411764705882353,
			},
			["normalOutlineIndex"] = 2,
			["fire"] = {
				["colorG"] = 0.454901960784314,
				["colorB"] = 0.243137254901961,
			},
			["hideNames"] = true,
			["qualityExclusions"] = {
				[0] = false,
			},
		}
    end
  end
end

function E:InstallComplete()
  E.private.install_complete = E.version
  
  ReloadUI()
end
 