local E, L, V, P, G = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

local ElvUF = ElvUI.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")
local twipe = table.wipe
local ceil, sqrt = math.ceil, math.sqrt
local format = string.format
------------------------------------------------------------------------
--	Tags
------------------------------------------------------------------------
-- Adding uppercase tags for names

  
ElvUF.Tags.Events['name:veryshort-u'] = 'UNIT_NAME_UPDATE'
ElvUF.Tags.Methods['name:veryshort-u'] = function(unit)
	local name = string.upper(UnitName(unit))
	return name ~= nil and E:ShortenString(name, 4) or ''
end

ElvUF.Tags.Events['name:short-u'] = 'UNIT_NAME_UPDATE'
ElvUF.Tags.Methods['name:short-u'] = function(unit)
	local name = string.upper(UnitName(unit))
	return name ~= nil and E:ShortenString(name, 10) or ''
end

ElvUF.Tags.Events['name:medium-u'] = 'UNIT_NAME_UPDATE UNIT_HEALTH_FREQUENT'
ElvUF.Tags.Methods['name:medium-u'] = function(unit)
	local name = string.upper(UnitName(unit))
  local status = UnitIsDead(unit) and DEAD or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]
  local length = 18
  local hp = UnitHealth(unit)/UnitHealthMax(unit)
  if (status) or hp < 1 then length = 13;  end
	return name ~= nil and E:ShortenString(name, length) or ''
end

ElvUF.Tags.Events['name:long-u'] = 'UNIT_NAME_UPDATE'
ElvUF.Tags.Methods['name:long-u'] = function(unit)
	local name = string.upper(UnitName(unit))
	return name ~= nil and E:ShortenString(name, 20) or ''
end

-- Hiding % if 100

ElvUF.Tags.Events['health:percent-h'] = 'UNIT_HEALTH_FREQUENT UNIT_MAXHEALTH UNIT_CONNECTION PLAYER_FLAGS_CHANGED'
ElvUF.Tags.Methods['health:percent-h'] = function(unit)
	local status = UnitIsDead(unit) and DEAD or UnitIsGhost(unit) and L["Ghost"] or not UnitIsConnected(unit) and L["Offline"]

	if (status) then
		return status
	else
    local percent = UnitHealth(unit)/UnitHealthMax(unit)
    if percent == 1 then return '' end
		return E:GetFormattedText('PERCENT', UnitHealth(unit), UnitHealthMax(unit))
	end
end

--[[ nyi
ElvUF.Tags.Events['havoc'] = 'UNIT_AURA'
ElvUF.Tags.Methods['havoc'] = function(unit)
	local _,_,_,_,_,duration = UnitAura("boss1", "Havoc", nil, "PLAYER|HARMFUL")
	local _,_,_,count = UnitAura("player", "Havoc")
  local havoc = count ~= nil and count
	return count ~= nil and format(havoc) or ''
end
]]--