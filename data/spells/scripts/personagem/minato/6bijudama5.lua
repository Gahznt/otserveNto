function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 4 + maglevel * 4) * 4
    max = -(level * 4.8 + maglevel * 4.8) * 4.8 
    return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues") 


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 6221

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y, z = pos.z}, 82)
addEvent(doTeleportThing(cid,pos), 200)
addEvent(doSendMagicEffect, 200, {x = pos.x+3, y = pos.y, z = pos.z}, 344)
addEvent(doSendMagicEffect, 900, {x = pos.x+1, y = pos.y, z = pos.z}, 82)
addEvent(onCastSpell1, 600, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 