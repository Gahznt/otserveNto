local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.25, -400, -2.25, -450)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}


local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8242

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = poz.x+1, y = poz.y+1, z = poz.z}, 345)
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y+1, z = poz.z}, 345)
addEvent(onCastSpell1, 300, parameters)
addEvent(doSendMagicEffect, 500, {x = poz.x+1, y = poz.y+1, z = poz.z}, 345)
addEvent(onCastSpell1, 500, parameters)
addEvent(doSendMagicEffect, 700, {x = poz.x+1, y = poz.y+1, z = poz.z}, 345)
addEvent(onCastSpell1, 700, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 