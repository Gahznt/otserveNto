local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)


arr1 = {
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1}
}

arr2 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 2, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)

local waittime = 4 -- Tempo de exhaustion
local storage = 8244

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position1 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position5 = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell2, 500, parameters)
doSendMagicEffect(position1, 177)
doSendMagicEffect(position2, 177)
doSendMagicEffect(position3, 177)
doSendMagicEffect(position4, 177)
doSendMagicEffect(position5, 51)
exhaustion.set(cid, storage, waittime)
return TRUE
end 