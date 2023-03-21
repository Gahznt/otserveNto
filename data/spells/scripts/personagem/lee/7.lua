local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 134)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1600, -9.0, -1800)

arr1 = {
	{0, 0, 0, 0, 0, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 3, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

 
function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 5449

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position1 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
doSendMagicEffect(position1, 518)
doSendMagicEffect(position2, 519)
doSendMagicEffect(position3, 520)
doSendMagicEffect(position4, 521)
exhaustion.set(cid, storage, waittime)
return TRUE
end 