local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -12.0, -1800)


arr1 = {
	{3}
}



local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8013

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z} --- efeito caster
doSendMagicEffect(positionME, 547) 
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 200, {x = pos.x, y = pos.y, z = pos.z}, 551)
addEvent(onCastSpell1, 400, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 