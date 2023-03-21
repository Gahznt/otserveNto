local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -6.0, -1400, -6.0, -1600)


arr1 = {
	{3}
}



local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 5529

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local parameters = { cid = cid, var = var}
local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z} --- efeito caster
doSendMagicEffect(positionME, 546) 
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 200, {x = pos.x+2, y = pos.y, z = pos.z}, 199)
addEvent(onCastSpell1, 400, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 