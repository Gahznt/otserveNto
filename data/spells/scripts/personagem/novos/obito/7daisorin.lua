function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 1.1 + maglevel * 1.3) * 1.4
    max = -(level * 1.8 + maglevel * 2) * 1.6 
    return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
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
local waittime = 1.4 -- Tempo de exhaustion
local storage = 8242

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster

for i = 1, 3 do
    addEvent(doSendMagicEffect, i * 200, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
    addEvent(doSendDistanceShoot, i * 200, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
    addEvent(onCastSpell1, i * 200, parameters)
    addEvent(doSendMagicEffect, i * 200, {x = pos.x+3, y = pos.y+3, z = pos.z}, 650)
    addEvent(doSendDistanceShoot, i * 200, {x = pos.x+3, y = pos.y+3, z = pos.z}, pos, 127)
    addEvent(onCastSpell1, i * 200, parameters)
    addEvent(doSendMagicEffect, i * 200, {x = pos.x-3, y = pos.y+3, z = pos.z}, 650)
    addEvent(doSendDistanceShoot, i * 200, {x = pos.x-3, y = pos.y+3, z = pos.z}, pos, 127)
    addEvent(onCastSpell1, i * 200, parameters)
    addEvent(doSendMagicEffect, i * 200, {x = pos.x-3, y = pos.y-3, z = pos.z}, 650)
    addEvent(doSendDistanceShoot, i * 200, {x = pos.x-3, y = pos.y-3, z = pos.z}, pos, 127)
    addEvent(onCastSpell1, i * 200, parameters)
    addEvent(doSendMagicEffect, i * 200, {x = pos.x+3, y = pos.y-3, z = pos.z}, 650)
    addEvent(doSendDistanceShoot, i * 200, {x = pos.x+3, y = pos.y-3, z = pos.z}, pos, 127)
    addEvent(onCastSpell1, i * 200, parameters)
end
exhaustion.set(cid, storage, waittime)
return TRUE
end 
